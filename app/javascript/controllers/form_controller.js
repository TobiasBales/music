import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  submit(e) {
    Object.keys(e.detail).forEach((key) => {
      const value = e.detail[key];
      const element = this.element.querySelector(`[name='${key}']`);
      if (element) {
        element.value = value;
      }
    });
    this.element.querySelector('form').requestSubmit();
  }
}
