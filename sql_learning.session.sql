--  Perintah untuk menampilkan table

SHOW tables;

-- Perintah create table 

create table barang(
    id INT,
    nama_barang VARCHAR(100),
    harga_barang INT,
    jumlah_barang INT
)engine InnoDb;

-- Perintah melihat struktur baramg

DESCRIBE barang;

-- Perintah show table 

SELECT * FROM barang;

-- Perintah show pembuatan table 

show create table barang;

-- Perintah update menambahkan kolom deskripsi pada barang

ALTER table barang ADD
deskripsi_baran VARCHAR(100);


-- Perintah update nama data kolom

ALTER TABLE barang
RENAME COLUMN harga_barang INT to harga_barang_new INT;

-- Perintah delete kolom 

ALTER TABLE barang drop column deskripsi_baran;


-- Perintah posisi pada struktur table 
ALTER TABLE barang
MODIFY nama_barang VARCHAR(100) AFTER harga_barang;

-- Perintah posisi pada struktur table pertama

ALTER TABLE barang
MODIFY nama_barang VARCHAR(100) FIRST;


-- Perintah mengubah null menjadi not null

ALTER TABLE barang
MODIFY id INT NOT NULL;

-- Perintah isi default value apabila kosong ketika insert
ALTER TABLE barang
    MODIFY jumlah_barang INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    MODIFY harga_barang INT NOT NULL DEFAULT 0;
-- Perintah menambahkan data time stamp
ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Perintah sederdhana untuk insert barang

INSERT INTO barang (id,nama_barang)
VALUES(1,"Python-Book");