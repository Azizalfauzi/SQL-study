CREATE TABLE seller(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name2 VARCHAR(100),
    name3 VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index(name),
    INDEX name2_index(name2),
    INDEX name3_index(name3),
    INDEX name1_name2_name3_index(name, name2, name3)
) engine = innodb;
DESC seller;
-- Perintah pemanggilan index 1
SELECT *
FROM seller
WHERE name = 'X';
-- Perintah pemanggilan index 2
SELECT *
FROM seller
WHERE name = 'X'
    AND name2 = 'X';
-- Perintah pemanggilan index 3
SELECT *
FROM seller
WHERE name = 'X'
    AND name2 = 'X'
    AND name3 = 'X';
-- Perintah menambah index
ALTER TABLE seller
ADD INDEX name_index(name);
--Perintah delete index
ALTER TABLE seller DROP INDEX name_index;