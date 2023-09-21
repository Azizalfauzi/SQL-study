-- Perintah create new table
CREATE TABLE admin (
    id INt NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDb;
--Perintah deskripsi table
DESC admin;
-- Perintah insert table
INSERT INTO admin (first_name, last_name)
VALUES ('Aziz', 'Alfa'),
    ('Betta', 'Adi'),
    ('Danang', 'Setyawan');
--Perintah select
SELECT *
FROM admin
ORDER BY id;
-- Perintah delete
DELETE from admin
WHERE id = 3;
--Perintah add lagi
INSERT INTO admin (first_name, last_name)
VALUES ('Wahyu', 'Aan');
-- CEK last insert id
SELECT LAST_INSERT_ID();