https://www.youtube.com/watch?v=BeG4IHFjqVg
https://www.youtube.com/watch?v=7dZKJxoGRGI
Triggers are tied or attached to tables.

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
