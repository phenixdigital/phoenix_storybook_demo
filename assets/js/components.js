import * as LiveView from "phoenix_live_view";
import * as Phoenix from "phoenix";
import * as Hooks from "./hooks";

(function () {
  window.storybook = { Hooks, LiveView, Phoenix };
})();
