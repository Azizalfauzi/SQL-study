create table product(
    id VARCHAR(100) not null,
    name VARCHAR(100) not NULL,
    deskripsi text,
    price int unsigned not null,
    quantity int unsigned not null default 0,
    created_at timestamp not null default CURRENT_TIMESTAMP
) engine = InnoDb;
show tables;
show create table product;
DESCRIBE product;
-- Perintah untuk insert ke dalam table product tanpa deskripsi
INSERT into product (id, name, price, quantity)
values ('P001', 'Buku python', 30000, 100);
-- Perintah untuk insert ke dalam table product dengan  deskripsi
INSERT into product (id, name, deskripsi, price, quantity)
values (
        'P002',
        'Buku dart',
        'Belajar bahasa pemrograman dart',
        25000,
        50
    );
-- Perintah untuk insert ke dalam table product dengan banyak data
INSERT into product (id, name, price, quantity)
values ('P007', 'Buku dart', 76000, 200),
    ('P008', 'Buku xss', 30000, 120),
    ('P009', 'Buku android', 90000, 110),
    ('P0010', 'Buku ios', 80000, 120),
    ('P0011', 'Buku .net', 85000, 120),
    ('P0012', 'Buku spring boot', 95000, 110);
-- Perintah select seluruh barang
SELECT *
FROM product;
-- Perintah select dengan menyebut nmanya
SELECT id,
    name,
    quantity
FROM product;
-- Perintah untuk menambahkan primary key
ALTER TABLE product
ADD primary key (id);
INSERT into product (id, name, price, quantity)
values ('P001', 'Buku python', 30000, 100);
-- Perintah where clause
SELECT *
FROM product
WHERE quantity = 120;
SELECT *
FROM product
WHERE price = 25000;
SELECT *
FROM product
WHERE id = 'P001';
SELECT *
FROM product
WHERE name = 'Buku dart';
DESCRIBE product;
-- Perintah menambahkan kolom baru
ALTER TABLE product
ADD column category ENUM ('Back End', 'Front End', 'Lain-lain')
AFTER name;
SELECT *
from product;
-- Perintah update data single
UPDATE product
SET id = 'P011'
WHERE id = 'P0011';
--Perintah update data multiple
UPDATE product
SET category = 'Front End',
    deskripsi = 'Buku untuk front end'
WHERE id = 'P002' -- Perintah update dengan value kolom 
UPDATE product
SET price = price + 5000
WHERE id = 'P008';
-- Perintah delete data pada table
DELETE FROM product
WHERE id = 'P0012';
-- Perintah ALIAS pada kolom
SELECT id AS 'Kode',
    name AS 'Nama',
    category AS 'Kategori',
    price AS 'Harga',
    quantity AS 'Jumlah'
FROM product;
-- Perintah ALIAS pada table
SELECT p.id AS 'Kode',
    p.name AS 'Nama',
    p.category AS 'Kategori',
    p.price AS 'Harga',
    p.quantity AS 'Jumlah'
FROM product AS p;
-- Perintah select where > 
SELECT *
FROM product
WHERE quantity > 120;
-- Perintah select where !=
SELECT *
FROM product
WHERE category != 'Lain-lain';
-- Perintah select <>
SELECT *
FROM product
WHERE category <> 'Front End';
-- Perintah AND 
SELECT *
FROM product
WHERE quantity > 120
    AND price > 50000;
SELECT *
FROM product
WHERE quantity >= 120
    AND price < 50000;
-- Perintah OR
SELECT *
FROM product
WHERE quantity > 500
    OR price > 50000;
-- Perintah and dan or dalam sati kondisi prioritas
SELECT *
FROM product
WHERE (
        category = 'Front End'
        OR quantity > 500
    )
    AND price > 50000;
-- Perintah LIKE Search by keyword
SELECT *
FROM product
WHERE name LIKE '%dart%';
-- PERINHA LIKE search dari kata huruf pertama
SELECT *
FROM product
WHERE category LIKE '%Fr%';
-- Perintah NOT LIKE
SELECT *
FROM product
WHERE category NOT LIKE '%Front End%';
-- Perintah mencari null
SELECT *
FROM product
WHERE deskripsi IS NULL;
-- Perintah mencari tidak null
SELECT *
FROM product
WHERE deskripsi IS NOT NULL;
-- Perintah between 
SELECT *
FROM product
WHERE price BETWEEN 50000 AND 90000;
-- Perintah not between
SELECT *
FROM product
WHERE price NOT BETWEEN 50000 AND 90000;
-- Perintah IN
SELECT *
FROM product
WHERE category IN ('Front End', 'Back End');
-- Perintah NOT IN
SELECT *
FROM product
WHERE category NOT IN ('Front End', 'Back End');
--Perintah order by clause
SELECT *
FROM product
ORDER BY id DESC;
--Perintah order by clause
SELECT id,
    category,
    name
