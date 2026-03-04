TRIP

DROP TRIGGER IF EXISTS InsertTrip;
DELIMITER $
CREATE TRIGGER InsertTrip
AFTER INSERT ON trip
FOR EACH ROW
BEGIN
INSERT INTO log(InsertedData) VALUES('Egine insert ston pinaka trip apo ton IT');
END$
DELIMITER ; 

INSERT INTO trip VALUES
(31,'2023-12-25 10:00:00','2023-12-29 21:00:00',25,220.00,5,'AO00330033','AE50000000');

DROP TRIGGER IF EXISTS DeleteTrip;
DELIMITER $
CREATE TRIGGER DeleteTrip
AFTER DELETE ON trip
FOR EACH ROW
BEGIN
INSERT INTO log(DeletedData) VALUES('Egine delete ston pinaka trip apo ton IT');
END$
DELIMITER ; 

DELETE FROM trip 
WHERE tr_id=31; 

DROP TRIGGER IF EXISTS UpdateTrip;
DELIMITER $
CREATE TRIGGER UpdateTrip
AFTER UPDATE ON trip
FOR EACH ROW
BEGIN
INSERT INTO log(UpdatedData) VALUES('Egine update ston pinaka trip apo ton IT');
END$
DELIMITER ; 

UPDATE trip 
SET tr_maxseats=60
WHERE tr_id=18;

RESERVATION

DROP TRIGGER IF EXISTS InsertReservation;
DELIMITER $
CREATE TRIGGER InsertReservation
AFTER INSERT ON reservation
FOR EACH ROW
BEGIN
INSERT INTO log(InsertedData) VALUES('Egine insert ston pinaka reservation apo ton IT');
END$
DELIMITER ; 

INSERT INTO reservation VALUES
(2,1,'MARIA','KARALI','ADULT');

DROP TRIGGER IF EXISTS DeleteReservation;
DELIMITER $
CREATE TRIGGER DeleteReservation
AFTER DELETE ON reservation
FOR EACH ROW
BEGIN
INSERT INTO log(DeletedData) VALUES('Egine delete ston pinaka reservation apo ton IT');
END$
DELIMITER ; 

DELETE FROM reservation
WHERE res_name='Maria';

DROP TRIGGER IF EXISTS UpdateReservation;
DELIMITER $
CREATE TRIGGER UpdateReservation
AFTER UPDATE ON reservation
FOR EACH ROW
BEGIN
INSERT INTO log(UpdatedData) VALUES('Egine update ston pinaka reservation apo ton IT');
END$
DELIMITER ; 

UPDATE reservation
SET res_seatnum=2
WHERE res_tr_id=20;

EVENT

DROP TRIGGER IF EXISTS InsertEvent;
DELIMITER $
CREATE TRIGGER InsertEvent
AFTER INSERT ON event
FOR EACH ROW
BEGIN
INSERT INTO log(InsertedData) VALUES('Egine insert ston pinaka event apo ton IT');
END$
DELIMITER ; 

INSERT INTO event VALUES
(30,'2023-04-25 17:00:00','2023-04-25 19:30:00','Kafes kai gliko');


DROP TRIGGER IF EXISTS DeleteEvent;
DELIMITER $
CREATE TRIGGER DeleteEvent
AFTER DELETE ON event
FOR EACH ROW
BEGIN
INSERT INTO log(DeletedData) VALUES('Egine delete ston pinaka event apo ton IT');
END$
DELIMITER ; 

DELETE FROM event
WHERE ev_tr_id=30;

DROP TRIGGER IF EXISTS UpdateEvent;
DELIMITER $
CREATE TRIGGER UpdateEvent
AFTER UPDATE ON event
FOR EACH ROW
BEGIN
INSERT INTO log(UpdatedData) VALUES('Egine update ston pinaka event apo ton IT');
END$
DELIMITER ; 

UPDATE event
SET ev_start='2023-04-25 17:00:00'
WHERE ev_tr_id=2;

TRAVEL_TO

DROP TRIGGER IF EXISTS InsertTravelto;
DELIMITER $
CREATE TRIGGER InsertTravelto
AFTER INSERT ON travel_to
FOR EACH ROW
BEGIN
INSERT INTO log(InsertedData) VALUES('Egine insert ston pinaka travel_to apo ton IT');
END$
DELIMITER ; 

INSERT INTO travel_to VALUES
(31,41,'2023-12-25 17:00:00','2023-12-29 23:30:00');


DROP TRIGGER IF EXISTS DeleteTravelto;
DELIMITER $
CREATE TRIGGER DeleteTravelto
AFTER DELETE ON travel_to
FOR EACH ROW
BEGIN
INSERT INTO log(DeletedData) VALUES('Egine delete ston pinaka travel_to apo ton IT');
END$
DELIMITER ; 

DELETE FROM travel_to
WHERE to_tr_id=4;

DROP TRIGGER IF EXISTS UpdateTravelto;
DELIMITER $
CREATE TRIGGER UpdateTravelto
AFTER UPDATE ON travel_to
FOR EACH ROW
BEGIN
INSERT INTO log(UpdatedData) VALUES('Egine update ston pinaka travel_to apo ton IT');
END$
DELIMITER ; 

UPDATE travel_to
SET to_dst_id=23 
WHERE to_tr_id=31;

DESTINATION

DROP TRIGGER IF EXISTS InsertDestination;
DELIMITER $
CREATE TRIGGER InsertDestination
AFTER INSERT ON destination
FOR EACH ROW
BEGIN
INSERT INTO log(InsertedData) VALUES('Egine insert ston pinaka destination apo ton IT');
END$
DELIMITER ; 

INSERT INTO destination VALUES
(42,'Andros','Greek Island','LOCAL','greek',1);


DROP TRIGGER IF EXISTS DeleteDestination;
DELIMITER $
CREATE TRIGGER DeleteDestination
AFTER DELETE ON destination
FOR EACH ROW
BEGIN
INSERT INTO log(DeletedData) VALUES('Egine delete ston pinaka destination apo ton IT');
END$
DELIMITER ; 

DELETE FROM destination
WHERE dst_id=42;

DROP TRIGGER IF EXISTS UpdateDestination;
DELIMITER $
CREATE TRIGGER UpdateDestination
AFTER UPDATE ON destination
FOR EACH ROW
BEGIN
INSERT INTO log(UpdatedData) VALUES('Egine update ston pinaka destination apo ton IT');
END$
DELIMITER ; 

UPDATE destination
SET dst_language='English'
WHERE dst_id=2;