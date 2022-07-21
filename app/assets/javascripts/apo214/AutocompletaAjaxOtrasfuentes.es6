
export default class Apo214AutocompletaAjaxOtrasfuentes {
  /* No usamos constructor ni this porque en operaElegida sería
   * del objeto AutocompletaAjaxExpreg y no esta clase.
   * Más bien en esta todo static
   */


  // Elije una persona en autocompletación
  static operarElegida (eorig, cadpersona, id, otrosop) {
    let root = window
    sip_arregla_puntomontaje(root)
    const cs = id.split(';')
    const idPersona = cs[0]
    const divcp = eorig.target.closest('.' + 
      Apo214AutocompletaAjaxOtrasfuentes.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        Apo214AutocompletaAjaxOtrasfuentes.claseEnvoltura)
      return
    }
    const elemIdOtrafuente = divcp.querySelector('input')
    if (elemIdOtrafuente == null) {
      window.alert('No se ubico .campos_otrafuente')
      return
    }
    const id_listapersofuentes = elemIdOtrafuente.id.split("_")[3]

    let d = 'id_persona=' + idPersona
    d += "&id_listapersofuentes=" + id_listapersofuentes
    const a = root.puntomontaje + 'personas/remplazarotrafuente'

    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Apo214AutocompletaAjaxOtrasfuentes.claseEnvoltura)
        let r = resp.querySelector('.' + Apo214AutocompletaAjaxOtrasfuentes.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error con ajax ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Apo214AutocompletaAjaxOtrasfuentes")
    let url = window.puntomontaje + 'apo214/personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [ /^lugarpreliminar_listapersofuentes_attributes_[0-9]*_personafuente_attributes_nombres$/,
        /^lugarpreliminar_listapersofuentes_attributes_[0-9]*_personafuente_attributes_apellidos$/,
        /^lugarpreliminar_listapersofuentes_attributes_[0-9]*_personafuente_attributes_numerodocumento$/ ],
      url,
      Apo214AutocompletaAjaxOtrasfuentes.idDatalist,
      Apo214AutocompletaAjaxOtrasfuentes.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Apo214AutocompletaAjaxOtrasfuentes asi: 
Apo214AutocompletaAjaxOtrasfuentes.claseEnvoltura = 'campos_otrafuente'
Apo214AutocompletaAjaxOtrasfuentes.idDatalist = 'fuente-otrasfuentes'