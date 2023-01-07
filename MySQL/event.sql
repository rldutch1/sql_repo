--- http://stackoverflow.com/questions/10314806/mysql-triggers-deleting-a-row-after-inactivity
--- Firstly do not put this update/delete in a trigger if you have millions of rows that needs to be deleted you are going to see a huge performance hit on inserts/updates. It is not the best place for it. You can create either a cron job as Filype suggested. Or if you want to keep it all in MySQL use the MySQL Event scheduler.
-
--- Go to this page to read more about scheduling events in MySQL: http://dev.mysql.com/doc/refman/5.1/en/events.html
-
--- MySQL Event allows you to schedule things on MySQL on a regular basis.
-
--- The code would look something like
-
- CREATE EVENT myevent
- ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR
- DO
-  DELETE FROM MyTable Where Expired< NOW();

Example updates the state column to 1 if it is older than 24 hours.
Check a table every hour and update a column that is 24 hours old:
CREATE EVENT reset
    ON SCHEDULE
      EVERY 1 HOUR
        DO
update T1 
set state=1 
where time < date_sub(now(),interval 24 hour) 
  and (state=0 or state=2) ;
Source: https://dba.stackexchange.com/questions/56424/column-auto-updated-after-24-hours-in-mysql

CREATE EVENT reset ON SCHEDULE EVERY 1 HOUR DO update test set state=1 where time < date_sub(now(),interval 24 hour) and (state=0 or state=2);
