conexion = ActiveRecord::Base.connection();

# De motores
motor = ['sip', 'heb412_gen', 'sivel2_gen', '../..', nil]
motor.each do |m|
    Sip::carga_semillas_sql(conexion, m, :cambios)
    Sip::carga_semillas_sql(conexion, m, :datos)
end

# Usuario para primer ingreso sip, sip
conexion.execute("INSERT INTO public.usuario 
  (nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
  VALUES ('sip', 'sip@localhost', 
  '$2a$10$uPICXBx8K/csSb5q3uNsPOwuU1h.9O5Kj9dyQbaCy8gF.5rrPJgG.',
  '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
