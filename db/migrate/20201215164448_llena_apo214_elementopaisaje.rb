class LlenaApo214Elementopaisaje < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Planicie', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (2, 'Ondulado', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_elementopaisaje (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (3, 'Terraza', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      SELECT setval('public.apo214_elementopaisaje_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.apo214_elementopaisaje WHERE id>='1' AND id<='3'
    SQL
  end
end
