// Funciones javascript del motor apo214
//= require apo214/AutocompletaAjaxAportantes
root = window;
sip_arregla_puntomontaje(root);
console.log(root.puntomontaje)
Apo214AutocompletaAjaxAportantes.iniciar()

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
  $(document).on("click", ".togglecoord", function() {
   $(this).parent().siblings(".coord").modal('toggle');
  });

  $(document).on("click", ".boton_conversion", function() {
    coor = $(this).parent().parent().parent().parent().parent().children()
    lat_wgs84 = $($(this).parent().parent().children()[1]).find('[id$= _infoanomalia_attributes_latitud_wgs84]').val();
    lon_wgs84 = $($(this).parent().parent().children()[1]).find('[id$= _infoanomalia_attributes_longitud_wgs84]').val();
    lat = coor.find('[id$=attributes_latitud_localizado]').val(lat_wgs84);
    lon = coor.find('[id$=attributes_longitud_localizado]').val(lon_wgs84);

  });

  function splitMulti(str, tokens){
        var tempChar = tokens[0];
        for(var i = 1; i < tokens.length; i++){
            str = str.split(tokens[i]).join(tempChar);
        }
        str = str.split(tempChar);
        return str;
  }

  //El tipo de conversión puede ser:
  // div_padre: Div que contiene los campos del control
  // conversion:
  // 1: de wgs_84 flotante a magna sirgas Bogotá y a GMS (wgs_84)
  // 2: de wgs84 GMS a magna sirgas y a wgs_84 flotante
  // 3: de magna sirgas a wgs84 flotante y a wgs_84 GMS
  // coordenadas: datos a convertir
  function tranformar_coordenadas(div_padre, conversion, coordenadas){
    d = ""
    switch(conversion) {
      case 1:
        lat_wgs84_flot = coordenadas[0] 
        lon_wgs84_flot = coordenadas[1] 
        d = "&lat_wgs84_flot=" + lat_wgs84_flot + "&lon_wgs84_flot=" + lon_wgs84_flot + "&tipo=" + conversion;
        break;
      case 2:
        lat_gms = coordenadas[0] 
        lon_gms = coordenadas[1] 
        d = "&lat_gms=" + lat_gms + "&lon_gms=" + lon_gms + "&tipo=" + conversion;
        break;
      case 3:
        lat_sirgas = coordenadas[0] 
        lon_sirgas = coordenadas[1] 
        d = "&lat_sirgas=" + lat_sirgas + "&lon_sirgas=" + lon_sirgas + "&tipo=" + conversion;
        break;
      default:
        d = "&lat_wgs84=hola";
    }
    root = window
    a = root.puntomontaje + 'lugp/coordenadas'
    $.ajax({
       url: a,
       data: d
     }).fail(function(jqXHR, texto) {
       return alert("Error con ajax " + texto);
     }).done(function(e, r) {
       if(e.mensaje_error != ""){
         alert(e.mensaje_error)
       }
       latitud_gms = e.gms.split(" ")[0]
       longitud_gms = e.gms.split(" ")[1]
       gmslat = splitMulti(latitud_gms, ['°', "\'", "\'\'"])
       p = div_padre.parent()
       lat_g = p.find('[id$=infoanomalia_attributes_gra_lat]').val(gmslat[0])
       lat_m = p.find('[id$=infoanomalia_attributes_min_lat]').val(gmslat[1])
       lat_s = p.find('[id$=infoanomalia_attributes_seg_lat]').val(gmslat[2])
       lat_card = p.find('[id$=infoanomalia_attributes_cardinal_lat_'+gmslat[3].toLowerCase() +']').prop("checked", true)
       gmslon = splitMulti(longitud_gms, ['°', "\'", "\'\'"])
       lon_g = p.find('[id$=infoanomalia_attributes_gra_lon]').val(gmslon[0])
       lon_m = p.find('[id$=infoanomalia_attributes_min_lon]').val(gmslon[1])
       lon_s = p.find('[id$=infoanomalia_attributes_seg_lon]').val(gmslon[2])
       lon_card = p.find('[id$=infoanomalia_attributes_cardinal_lon_'+gmslon[3].toLowerCase() +']').prop("checked", true)
       latitud_sirgas = e.sirgas[1]
       longitud_sirgas = e.sirgas[0]
       latitud_on = e.on[1]
       longitud_on = e.on[0]
       lat_on = p.parent().find('[id$=infoanomalia_attributes_latitud_on]').val(latitud_on)
       lon_on = p.parent().find('[id$=infoanomalia_attributes_longitud_on]').val(longitud_on)
       lat_sirgas = p.parent().find('[id$=infoanomalia_attributes_latitud_sirgas]').val(latitud_sirgas)
       lon_sirgas = p.parent().find('[id$=infoanomalia_attributes_longitud_sirgas]').val(longitud_sirgas)
       latitud_wgs84 = e.wgs84[1]
       longitud_wgs84 = e.wgs84[0]
       lat_wgs84 = p.parent().find('[id$=infoanomalia_attributes_latitud_wgs84]').val(latitud_wgs84)
       lon_wgs84 = p.parent().find('[id$=infoanomalia_attributes_longitud_wgs84]').val(longitud_wgs84)
     });
  }
  $(document).on('change', 'input[id$=_infoanomalia_attributes_latitud_sirgas]', 
    function (e) {
      div_padre = $(this).parent().parent().parent().parent()
      lat_sirgas = $(div_padre).find('[id$= _infoanomalia_attributes_latitud_sirgas]').val();
      lon_sirgas = $(div_padre).find('[id$= _infoanomalia_attributes_longitud_sirgas]').val();
      coordenadas = [lat_sirgas, lon_sirgas]
      tranformar_coordenadas(div_padre, 3, coordenadas)
    }
  )
  $(document).on('change', 'input[id$=_infoanomalia_attributes_longitud_sirgas]', 
    function (e) {
      div_padre = $(this).parent().parent().parent().parent()
      lat_sirgas = $(div_padre).find('[id$= _infoanomalia_attributes_latitud_sirgas]').val();
      lon_sirgas = $(div_padre).find('[id$= _infoanomalia_attributes_longitud_sirgas]').val();
      coordenadas = [lat_sirgas, lon_sirgas]
      tranformar_coordenadas(div_padre, 3, coordenadas)
    }
  )
  $(document).on('change', 'input[id$=_infoanomalia_attributes_latitud_wgs84]', 
    function (e) {
      div_padre = $(this).parent().parent().parent().parent()
      lat_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_latitud_wgs84]').val();
      lon_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_longitud_wgs84]').val();
      coordenadas = [lat_wgs84, lon_wgs84]
      tranformar_coordenadas(div_padre, 1, coordenadas)
    }
  )

  $(document).on('change', 'input[id$=_infoanomalia_attributes_longitud_wgs84]', 
    function (e) {
      div_padre = $(this).parent().parent().parent().parent()
      lat_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_latitud_wgs84]').val();
      lon_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_longitud_wgs84]').val();
      coordenadas = [lat_wgs84, lon_wgs84]
      tranformar_coordenadas(div_padre, 1, coordenadas)
    }
  )
};
  $(document).on('change', 'input[id$=_infoanomalia_attributes_latitud_gms]', 
    function (e) {
      div_padre = $(this).parent().parent().parent().parent()
      lat_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_latitud_wgs84]').val();
      lon_wgs84 = $(div_padre).find('[id$= _infoanomalia_attributes_longitud_wgs84]').val();
      coordenadas = [lat_wgs84, lon_wgs84]
      tranformar_coordenadas(div_padre, 1, coordenadas)
    }
  )
