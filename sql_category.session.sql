CREATE TABLE categories(
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100),
    PRIMARY KEY(id)
) engine = innodb;
DROP TABLE category;
DESCRIBE category;
ALTER TABLE product DROP COLUMN id_category;
DESCRIBE product;
ALTER TABLE product
ADD COLUMN id_categories VARCHAR(10);
ALTER TABLE product
ADD CONSTRAINT FOREIGN KEY fk_product_categories(id_categories) REFERENCES categories(id);
SELECT *
FROM product;
INSERT INTO categories(id, name)
VALUES('C001', 'Front-End'),
    ('C002', 'Back-End'),
    ('C003', 'Lain-lain');
SELECT *
FROM categories;
UPDATE product
SET id_categories = 'C001'
WHERE id IN ('P002', 'P003', 'P004', 'P005', 'P007');
UPDATE product
SET id_categories = 'C003'
WHERE id IN ('P006', 'P008', 'P009', 'P010', 'P012');
SELECT product.id,
    product.name,
    categories.name
FROM product
    JOIN categories ON (categories.id = product.id_categories);