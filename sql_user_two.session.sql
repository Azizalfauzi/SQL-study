START TRANSACTION;
--
SELECT *
FROM guestbooks;
--
UPDATE guestbooks
SET title = 'Diubah oleh user 7 '
WHERE id = 3;
---
START TRANSACTION;
---
SELECT *
FROM product
WHERE id = 'P001' FOR
UPDATE;
---
UPDATE product
SET quantity = quantity -10
WHERE id = 'P001';

ROLLBACK;