START TRANSACTION;
--
SELECT *
FROM guestbooks;
--
UPDATE guestbooks
SET title = 'Diubah oleh user 4'
WHERE id = 3;
---
COMMIT;
--- 