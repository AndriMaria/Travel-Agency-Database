DROP DATABASE IF EXISTS agi;
CREATE DATABASE agi;
USE agi;
CREATE TABLE destination(
	dst_id INT(11),
	dst_name VARCHAR(50) DEFAULT 'unknown' NOT NULL,
	dst_descr TEXT,
	dst_rtype ENUM('LOCAL','ABROAD'),
	dst_language VARCHAR(30) DEFAULT 'unknown' NOT NULL,
	dst_location INT(11),
	PRIMARY KEY(dst_id),
	CONSTRAINT DSTDST FOREIGN KEY(dst_location) 	REFERENCES destination(dst_id) 
	ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE branch(
	br_code INT(11) NOT NULL, 
	br_street VARCHAR(30) DEFAULT 'unknown' NOT NULL,
	br_num INT(4) NOT NULL,
	br_city VARCHAR(30) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY (br_code)
);

CREATE TABLE phones(
	ph_br_code INT(11) NOT NULL,
	ph_number CHAR(10) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY (ph_br_code,ph_number),
	CONSTRAINT PHBR FOREIGN KEY (ph_br_code) REFERENCES branch(br_code)
	ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE worker(
	wrk_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	wrk_name VARCHAR(20) DEFAULT 'unknown' NOT NULL,
	wrk_lname VARCHAR(20) DEFAULT 'unknown' NOT NULL, 
	wrk_salary FLOAT(7,2),
	wrk_br_code INT(11) NOT NULL,
	PRIMARY KEY(wrk_AT),
	CONSTRAINT WRKBR FOREIGN KEY (wrk_br_code) REFERENCES branch(br_code)
	ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE driver(
	drv_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	drv_license ENUM('A','B','C','D'),
	drv_route ENUM('LOCAL','ABROAD'),
	drv_experience TINYINT(4),
	PRIMARY KEY(drv_AT),
	CONSTRAINT DRIVAT
	FOREIGN KEY (drv_AT) REFERENCES worker(wrk_AT)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE guide(
	gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	gui_cv TEXT,
	PRIMARY KEY(gui_AT),
	CONSTRAINT GUIDEAT
	FOREIGN KEY(gui_AT) REFERENCES worker(wrk_AT)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE languages(
	lng_gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	lng_language VARCHAR(30) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(lng_gui_AT, lng_language),
	CONSTRAINT languageGuide
	FOREIGN KEY(lng_gui_AT) REFERENCES guide(gui_AT)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE trip(
	tr_id INT(11) NOT NULL,
	tr_departure DATETIME NOT NULL,
	tr_return DATETIME NOT NULL,
	tr_maxseats TINYINT(4) NOT NULL,
	tr_cost FLOAT(7,2),
	tr_br_code INT(11) NOT NULL,
	tr_gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	tr_drv_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(tr_id),
	CONSTRAINT DRIVERID
	FOREIGN KEY (tr_drv_AT) REFERENCES driver(drv_AT)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT GUIDEID
	FOREIGN KEY (tr_gui_AT) REFERENCES guide(gui_AT)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT BRCODE
	FOREIGN KEY (tr_br_code) REFERENCES branch(br_code)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE travel_to(
	to_tr_id INT(11) NOT NULL,
	to_dst_id INT(11) NOT NULL,
	to_arrival DATETIME NOT NULL,
	to_departure DATETIME NOT NULL,
	PRIMARY KEY(to_tr_id,to_dst_id),
	CONSTRAINT travelDest
	FOREIGN KEY(to_dst_id) REFERENCES destination(dst_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT travelTrip
	FOREIGN KEY(to_tr_id) REFERENCES trip(tr_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservation(
	res_tr_id INT(11) NOT NULL,
	res_seatnum TINYINT(4) NOT NULL,
	res_name VARCHAR(20) DEFAULT 'unknown' NOT NULL,
	res_lname VARCHAR(20) DEFAULT 'unknown' NOT NULL,
	res_isadult ENUM('ADULT','MINOR'),
	PRIMARY KEY(res_tr_id,res_seatnum),
	CONSTRAINT reservTrip
	FOREIGN KEY(res_tr_id) REFERENCES trip(tr_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE event(
	ev_tr_id INT(11) NOT NULL,
	ev_start DATETIME NOT NULL,
	ev_end DATETIME NOT NULL,
	ev_descr TEXT,
	PRIMARY KEY(ev_tr_id, ev_start),
	CONSTRAINT EVEID
	FOREIGN KEY (ev_tr_id) REFERENCES trip(tr_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE admin(
	adm_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	adm_type ENUM ('LOGISTICS', 'ADMINISTRATIVE', 'ACCOUNTING') NOT NULL,
	adm_diploma VARCHAR(200) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(adm_AT),
	CONSTRAINT ADMWRK FOREIGN KEY (adm_AT) REFERENCES worker(wrk_AT)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE manages(
	mng_adm_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
	mng_br_code INT(11) NOT NULL,
	PRIMARY KEY(mng_adm_AT, mng_br_code),
	CONSTRAINT MNGADM FOREIGN KEY (mng_adm_AT) REFERENCES admin(adm_AT)
	ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT MNGBR FOREIGN KEY (mng_br_code) REFERENCES branch(br_code)
	ON DELETE CASCADE ON UPDATE CASCADE	
);

CREATE TABLE  ItBranch(
	IT_AT CHAR(10),
	password CHAR(10) DEFAULT 'password' NOT NULL,
	start_date DATE  NOT NULL,
	end_date DATE,
	PRIMARY KEY(IT_AT),
	CONSTRAINT ItBr FOREIGN KEY(IT_AT) REFERENCES worker(wrk_AT) 
	ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE offers(
	id_offer INT(4) NOT NULL,
	off_start_date DATE NOT NULL,
	off_end_date DATE NOT NULL,
	person_cost FLOAT(7,2),
	off_dst_id INT(11),
	PRIMARY KEY(id_offer),
	CONSTRAINT off FOREIGN KEY(off_dst_id) REFERENCES destination(dst_id) 
	ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE reservation_offers(
	rsv_of_code INT(4) NOT NULL,
	clt_lastname VARCHAR(50) DEFAULT 'unknown' NOT NULL,
	clt_name VARCHAR(50) DEFAULT 'unknown' NOT NULL,
	of_code INT(4) NOT NULL,
	deposit FLOAT(7,2),
	PRIMARY KEY(rsv_of_code),
	CONSTRAINT RSVOF FOREIGN KEY(of_code) REFERENCES offers(id_offer)
	ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE log(
	InsertedData TEXT,
	DeletedData TEXT,
	UpdatedData TEXT
);