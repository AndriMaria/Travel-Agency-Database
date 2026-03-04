DROP TRIGGER IF EXISTS not_meiwsi_mis8ou 
DELIMITER $
CREATE TRIGGER not_meiwsi_mis8ou
BEFORE UPDATE ON worker
FOR EACH ROW
BEGIN
IF new.wrk_salary<old.wrk_salary then 
SEt new.wrk_salary=old.wrk_salary;
END IF;
END $
Delimiter ;

UPDATE worker
SET wrk_salary= 1000.00
WHERE wrk_AT='DR46592921';

SELECT *
FROM worker
WHERE wrk_AT='DR46592921';
