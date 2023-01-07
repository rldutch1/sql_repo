select
	h.name
	, h.id
	, m.company
	, m.address1
	, m.address2
	, m.city
	, state
	, zip
	, fed_id
	, phone
	, fax
	, website
	, email
	, aka
from 
	hardware h
join 
	manufacturers m on (h.mfg_id = m.id);
--	\. /Users/rob/Documents/SQL/passagepoint.hardware.manufacturers.sql

