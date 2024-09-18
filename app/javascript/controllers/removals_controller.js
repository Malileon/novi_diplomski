import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="removals"
export default class extends Controller {
  connect() {
    console.log("opet sam tu");
  }
  remove() {
    console.log("tusam");
    setTimeout(5000);
    this.element.remove();
  }
}
