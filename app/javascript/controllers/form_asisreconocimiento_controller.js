
import { Controller } from "@hotwired/stimulus"
import { Turbo, cable } from "@hotwired/turbo-rails"

export default class extends Controller {
  connect() {
    console.log('stimulus conectado a form de asisreconocimiento apo214');
  }
  reset() {
    this.element.reset()
    // Reset despues de autocompletar
    this.element.elements[2].removeAttribute("value");
    this.element.elements[3].removeAttribute("value");
    this.element.elements[4].value = null;
  }
}

