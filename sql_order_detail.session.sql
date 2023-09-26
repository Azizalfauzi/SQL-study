CREATE TABLE order_detail(
    id_product VARCHAR(100) NOT NULL,
    id_order INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(id_product, id_order)
) engine = innodb;
DESCRIBE order_detail;
-- Perintah menambahkan foreign key pada table produk
ALTER TABLE order_detail
ADD CONSTRAINT fk_orders_details_product FOREIGN KEY (id_product) REFERENCES product(id);
-- Perintah menambahkan foreign key pada table order
ALTER TABLE order_detail
ADD CONSTRAINT fk_orders_details_order FOREIGN KEY (id_order) REFERENCES orders(id);
SHOW CREATE TABLE order_detail;
SELECT *
FROM orders;
SELECT *
FROM product;
SELECT *
FROM order_detail;
INSERT INTO orders(total)
VALUES (50000);
INSERT INTO order_detail(id_product, id_order, price, quantity)
VALUES('P001', 1, 50000, 1),
    ('P002', 1, 8000, 1);
INSERT INTO order_detail(id_product, id_order, price, quantity)
VALUES('P003', 2, 50000, 1),
    ('P004', 2, 50000, 1);
INSERT INTO order_detail(id_product, id_order, price, quantity)
VALUES('P001', 2, 50000, 1),
    ('P003', 3, 50000, 1);
SELECT *
FROM orders
    JOIN order_detail ON(order_detail.id_order = orders.id)
    JOIN product ON(product.id = order_detail.id_product);
SELECT orders.id,
    product.id,
    product.name,
    order_detail.quantity,
    order_detail.price,
    orders.order_date
FROM orders
    JOIN order_detail ON(order_detail.id_order = orders.id)
    JOIN product ON(product.id = order_detail.id_product);
