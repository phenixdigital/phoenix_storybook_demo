import "phoenix_html";
import { LiveSocket, ViewHook } from "phoenix_live_view";
import { Socket } from "phoenix";
import * as Hooks from "./hooks";
import "./components";

(function () {
  window.storybook = {
    Hooks,
    LiveView: { LiveSocket, ViewHook },
    Phoenix: { Socket },
  };
})();

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");

let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: window.storybook.Hooks,
  uploaders: window.storybook.Uploaders,
});

liveSocket.connect();

const hookDefinitions = liveSocket.hooks || {};
const hookProtoMatches = Object.fromEntries(
  Object.entries(hookDefinitions).map(([name, hook]) => [
    name,
    Boolean(hook && hook.prototype instanceof ViewHook),
  ]),
);

console.warn("[storybook] hook ViewHook matches", {
  anyClassExtendsViewHook: Object.values(hookProtoMatches).some(Boolean),
  hookProtoMatches,
});

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;
