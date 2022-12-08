conexion = ActiveRecord::Base.connection();

# De motores y finalmente de este
motor = ['msip', 'sivel2_gen', nil]
motor.each do |m|
    Msip::carga_semillas_sql(conexion, m, :cambios)
    Msip::carga_semillas_sql(conexion, m, :datos)
end

# primer usuario sivel2 con clave sivel2
conexion.execute("INSERT INTO public.usuario 
	(id, nusuario, nombre, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES (1, 'sivel2', 'sivel2', 'sivel2@localhost', 
	'$2a$10$V2zgaN1ED44UyLy0ubey/.1erdjHYJusmPZnXLyIaHUpJKIATC1nG', 
	'', '2014-08-26', '2014-08-26', '2014-08-26', 1);")

