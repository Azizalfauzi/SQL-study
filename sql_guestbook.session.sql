CREATE TABLE guestbooks(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100),
    title VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
) engine = innodb;
SELECT *
FROM customer;
SELECT *
FROM guestbooks;
INSERT INTO guestbooks (email, title, content)
VALUES ('guest1@gmail.com', 'hello', 'world'),
    ('guest2@gmail.com', 'hello', 'world'),
    ('guest3@gmail.com', 'hello', 'world'),
    ('aziz@gmail.com', 'hello', 'world'),
    ('aziz@gmail.com', 'hello', 'world');
SELECT DISTINCT email
FROM customer;
SELECT DISTINCT email
FROM guestbooks;
-- Perintah UNION
SELECT DISTINCT email
FROM customer
UNION
SELECT DISTINCT email
FROM guestbooks;
-- Perintah UNION ALL
SELECT DISTINCT email
FROM customer
UNION ALL
SELECT DISTINCT email
FROM guestbooks;
SELECT emails.email,
    COUNT(emails.email)
FROM (
        SELECT email
        FROM customer
        UNION ALL
        SELECT email
        FROM guestbooks
    ) as emails
GROUP BY emails.email;
--Perintah  instersect
SELECT DISTINCT email
FROM customer
WHERE email IN (
        SELECT DISTINCT email
        FROM guestbooks
    );
SELECT DISTINCT customer.email
FROM customer
    INNER JOIN guestbooks ON (guestbooks.email = customer.email);
-- Perintah MINUS
SELECT DISTINCT customer.email,
    guestbooks.email
FROM customer
    LEFT JOIN guestbooks ON (customer.email = guestbooks.email)
WHERE guestbooks.email IS NULL;