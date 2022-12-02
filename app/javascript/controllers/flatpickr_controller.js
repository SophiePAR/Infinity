import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      enableTime: true
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
  }
}