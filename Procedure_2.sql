DROP PROCEDURE IF EXISTS infotrip;
DELIMITER $
CREATE PROCEDURE infotrip(IN branchcode INT,IN dateone DATETIME,IN datetwo DATETIME)
BEGIN

DECLARE finishedFlag INT;

DECLARE tcursor CURSOR FOR
SELECT tr_br_code, tr_departure
FROM trip
WHERE tr_br_code=branchcode AND tr_departure >= dateone AND tr_departure<= datetwo;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN tcursor; 
SET finishedFlag=0; 

WHILE (finishedFlag=0) 
DO
	SELECT t.tr_cost AS Kostos_Taxidiou, t.tr_maxseats AS Megistes_Theseis,r.res_seatnum AS Kratimenes_Theseis, 
t.tr_maxseats-r.res_seatnum AS Kenes_Theseis, t.tr_departure AS Hmera_Anaxorisis, t.tr_return AS Hmera_Epistrofis
	FROM trip AS t
	INNER JOIN reservation AS r ON t.tr_id=r.res_tr_id 
	WHERE t.tr_br_code=branchcode AND t.tr_departure >= dateone AND t.tr_departure<= datetwo; 

	SELECT w.wrk_name AS GuideName, w.wrk_lname AS GuideLastname 
	FROM trip AS t
	INNER JOIN worker AS w ON t.tr_gui_AT=w.wrk_AT 
	WHERE t.tr_br_code=branchcode AND t.tr_departure >= dateone AND t.tr_departure<= datetwo;

	SELECT w.wrk_name AS DriverName, w.wrk_lname AS DriverLastname
	FROM trip AS t
	INNER JOIN worker AS w ON t.tr_drv_AT=w.wrk_AT
	WHERE t.tr_br_code=branchcode AND t.tr_departure >= dateone AND t.tr_departure<= datetwo;

	SET finishedFlag=1;
END WHILE;
CLOSE tcursor;
END$
DELIMITER ;


CALL infotrip(1,'2023-01-03 08:00:00','2023-07-30 22:00:00');
