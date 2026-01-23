import { ViewHook } from "phoenix_live_view";

export class DropdownHook extends ViewHook {
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

    this.boundDocumentClick = this.onDocumentClick.bind(this);
    document.addEventListener("click", this.boundDocumentClick);
  }

  destroyed() {
    document.removeEventListener("click", this.boundDocumentClick);
  }

  onDocumentClick() {
    const dropdownContent = this.el.querySelector(".dropdown-content");
    if (!dropdownContent.classList.contains("hidden")) {
      dropdownContent.classList = "dropdown-content hidden";
    }
  }
}
