
DROP PROCEDURE IF EXISTS neosDriver
DELIMITER $
CREATE PROCEDURE neosDriver(IN driverAT CHAR(10), IN name VARCHAR(20),IN lastname VARCHAR (20),IN salary FLOAT(7.2),IN drvlicens ENUM ('A','B','C','D'),IN drv_rout ENUM('LOCAL','ABROAD'),IN drv_experien TINYINT(4))
BEGIN 

DECLARE brcod INT(11);
DECLARE plithos int (11);

SELECT min(br_code),Plithos_drivers_ana_Branch
INTO brcod ,plithos 
FROM(SELECT br_code,count(*) as Plithos_drivers_ana_Branch
FROM branch
INNER JOIN worker on br_code=wrk_br_code
INNER JOIN driver on wrk_AT=drv_AT
GROUP BY br_code) as pinakas

WHERE Plithos_drivers_ana_Branch=
(SELECT min(Plithos_drivers_ana_Branch)
FROM (select br_code,count(*) as Plithos_drivers_ana_Branch
FROM branch
INNER JOIN worker on br_code=wrk_br_code
INNER JOIN driver on wrk_AT=drv_AT
GROUP BY br_code) as pinakas2);

INSERT INTO worker VALUES
(driverAT,name,lastname,salary,brcod);
INSERT INTO driver VALUES
(driverAT,drvlicens,drv_rout,drv_experien);

END$
DELIMITER ;

CALL neosDriver('DR56823326','Takis','Zaxos',1500.00,'A','LOCAL',10);