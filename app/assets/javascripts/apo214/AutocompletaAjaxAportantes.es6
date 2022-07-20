
export default class Apo214AutocompletaAjaxAportantes {
  /* No usamos constructor ni this porque en operaElegida sería
   * del objeto AutocompletaAjaxExpreg y no esta clase.
   * Más bien en esta todo static
   */

  // Elije una persona en autocompletación
  static operarElegida (eorig, cadpersona, id, otrosop) {
    let root = window
    console.log(root)
    sip_arregla_puntomontaje(root)
    const cs = id.split(';')
    const idPersona = cs[0]
    const divcp = eorig.target.closest('.' + 
      Apo214AutocompletaAjaxAportantes.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        Apo214AutocompletaAjaxAportantes.claseEnvoltura)
      return
    }
    const elemIdAportante = divcp.parentElement.querySelector('.lp_aportante')
      .querySelector('input')
    if (elemIdAportante == null) {
      window.alert('No se ubico .lp_aportante')
      return
    }
    const idlp = elemIdAportante.value

    let d = 'id_persona=' + idPersona
    d += "&id_lugarpreliminar=" + idlp
    const a = root.puntomontaje + 'personas/remplazar'

    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' +
        Apo214AutocompletaAjaxAportantes.claseEnvoltura)
        let r = resp.querySelector('.' + Apo214AutocompletaAjaxAportantes.claseEnvoltura)
        debugger
        divcp.innerHTML=r.innerHTML
        document.dispatchEvent(new Event('sivel2_gen:autocompletada-victima'))
      },
      error: (resp, estado, xhr) => {
        window.alert('Error con ajax ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Apo214AutocompletaAjaxAportantes")
    let url = window.puntomontaje + 'apo214/personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [ /^lugarpreliminar_persona_attributes_nombres$/,
        /^lugarpreliminar_persona_attributes_apellidos$/,
        /^lugarpreliminar_persona_attributes_numerodocumento$/ ],
      url,
      Apo214AutocompletaAjaxAportantes.idDatalist,
      Apo214AutocompletaAjaxAportantes.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Apo214AutocompletaAjaxAportantes asi: 
Apo214AutocompletaAjaxAportantes.claseEnvoltura = 'campos_persona'
Apo214AutocompletaAjaxAportantes.idDatalist = 'fuente-aportantes'
