class LlenaDisposicioncadaveres < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (1, 'En superficie', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
      INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (2, 'Inhumados', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
      INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (3, 'Arrojados a un cuerpo de agua', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
      INSERT INTO public.apo214_disposicioncadaveres (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (4, 'Otros', null, '2020-11-28', null, '2020-11-28', '2020-11-28');
      SELECT setval('public.apo214_disposicioncadaveres_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.apo214_disposicioncadaveres WHERE id>='1' AND id<='4'
    SQL
  end
end
