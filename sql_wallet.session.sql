CREATE TABLE wallet(
    id INT NOT NULL AUTO_INCREMENT,
    balance INT NOT NULL DEFAULT 0,
    id_customer INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_wallet (id_customer),
    CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customer(id)
) engine = innodb;
DESCRIBE wallet;
SELECT *
FROM customer;
INSERT INTO wallet(id_customer, balance)
VALUES(1, 10000),
    (3, 10000);
SELECT *
FROM wallet;
SELECT customer.email,
    wallet.balance
FROM wallet
    JOIN customer ON(wallet.id_customer = customer.id);