Online Example for MySQL:
SELECT @n := @n + 1 n,
       first_name, 
       last_name
  FROM table1, (SELECT @n := 0) m
 ORDER BY first_name, last_name
 
person, medication, dose_unit, admin_dttm, temp_f, temp_c, symptom

My working example:
select @n := @n + 1 place,
	person, medication, dose_unit, admin_dttm, temp_f, temp_c, symptom
from
	vw_healthsummary, (select @n := 0) m
order by temp_f desc limit 0, 50;


Online Example for SQLServer:

SELECT row_number() OVER (ORDER BY first_name, last_name) n,
       first_name, 
       last_name 
  FROM table1 


Source: https://stackoverflow.com/questions/16555454/how-to-generate-auto-increment-field-in-select-query
