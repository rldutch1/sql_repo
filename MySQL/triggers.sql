https://www.youtube.com/watch?v=BeG4IHFjqVg
https://www.youtube.com/watch?v=7dZKJxoGRGI
Triggers are tied or attached to tables. This means that the trigger only works on the table your query is running in. If you switch databases the trigger will not appear in another database. 

show triggers;
drop trigger triggername;

create trigger triggername triggertime triggerevent on tablename
for each row triggerstatement;
1. triggername - Name of trigger.
2. triggertime - Before or After.
3. triggerevent - Insert, Update, or Delete event.
4. triggerstatement - A standard SQL statement. Generally is a single statement but can be multiple statements. 

The default MySQL statement delimeter is a semi-colon.

You have to use a different delimeter when creating a trigger.

delimeter |
	create trigger triggername triggertime triggerevent on tablename
	for each row triggerstatement;
	statement1;
	statement2;
	statementn;
	end;
	delimeter ;
	
Example:
	delimeter |
	create trigger insert_attempt after insert on employees
	for each row BEGIN
		insert into employees_update values(default);
	end; |
	delimeter |


Manual speaks clear: "This means, for example, that you cannot set the default for a date column to be the value of a function such as NOW() or CURRENT_DATE". 
http://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html
delimeter |
CREATE TRIGGER `triggername` BEFORE INSERT ON  `tablename` 
FOR EACH ROW 
SET NEW.datetimefield = NOW();
END |
delimeter ;
