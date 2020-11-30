class LlenaTipoentierro < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Primario', null, '2020-11-29', null, '2020-11-29', '2020-11-29');
      INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (2, 'Secundario', null, '2020-11-29', null, '2020-11-29', '2020-11-29');
      INSERT INTO public.apo214_tipoentierro (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (3, 'Mixto', null, '2020-11-29', null, '2020-11-29', '2020-11-29');
      SELECT setval('public.apo214_tipoentierro_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.apo214_tipoentierro WHERE id>='1' AND id<='3'
    SQL
  end
end
