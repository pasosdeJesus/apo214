class LlenaRiesgo < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Presencia de grupos armados al margen de la ley (GAI)', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (2, 'Contradictores', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (3, 'Artefactos explosivos', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (4, 'Residuos químicos, biológicos, médicos, etc.', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (5, 'Enfermedades locales', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (6, 'Acceso al sitio', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_riesgo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (7, 'Flora y Fauna', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      SELECT setval('public.apo214_riesgo_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.apo214_riesgo WHERE id>='1' AND id<='7'
    SQL
  end
end
