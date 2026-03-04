a)

DELIMITER $
DROP PROCEDURE if exists prokataboli$
Create procedure prokataboli(in a FLOAT(7,2), in b FLOAT(7,2))
ΒEGIN
declare onoma VARCHAR(50);
declare eponymo VARCHAR(50); 

SELECT clt_lastname,clt_name,deposit
FROM reservation_offers
where deposit > a AND deposit < b
limit 0,60000;
END$
DELIMITER ;
CALL prokataboli(50,100);

Ευρετήριο:
create  index  clt_laname_resoff on reservation_offers(clt_lastname);

b)

DELIMITER $
DROP PROCEDURE if exists cl_lname$
Create procedure cl_lname(in a VARCHAR(50))
begin
declare eponymo VARCHAR(50);
declare onoma VARCHAR(50);
declare ofcode INT(4);
declare plithos VARCHAR(50);
select of_code,clt_lastname,clt_name
from reservation_offers 
inner join offers on of_code = id_offer
where clt_lastname=a ;
Select of_code,count(clt_name)
from(
select of_code,clt_lastname,clt_name
from reservation_offers 
inner join offers on of_code = id_offer
where clt_lastname = a)as pinakas
group by of_code;
end$
DELIMITER ;
CALL cl_lname('	Quintin	');

Ευρετήριο:
alter table  reservation_offers add index deposit_res_off(clt_lastname,deposit) using btree;




