import * as Hooks from "./hooks";

function components() {
  window.storybook = {};
  window.storybook.Hooks = Hooks;
}

components();
