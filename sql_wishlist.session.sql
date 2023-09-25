CREATE TABLE wishlist(
    id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES product(id)
) engine = innodb;
desc wishlist;
DROP TABLE wishlist;
-- Perintah menghapus fk
ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_product;
SHOW CREATE TABLE wishlist;
--Perintah menambahkan foreign key
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE;
INSERT INTO wishlist(id_product, description)
VALUES ("P013", 'Buku Favorit');
SELECT *
FROM wishlist;
DELETE FROM product
where id = 'P013';
--Perintah JOIN 
SELECT *
FROM wishlist
    JOIN product ON(wishlist.id_product = product.id);
SELECT w.id as id_wishlist,
    p.id as id_product,
    p.name as product_name,
    w.description as description
FROM wishlist as w
    JOIN product as p ON(w.id_product = p.id);
DESCRIBE wishlist;
ALTER TABLE wishlist
ADD COLUMN id_customer INT;
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES customer(id);
SELECT *
FROM customer;
UPDATE wishlist
SET id_customer = 1
WHERE id = 1;
-- Perintah join beberapa table
SELECT customer.email,
    product.id,
    product.name,
    wishlist.description
FROM wishlist
    JOIN product ON(product.id = wishlist.id_product)
    JOIN customer ON (customer.id = wishlist.id_customer);