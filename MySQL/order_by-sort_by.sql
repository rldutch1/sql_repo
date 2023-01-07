
Numbers “natural sorting” in MySQL.
	https://stackoverflow.com/questions/8557172/mysql-order-by-sorting-alphanumeric-correctly
	https://www.copterlabs.com/natural-sorting-in-mysql/
	
	select lastname, firstname, salary, jobtitle, hiredate from payback order by cast(salary as unsigned), salary;


