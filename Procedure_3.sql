DROP PROCEDURE IF EXISTS isManager;
DELIMITER $
CREATE PROCEDURE isManager(IN wname VARCHAR(20), IN wlastname VARCHAR(20))
BEGIN

DECLARE a_type ENUM('LOGISTICS','ADMINISTRATIVE','ACCOUNTING');

SELECT adm_type 
INTO a_type 
FROM admin AS a 
INNER JOIN worker AS w ON a.adm_AT=w.wrk_AT
WHERE wrk_name=wname AND wrk_lname=wlastname;

CASE (a_type)
WHEN 'LOGISTICS' THEN 
	DELETE FROM worker WHERE wrk_name=wname AND wrk_lname= wlastname;
	SELECT 'The worker has been deleted.';
WHEN 'ACCOUNTING' THEN 
	DELETE FROM worker WHERE wrk_name=wname AND wrk_lname= wlastname;
	SELECT 'The worker has been deleted.';
WHEN 'ADMINISTRATIVE' THEN 
	SELECT 'This worker is the manager of the branch.';
ELSE 
	SELECT 'This worker is not an admin.';
END CASE;

END$
DELIMITER ;

CALL isManager('Panagiota','Pappa');
CALL isManager('Panagiotis','Kapsis');
CALL isManager('Stelios','Triantafyllou');
CALL isManager('Aria','Gerolidaki');


