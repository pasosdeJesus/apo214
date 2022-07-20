
export default class Apo214AutocompletaAjaxDepositados {
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
      Apo214AutocompletaAjaxDepositados.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        Apo214AutocompletaAjaxDepositados.claseEnvoltura)
      return
    }
    const elemIdDepositado = divcp.querySelector('input')
    if (elemIdDepositado == null) {
      window.alert('No se ubico .campos_depositado')
      return
    }
    const id_listadepositados = elemIdDepositado.id.split("_")[3]

    let d = 'id_persona=' + idPersona
    d += "&id_listadepositados=" + id_listadepositados
    const a = root.puntomontaje + 'personas/remplazardepositado'

    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Apo214AutocompletaAjaxDepositados.claseEnvoltura)
        let r = resp.querySelector('.' + Apo214AutocompletaAjaxDepositados.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error con ajax ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Apo214AutocompletaAjaxDepositados")
    let url = window.puntomontaje + 'apo214/personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [ /^lugarpreliminar_listadepositados_attributes_[0-9]*_personadepositada_attributes_nombres$/,
        /^lugarpreliminar_listadepositados_attributes_[0-9]*_personadepositada_attributes_apellidos$/,
        /^lugarpreliminar_listadepositados_attributes_[0-9]*_personadepositada_attributes_numerodocumento$/ ],
      url,
      Apo214AutocompletaAjaxDepositados.idDatalist,
      Apo214AutocompletaAjaxDepositados.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Apo214AutocompletaAjaxDepositados asi: 
Apo214AutocompletaAjaxDepositados.claseEnvoltura = 'campos_depositado'
Apo214AutocompletaAjaxDepositados.idDatalist = 'fuente-depositados'
