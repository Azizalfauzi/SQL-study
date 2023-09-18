-- Membuat table author
CREATE TABLE Author (
    id int,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id)
);
-- menampilkan table
select *
from author;
DESC author;
DESC Book;
-- Membuat table book dengan foreign key
CREATE TABLE Book(
    id INT,
    title VARCHAR(100),
    pages VARCHAR(100),
    id_author INT,
    PRIMARY KEY(id),
    FOREIGN KEY(id_author) REFERENCES Author(id)
);
-- Perintah menampilkan query insert
show create table book;
-- Menambahkan data ke dalam autor
INSERT INTO author(id, first_name, last_name)
VALUES(1, "Aziz", "Alfauzi"),
    (2, "Betta", "Adi"),
    (3, "Danang", "Setytawan");
-- Perintah menampilkan isi table 
SELECT *
FROM author;
-- Menambahkan isi table book
INSERT INTO book(id, title, pages, id_author)
VALUES(1, "Book python", "About python", 1),
    (2, "Book Dart", "About python", 1),
    (3, "Book NodeJs", "About python", 2);
-- Perintah menampilkan join isi table 
SELECT author.id,
    book.title,
    author.first_name
FROM author
    INNER JOIN book ON author.id = book.id_author;
-- Perintah menampilkan all join isi table 
SELECT *
FROM author
    INNER JOIN book ON author.id = book.id_author;
--Perintah menghitung total buku dari author 


SELECT author.first_name,author.last_name, COUNT(book.id) as BookCount
FROM author JOIN book ON author.id = book.id_author GROUP by author.id; 