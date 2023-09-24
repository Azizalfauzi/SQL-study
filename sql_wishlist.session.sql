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