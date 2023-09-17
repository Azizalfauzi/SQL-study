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
INSERT into product (id,name,price,quantity)
values ('P001','Buku python',30000,100);
-- Perintah untuk insert ke dalam table product dengan  deskripsi
INSERT into product (id,name,deskripsi,price,quantity)
values ('P002','Buku dart','Belajar bahasa pemrograman dart',25000,50);

-- Perintah untuk insert ke dalam table product dengan banyak data
INSERT into product (id,name,price,quantity)
values ('P007','Buku dart',76000,200),
('P008','Buku xss',30000,120),
('P009','Buku android',90000,110),
('P0010','Buku ios',80000,120),
('P0011','Buku .net',85000,120),
('P0012','Buku spring boot',95000,110);

-- Perintah select seluruh barang
SELECT * FROM product;


-- Perintah select dengan menyebut nmanya
SELECT id,name,quantity FROM product;

-- Perintah untuk menambahkan primary key

ALTER TABLE product 
ADD primary key (id);

INSERT into product (id,name,price,quantity)
values ('P001','Buku python',30000,100);