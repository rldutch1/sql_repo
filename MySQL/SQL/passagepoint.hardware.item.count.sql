-- Hardware Item Count
select 
	h.name
	, count(s.model) as "Item Count"
from hardware h
join serials s on (h.mfg_id = s.model)
group by s.model order by h.name;

-- \. /Users/rob/Documents/SQL/passagepoint.hardware.item.count.sql


/*
mysql> \. /Users/rob/Documents/SQL/passagepoint.hardware.item.count.sql
+--------------------------------------------+------------+
| name                                       | Item Count |
+--------------------------------------------+------------+
| ADHESIVE DT BLANK BADGE DYMO 250 ROLL      |          1 |
| HP DL360G7 CTO CHASSIS                     |          1 |
| ID-SCAN 1000A FLAT BED SCANNER             |         25 |
| LOGITECH QUICK CAM ORBIT AF WEBCAM V-UCC22 |         25 |
| SYMBOL HAND SCANNER LS 2208-SR200001R-UR   |         25 |
| ZEBRA LP2824 USB PTR                       |         10 |
+--------------------------------------------+------------+

update hardware set mfg_id = '3' where id = '5'; SHOULD BE update hardware set mfg_id = '10' where id = '5';
update hardware set mfg_id = '8' where id = '6'; SHOULD BE update hardware set mfg_id = '8' where id = '6';

*/