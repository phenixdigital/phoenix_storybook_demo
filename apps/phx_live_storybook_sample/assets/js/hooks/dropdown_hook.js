export const DropdownHook = {
  mounted() {
    const toggleButton = this.el.querySelector(".toggle-button");
    const dropdownContent = this.el.querySelector(".dropdown-content");
    const dropdownContentClass = this.el.dataset.contentClass;

    toggleButton.addEventListener("click", function (event) {
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
  },
};
