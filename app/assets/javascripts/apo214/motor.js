// Funciones javascript del motor apo214

apo214_busca_aportante = function(s) {
  var cnom, divcp, root, v;
  root = window;
  sip_arregla_puntomontaje(root);
  cnom = s.attr('id');
  v = $("#" + cnom).data('autocompleta');
  if (v !== 1 && v !== "no") {
    $("#" + cnom).data('autocompleta', 1);
    divcp = s.closest('.filapersona');
    if (typeof divcp === 'undefined') {
      alert('No se ubico div aportante preliminar');
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
    divcp.find('[id$=_attributes_id]').val(e.id);
    divcp.find('[id$=_attributes_nombres]').val(e.nombres);
    divcp.find('[id$=_attributes_apellidos]').val(e.apellidos);
    divcp.find('[id$=_attributes_sexo]').val(e.sexo);
    tdocid = divcp.find('[id$=_attributes_tdocumento_id] option:contains(' + e.tdocumento + ')').val();
    divcp.find('[id$=_tdocumento_id]').val(tdocid);
    divcp.find('[id$=_numerodocumento]').val(e.numerodocumento);
    divcp.find('[id$=_anionac]').val(e.anionac);
    divcp.find('[id$=_mesnac]').val(e.mesnac);
    divcp.find('[id$=_dianac]').val(e.dianac);
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

  // Autocompleta otrolugarasesinato en lugar preliminar
  $(document).on('focusin',
    'input[id^=lugarpreliminar_otrolubicacionpre_texto]', function (e) {
      sip_busca_ubicacionpre($(this))
    })

  // Autocompleta aportante en lugar preliminar
  $(document).on('focusin', 'input[id^=lugarpreliminar_persona_attributes][id$=_nombres]', function (e) {
    apo214_busca_aportante($(this), root)
  });

  $(document).on('focusin', 'input[id^=lugarpreliminar_listapersofuentes_attributes][id$=_attributes_nombres]', function (e) {
    apo214_busca_aportante($(this), root)
  });

  $(document).on('focusin', 'input[id^=lugarpreliminar_listadepositados_attributes][id$=_attributes_nombres]', function (e) {
    apo214_busca_aportante($(this), root)
  });

  $(document).on('focusin', 'input[id=lugarpreliminar_propietario_attributes_personapropietario_attributes_nombres]', function (e) {
    apo214_busca_aportante($(this), root)
  });

  $(document).on('focusin', 'input[id=asisreconocimiento_asistente_attributes_nombres]', function (e) {
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

  // Al elegir otra disposicion cadaveres se despliega el campo otra
  $(document).on('change', 'select[id=lugarpreliminar_disposicioncadaveres_id]', 
    function (e) {
      div_otradis = $(this).parent().parent().siblings().
        find($('.otradisposicioncadaveres'))
      if ($(this).val() == '4') {
        div_otradis.css("display", "block")
      } else {
        div_otradis.css("display", "none")
      }
    }
  )

  // Al no elegir insitu se habilita campo otro lugar asesinato
  $(document).on('change', 'input[id=lugarpreliminar_insitu]', 
    function (e) {
      div_otrolugaras = $(this).parent().parent().siblings().
        find($('.otrolugarasesinato'))
      if (this.checked == false) {
        div_otrolugaras.css("display", "block")
      } else {
        div_otrolugaras.css("display", "none")
      }
    }
  )
};
