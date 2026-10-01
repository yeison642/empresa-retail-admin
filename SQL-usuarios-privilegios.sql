select user, host from mysql.user;

-- Asignamos los roles correspondientes a cada uno de los usuarios anteriormente creados.
-- ROL ana: Puede gestionar clientes e Interacciones (Lectura y Escritura)
GRANT SELECT, INSERT, UPDATE, DELETE 
ON `empresa-retail-db`.cliente 
TO 'ana_crm'@'localhost';  

GRANT SELECT, INSERT, UPDATE, DELETE 
ON `empresa-retail-db`.interaccion
TO 'ana_crm'@'localhost';

-- ROL pedro: Puede gestinar canales y campañas, pero solo puede ver clientes, pero no editarlos.
GRANT SELECT, INSERT, UPDATE, DELETE 
ON `empresa-retail-db`.canal
TO 'pedro_mkt'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON `empresa-retail-db`.campania
TO 'pedro_mkt'@'localhost';

GRANT SELECT 
ON `empresa-retail-db`.cliente
TO 'pedro_mkt'@'localhost';

-- ROL marta: Solo puede ver conversiones(Compra, Registro, Suscripción)
-- y usar procedimientos almacenados de consulta.

GRANT SELECT 
ON `empresa-retail-db`.conversion
TO 'marta_auditoria'@'localhost';

GRANT EXECUTE 
ON `empresa-retail-db`.* 
TO 'marta_auditoria'@'localhost';

FLUSH PRIVILEGES;

-- Verificamos que se otorgaro  correctamente los permisos
SHOW grants for 'ana_crm'@'localhost';  
SHOW grants for 'pedro_mkt'@'localhost';
SHOW grants for 'marta_auditoria'@'localhost';