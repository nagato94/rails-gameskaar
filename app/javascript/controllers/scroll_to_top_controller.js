import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-top"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    this.update();
    window.addEventListener("scroll", this.update);
  }

  disconnect() {
    window.removeEventListener("scroll", this.update);
  }

  update = () => {
    if (window.scrollY > 100) {
      this.buttonTarget.classList.add("show");
    } else {
      this.buttonTarget.classList.remove("show");
    }
  }

  scrollToTop() {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
}
