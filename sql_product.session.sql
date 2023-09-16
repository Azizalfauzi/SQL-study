create table product(
    id VARCHAR(100) not null,
    name VARCHAR(100) not NULL,
    deskripsi text,
    price int unsigned not null,
    quantity int unsigned not null default 0,
    created_at timestamp not null default CURRENT_TIMESTAMP
) engine = InnoDb;

show tables;

DESCRIBE product;

-- Perintah untuk insert ke dalam table product tanpa deskripsi
INSERT into product (id,name,price,quantity)
values ('P001','Buku python',30000,100);
-- Perintah untuk insert ke dalam table product dengan  deskripsi
INSERT into product (id,name,deskripsi,price,quantity)
values ('P002','Buku dart','Belajar bahasa pemrograman dart',25000,50);

-- Perintah untuk insert ke dalam table product dengan banyak data
INSERT into product (id,name,price,quantity)
values ('P006','Buku nodejs',50000,500),
('P007','Buku reactjs',80000,170),
('P008','Buku angularjs',55000,190),
('P009','Buku typescript',60000,120),
('P0010','Buku html',25000,120),
('P0011','Buku css',15000,110);


SELECT * FROM product;
