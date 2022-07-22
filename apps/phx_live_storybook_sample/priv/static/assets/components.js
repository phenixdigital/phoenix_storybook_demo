(() => {
  var __defProp = Object.defineProperty;
  var __export = (target, all) => {
    for (var name in all)
      __defProp(target, name, { get: all[name], enumerable: true });
  };

  // js/hooks/index.js
  var hooks_exports = {};
  __export(hooks_exports, {
    DropdownHook: () => DropdownHook
  });

  // js/hooks/dropdown_hook.js
  var DropdownHook = {
    mounted() {
      const toggleButton = this.el.querySelector(".toggle-button");
      const dropdownContent = this.el.querySelector(".dropdown-content");
      const dropdownContentClass = this.el.dataset.contentClass;
      toggleButton.addEventListener("click", function(event) {
        if (dropdownContent.classList.contains("hidden")) {
          dropdownContent.classList = dropdownContentClass;
        }
        event.stopPropagation();
      });
      document.addEventListener("click", this.onDocumentClick.bind(this));
    },
    destroyed() {
      document.removeEventListener("click", this.onDocumentClick);
    },
    onDocumentClick() {
      const dropdownContent = this.el.querySelector(".dropdown-content");
      if (!dropdownContent.classList.contains("hidden")) {
        dropdownContent.classList = "dropdown-content hidden";
      }
    }
  };

  // js/components.js
  function components() {
    window.storybook = {};
    window.storybook.Hooks = hooks_exports;
  }
  components();
})();
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vYXNzZXRzL2pzL2hvb2tzL2luZGV4LmpzIiwgIi4uLy4uLy4uL2Fzc2V0cy9qcy9ob29rcy9kcm9wZG93bl9ob29rLmpzIiwgIi4uLy4uLy4uL2Fzc2V0cy9qcy9jb21wb25lbnRzLmpzIl0sCiAgInNvdXJjZXNDb250ZW50IjogWyJleHBvcnQgKiBmcm9tIFwiLi9kcm9wZG93bl9ob29rXCI7XG4iLCAiZXhwb3J0IGNvbnN0IERyb3Bkb3duSG9vayA9IHtcbiAgbW91bnRlZCgpIHtcbiAgICBjb25zdCB0b2dnbGVCdXR0b24gPSB0aGlzLmVsLnF1ZXJ5U2VsZWN0b3IoXCIudG9nZ2xlLWJ1dHRvblwiKTtcbiAgICBjb25zdCBkcm9wZG93bkNvbnRlbnQgPSB0aGlzLmVsLnF1ZXJ5U2VsZWN0b3IoXCIuZHJvcGRvd24tY29udGVudFwiKTtcbiAgICBjb25zdCBkcm9wZG93bkNvbnRlbnRDbGFzcyA9IHRoaXMuZWwuZGF0YXNldC5jb250ZW50Q2xhc3M7XG5cbiAgICB0b2dnbGVCdXR0b24uYWRkRXZlbnRMaXN0ZW5lcihcImNsaWNrXCIsIGZ1bmN0aW9uIChldmVudCkge1xuICAgICAgaWYgKGRyb3Bkb3duQ29udGVudC5jbGFzc0xpc3QuY29udGFpbnMoXCJoaWRkZW5cIikpIHtcbiAgICAgICAgZHJvcGRvd25Db250ZW50LmNsYXNzTGlzdCA9IGRyb3Bkb3duQ29udGVudENsYXNzO1xuICAgICAgfVxuICAgICAgZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7XG4gICAgfSk7XG5cbiAgICBkb2N1bWVudC5hZGRFdmVudExpc3RlbmVyKFwiY2xpY2tcIiwgdGhpcy5vbkRvY3VtZW50Q2xpY2suYmluZCh0aGlzKSk7XG4gIH0sXG4gIGRlc3Ryb3llZCgpIHtcbiAgICBkb2N1bWVudC5yZW1vdmVFdmVudExpc3RlbmVyKFwiY2xpY2tcIiwgdGhpcy5vbkRvY3VtZW50Q2xpY2spO1xuICB9LFxuICBvbkRvY3VtZW50Q2xpY2soKSB7XG4gICAgY29uc3QgZHJvcGRvd25Db250ZW50ID0gdGhpcy5lbC5xdWVyeVNlbGVjdG9yKFwiLmRyb3Bkb3duLWNvbnRlbnRcIik7XG4gICAgaWYgKCFkcm9wZG93bkNvbnRlbnQuY2xhc3NMaXN0LmNvbnRhaW5zKFwiaGlkZGVuXCIpKSB7XG4gICAgICBkcm9wZG93bkNvbnRlbnQuY2xhc3NMaXN0ID0gXCJkcm9wZG93bi1jb250ZW50IGhpZGRlblwiO1xuICAgIH1cbiAgfSxcbn07XG4iLCAiaW1wb3J0ICogYXMgSG9va3MgZnJvbSBcIi4vaG9va3NcIjtcblxuZnVuY3Rpb24gY29tcG9uZW50cygpIHtcbiAgd2luZG93LnN0b3J5Ym9vayA9IHt9O1xuICB3aW5kb3cuc3Rvcnlib29rLkhvb2tzID0gSG9va3M7XG59XG5cbmNvbXBvbmVudHMoKTtcbiJdLAogICJtYXBwaW5ncyI6ICI7Ozs7Ozs7O0FBQUE7QUFBQTtBQUFBO0FBQUE7OztBQ0FPLE1BQU0sZUFBZTtBQUFBLElBQzFCLFVBQVU7QUFDUixZQUFNLGVBQWUsS0FBSyxHQUFHLGNBQWMsZ0JBQWdCO0FBQzNELFlBQU0sa0JBQWtCLEtBQUssR0FBRyxjQUFjLG1CQUFtQjtBQUNqRSxZQUFNLHVCQUF1QixLQUFLLEdBQUcsUUFBUTtBQUU3QyxtQkFBYSxpQkFBaUIsU0FBUyxTQUFVLE9BQU87QUFDdEQsWUFBSSxnQkFBZ0IsVUFBVSxTQUFTLFFBQVEsR0FBRztBQUNoRCwwQkFBZ0IsWUFBWTtBQUFBLFFBQzlCO0FBQ0EsY0FBTSxnQkFBZ0I7QUFBQSxNQUN4QixDQUFDO0FBRUQsZUFBUyxpQkFBaUIsU0FBUyxLQUFLLGdCQUFnQixLQUFLLElBQUksQ0FBQztBQUFBLElBQ3BFO0FBQUEsSUFDQSxZQUFZO0FBQ1YsZUFBUyxvQkFBb0IsU0FBUyxLQUFLLGVBQWU7QUFBQSxJQUM1RDtBQUFBLElBQ0Esa0JBQWtCO0FBQ2hCLFlBQU0sa0JBQWtCLEtBQUssR0FBRyxjQUFjLG1CQUFtQjtBQUNqRSxVQUFJLENBQUMsZ0JBQWdCLFVBQVUsU0FBUyxRQUFRLEdBQUc7QUFDakQsd0JBQWdCLFlBQVk7QUFBQSxNQUM5QjtBQUFBLElBQ0Y7QUFBQSxFQUNGOzs7QUN0QkEsd0JBQXNCO0FBQ3BCLFdBQU8sWUFBWSxDQUFDO0FBQ3BCLFdBQU8sVUFBVSxRQUFRO0FBQUEsRUFDM0I7QUFFQSxhQUFXOyIsCiAgIm5hbWVzIjogW10KfQo=
