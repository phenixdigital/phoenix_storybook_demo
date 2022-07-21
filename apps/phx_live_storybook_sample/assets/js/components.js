import * as Hooks from "./hooks";

function components() {
  console.log("here");
  window.storybook = {};
  window.storybook.Hooks = Hooks;
}

components();
