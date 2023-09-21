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
    name,price
FROM product
ORDER BY category ASC, price DESC;

--Perintah LIMIT
SELECT * FROM product ORDER BY id LIMIT 5;

SELECT * FROM product ORDER BY id LIMIT 9,3;

-- Perintah distinc

SELECT DISTINCT category FROM product;