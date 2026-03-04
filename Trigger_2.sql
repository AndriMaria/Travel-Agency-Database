DROP TRIGGER IF EXISTS changeTrip;
DELIMITER $
CREATE TRIGGER changeTrip
BEFORE UPDATE ON trip
FOR EACH ROW
BEGIN

DECLARE finishedFlag INT;

DECLARE tcursor CURSOR FOR 
SELECT r.res_seatnum 
FROM trip AS t
INNER JOIN reservation AS r ON t.tr_id=r.res_tr_id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
SET finishedFlag=0;
OPEN tcursor;

WHILE (finishedFlag=0) 
DO
	SET new.tr_departure=old.tr_departure;
	SET new.tr_return=old.tr_return;
	SET new.tr_cost=old.tr_cost;
    SET finishedFlag=1; 
END WHILE;
CLOSE tcursor; 
END $
DELIMITER ;

UPDATE trip
SET tr_departure='2023-07-15 08:00:00', tr_return='2023-07-25 22:00:00', tr_cost=300.00
WHERE tr_id=1;

select * from trip
WHERE tr_id=1; 
