class LlenaCobertura < ActiveRecord::Migration[6.0]
 def up
    execute <<-SQL
      INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'Potrero', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (2, 'Cultivo', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (3, 'Bosque', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      INSERT INTO public.apo214_cobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (4, 'Otro', null, '2020-12-15', null, '2020-12-15', '2020-12-15');
      SELECT setval('public.apo214_cobertura_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.apo214_cobertura WHERE id>='1' AND id<='4'
    SQL
  end
end
