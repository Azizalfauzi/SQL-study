CREATE USER 'aziz' @'localhost';
---
CREATE USER 'alfa' @'%';
---
DROP USER 'aziz' @'localhost';
DROP USER 'alfa' @'localhost';
--
GRANT SELECT ON belajar_mysql.* TO 'aziz' @'localhost';
---
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON belajar_mysql.* TO 'alfa' @'%';
---
SHOW GRANTS FOR 'aziz' @'localhost';
SHOW GRANTS FOR 'alfa' @'localhost';
--- 
SHOW GRANTS FOR 'alfa' @'%';
---
SET PASSWORD FOR 'aziz' @'localhost' = PASSWORD('rahasia');
---
SET PASSWORD FOR 'alfa' @'%' = PASSWORD('hello');