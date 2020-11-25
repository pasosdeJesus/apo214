// Funciones javascript del motor apo214

apo214_busca_aportante = function(s) {
  var cnom, divcp, root, v;
  root = window;
  sip_arregla_puntomontaje(root);
  cnom = s.attr('id');
  v = $("#" + cnom).data('autocompleta');
  if (v !== 1 && v !== "no") {
    $("#" + cnom).data('autocompleta', 1);
    divcp = s.closest('#aportantepreliminar');
    if (typeof divcp === 'undefined') {
      alert('No se ubico div aportante preliminar');
      return;
    }
    if ($(divcp).find("[id$='id_persona']").length !== 1) {
      alert('Dentro de aportantepreliminar no se ubicó id_persona');
      return;
    }
    $("#" + cnom).autocomplete({
      source: root.puntomontaje + "personas.json",
      minLength: 2,
      select: function(event, ui) {
        if (ui.item) {
          apo214_autocompleta_persona(ui.item.value, ui.item.id, divcp, root);
          event.stopPropagation();
          return event.preventDefault();
        }
      }
    });
  }
};

apo214_autocompleta_persona = function(label, id, divcp, root) {
  var a, cs, d, i, id_persona, ini, pl, t, _i, _ref;
  sip_arregla_puntomontaje(root);
  cs = id.split(";");
  id_persona = cs[0];
  pl = [];
  ini = 0;
  for (i = _i = 0, _ref = cs.length; _i <= _ref; i = _i += 1) {
    t = parseInt(cs[i]);
    pl[i] = label.substring(ini, ini + t);
    ini = ini + t + 1;
  }
  d = "&id_persona=" + id_persona;
  a = root.puntomontaje + 'personas/datos';
  $.ajax({
    url: a,
    data: d,
    dataType: "json"
  }).fail(function(jqXHR, texto) {
    return alert("Error con ajax " + texto);
  }).done(function(e, r) {
    var tdocid;
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_attributes_id]').val(e.id);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_attributes_nombres]').val(e.nombres);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_attributes_apellidos]').val(e.apellidos);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_attributes_sexo]').val(e.sexo);
    tdocid = divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_attributes_tdocumento_id] option:contains(' + e.tdocumento + ')').val();
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_tdocumento_id]').val(tdocid);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_numerodocumento]').val(e.numerodocumento);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_anionac]').val(e.anionac);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_mesnac]').val(e.mesnac);
    divcp.find('[id^=lugarpreliminar_persona_attributes][id$=_dianac]').val(e.dianac);
    $(document).trigger("cor1440gen:autocompletada-persona");
  });
};


apo214_prepara_eventos_comunes = function(root, nomactospe) {
  if (typeof root.puntomontaje === 'undefined') {
    root.puntomontaje = '/';
  }
  if (root.puntomontaje[root.puntomontaje.length - 1] !== '/') {
    root.puntomontaje = root.puntomontaje + '/';
  }
  $(document).on('cocoon:after-insert', function(e) {
    $('[data-behaviour~=datepicker]').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true,
      todayHighlight: true,
      language: 'es'
    });
    return $('.chosen-select').chosen();
  });


  // Autocompleta ubicacionpre en lugar preliminar
  $(document).on('focusin',
    'input[id^=lugarpreliminar_ubicacionpre_mundep_texto]', function (e) {
      sip_busca_ubicacionpre_mundep($(this))
    })

  // Autocompleta aportante en lugar preliminar
  $(document).on('focusin', 'input[id^=lugarpreliminar_persona_attributes][id$=_nombres]', function (e) {
    apo214_busca_aportante($(this), root)
  });

  // Al elegir otro tipo de testigo se despliega el campo otro
  $(document).on('change', 'select[id=lugarpreliminar_tipotestigo_id]', 
    function (e) {
      div_otrotes = $(this).parent().parent().siblings().
        find($('.otrotipotestigo'))
      if ($(this).val() == '4') {
        div_otrotes.css("display", "block")
      } else {
        div_otrotes.css("display", "none")
      }
    }
  )
};
