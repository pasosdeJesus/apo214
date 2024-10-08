
export default class Apo214__Motor {
  /* 
   * Librería de funciones comunes.
   * Aunque no es un controlador lo dejamos dentro del directorio
   * controllers para aprovechar método de msip para compartir controladores
   * Stimulus de motores.
   *
   * Como su nombre no termina en _controller no será incluido en 
   * controllers/index.js
   *
   * Desde controladores stimulus importelo con
   *
   *  import Apo214__Motor from "../apo214/motor"
   *
   * Use funciones por ejemplo con
   *
   *  Apo214__Motor.ejecutarAlCargarPagina()
   *
   * Para poderlo usar desde Javascript global con window.Apo214__Motor 
   * asegure que en app/javascript/application.js ejecuta:
   *
   * import Apo214__Motor from './controllers/apo214/motor.js'
   * window.Apo214__Motor = Apo214__Motor
   *
   */


  // Se ejecuta cada vez que se carga una página que no está en cache
  // y tipicamente después de que se ha cargado la página y los recursos.
  static ejecutarAlCargarDocumentoYRecursos() {
    console.log("* Corriendo Apo214__Motor::ejecutarAlCargarDocumentoYRecursos()")
  }

  // Llamar cada vez que se cargue una página detectada con turbo:load
  // Tal vez en cache por lo que podría no haberse ejecutado iniciar 
  // nuevamente.
  // Podría ser llamada varias veces consecutivas por lo que debe detectarlo
  // para no ejecutar dos veces lo que no conviene.
  static ejecutarAlCargarPagina() {
    console.log("* Corriendo Apo214__Motor::ejecutarAlCargarPagina()")
  }

  // Se ejecuta desde app/javascript/application.js tras importar el motor
  static iniciar() {
    console.log("* Corriendo Apo214__Motor::iniciar()")
  }

}