FROM product
ORDER BY category;
--Perintah order by clause tambah param lagi
SELECT id,
    category,
    name,
    price
FROM product
ORDER BY category ASC,
    price DESC;
--Perintah LIMIT
SELECT *
FROM product
ORDER BY id
LIMIT 5;
SELECT *
FROM product
ORDER BY id
LIMIT 9, 3;
-- Perintah distinc
SELECT DISTINCT category
FROM product;
--Perintah String funtion
SELECT id,
    LOWER(name) as 'Name Lower',
    LENGTH(name) as 'Name Length',
    UPPER(name) as 'Name Upper'
FROM product;
-- Perintah Date Time Func
SELECT *
FROM product;
SELECT id,
    created_at,
    EXTRACT(
        YEAR
        FROM created_at
    ) as YEAR,
    EXTRACT(
        MONTH
        FROM created_at
    ) as MONTH
FROM product;
-- Perintah Date Time Func cara lain
SELECT id,
    created_at,
    YEAR(created_at),
    MONTH(created_at)
FROM product;
--Perintah control flow case
SELECT id,
    category,
    CASE
        category
        WHEN 'Back End' THEN 'GREAT'
        WHEN 'Front End' THEN 'PERFECT'
        ELSE 'OP'
    END AS 'Category'
FROM product;
-- Perintah control flow IF
SELECT id,
    price,
    IF(
        price <= 50000,
        'Murah',
        IF (price <= 75000, 'Mahal', 'Mahal Banget')
    ) AS 'Mahal?'
FROM product;
-- Perintah cek kosong dan replace
SELECT id,
    name,
    IFNULL(deskripsi, 'Kosong')
FROM product;
-- Perintah menghitung record
SELECT count(id) as 'Total product'
FROM product;
-- Perintah max price record
SELECT max(price) as 'Produk Termahal'
FROM product;
-- Perintah min price record
SELECT min(price) as 'Produk Termurah'
FROM product;
-- Perintah rata rata price record
SELECT avg(price) as 'Rata Rata Harga Produk'
FROM product;
-- Perintah sum total product
SELECT sum(quantity) as 'Total Stock'
FROM product;
-- Perintah Group by
SELECT count(id) as 'Total Produk by category',
    category
FROM product
GROUP BY category;
SELECT max(price) as 'Produk termahal by category',
    category
FROM product
GROUP BY category;
SELECT min(price) as 'Produk termurah by category',
    category
FROM product
GROUP BY category;
SELECT AVG(price) as 'Rata-Rata harga produk by category',
    category
FROM product
GROUP BY category;
SELECT sum(quantity) as 'Total quantity produk by category',
    category
FROM product
GROUP BY category;
-- Perintah having clause
SELECT count(id) as total,
    category
FROM product
GROUP BY category
HAVING total > 1;
-- Perintah SQL having  constraint
SELECT *
FROM product;
INSERT INTO product(id, name, category, deskripsi, price, quantity)
VALUES (
        'P013',
        'Buku LSTM',
        'Lain-lain',
        'Buku LSTM',
        5000,
        250
    );
ALTER TABLE product
ADD CONSTRAINT price_check CHECK (price >= 10000);
UPDATE product
SET price = 15000
WHERE id = 'P012';
DESC product;
SHOW CREATE TABLE product;
-- Perintah add fulltext
ALTER TABLE product
ADD FULLTEXT product_fulltext(name, deskripsi);
-- Perintah delete
ALTER TABLE product DROP product_fulltext;
--Perintah natural languange mode
SELECT *
FROM product;
SELECT *
FROM product
WHERE MATCH(name, deskripsi) AGAINST ('html' IN NATURAL LANGUAGE MODE);
--Perintah natural boolean mode
SELECT *
FROM product;
SELECT *
FROM product
WHERE MATCH(name, deskripsi) AGAINST ('+html -dart' IN NATURAL BOOLEAN MODE);
--Perintah natural quest expansion mode
SELECT *
FROM product;
SELECT *
FROM product
WHERE MATCH(name, deskripsi) AGAINST ('html' WITH QUERY EXPANSION);
INSERT into product (id, name, category, price, quantity)
values ('P013', 'Buku Bert', 'Lain-lain', 40000, 150);
INSERT into product (id, name, price, quantity)
values ('X001', 'X satu', 76000, 200),
    ('X002', 'X dua', 30000, 120),
    ('X003', 'X tiga', 90000, 110);
-- Perintah SubQuery
SELECT AVG(price)
FROM product;
SELECT *
FROM product
WHERE price > (
        SELECT AVG(price)
        FROM product
    );
SELECT MAX(price)
FROM product;
SELECT *
FROM categories;
SELECT *
FROM product;
SELECT price
FROM categories
    JOIN product ON(product.id_categories = categories.id);
SELECT MAX(cp.price)
FROM (
        SELECT price
        FROM categories
            JOIN product ON (product.id_categories = categories.id)
    ) as cp;