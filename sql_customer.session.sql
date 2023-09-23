CREATE TABLE customer(
    id INT NOT NULL AUTO_INCREMENT,
    email varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100),
    PRIMARY KEY (id),
    unique key email_unique(email)
) engine = innoDb;
DESCRIBE customer;
-- Perintah menambah dan menghapus constrain 
ALTER TABLE customer DROP CONSTRAINT email_unique;
ALTER TABLE customer
ADD CONSTRAINT email_unique UNIQUE (email);
-- Perintah menambahkan data
INSERT INTO customer (email, first_name, last_name)
VALUES('aziz@gmail.com', 'aziz', 'alfa');
SELECT *
FROM customer;
INSERT INTO customer (email, first_name, last_name)
VALUES('aziz65@gmail.com', 'aziz', 'alfa');