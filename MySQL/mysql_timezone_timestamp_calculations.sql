SELECT CONVERT_TZ(displaytime,'GMT','MET');          
should work if your column type is timestamp, or date
You need to have the timezones loaded. See below if you don't have the timezones loaded.

select convert_tz(utc_dttm,'+00:00',@@global.time_zone) from journal2 where id = 1;
works if your server does not have the timezones loaded. The "@@global.time_zone is the servers time.
The UTC time with no offset (+00:00) from the servers time will give you the server time - obviously.
The Current time with offset of (-07:00) from the servers time will give you the UTC time - obviously.

Example:
Current database: robdba5
robdba5> select convert_tz(cur_dttm,'-07:00',@@global.time_zone) from journal3 where id = (select max(id) from journal3);
+--------------------------------------------------+
| convert_tz(cur_dttm,'-07:00',@@global.time_zone) |
+--------------------------------------------------+
| 2014-08-12 21:01:02                              |
+--------------------------------------------------+
1 row in set (0.00 sec)

robdba5> select convert_tz(utc_dttm,'+00:00',@@global.time_zone) from journal3 where id = (select max(id) from journal3);
+--------------------------------------------------+
| convert_tz(utc_dttm,'+00:00',@@global.time_zone) |
+--------------------------------------------------+
| 2014-08-12 21:01:02                              |
+--------------------------------------------------+
1 row in set (0.00 sec)

This looks pretty cool. Uses select statements to do math on the timestamp. Don't need timezone stuff loaded.
I got it from http://stackoverflow.com/questions/2523286/mysql-convert-tz
One of the more trick constructs in MySQL is the use of the INTERVAL keyword, best shown by example the (numeric value can be an expression or the field value)

select now() today, now() - interval 1 day yesterday;
+---------------------+---------------------+
| today               | yesterday           |
+---------------------+---------------------+
| 2011-05-26 13:20:55 | 2011-05-25 13:20:55 |
+---------------------+---------------------+
You can add them and subtract them anyway you like, this is why I never bother with the date/time add/subtract/convert functions

select now() a, now() - interval 1 day + interval 4 hour + interval 8 minute b;
+---------------------+---------------------+
| a                   | b                   |
+---------------------+---------------------+
| 2011-05-26 13:24:16 | 2011-05-25 17:32:16 |
+---------------------+---------------------+
You can use negative numbers (should be good for negative time zone offsets) these are the same:

select now() - interval 1 month a, now() + interval -1 month b;
+---------------------+---------------------+
| a                   | b                   |
+---------------------+---------------------+
| 2011-04-26 13:38:05 | 2011-04-26 13:38:05 |
+---------------------+---------------------+

These work too:

Show date minus 9 months:
select '2004-12-03 16:29:00' - interval 9 month conception;

Show birthdate and conception date in two columns:
select '2004-12-03 16:29:00' birthdate, '2004-12-03 16:29:00' - interval 9 month conception;

Show current datetime minus 1 day:
select now() a, now() - interval 1 day one_day_ago;

Show UTC timestamp minus 7 hours:
select utc_timestamp() - interval 7 hour UTC; //I can use this in a dropdown where the user just has to pick their timezone offset (+12 through +0 through -12

Show UTC timestamp plus 3 hours:
select utc_timestamp() + interval 3 hour UTC;

create table testime (id int(11) unsigned auto_increment primary key
, col1 varchar(100) not null
, col2 varchar(100) not null
, dt date not null
, tmstp timestamp
) engine=myisam;

select convert_tz(tmstp,'GMT','America/Phoenix') from testime;

Hour of Day Chart
AZ=UTC AZ=IQ
01=08  01=11
02=09  02=12
03=10  03=13
04=11  04=14
05=12  05=15
06=13  06=16
07=14  07=17
08=15  08=18
09=16  09=19
10=17  10=20
11=18  11=21
12=19  12=22
13=20  13=23
14=21  14=24
15=22  15=01
16=23  16=02
17=24  17=03
18=01  18=04
19=02  19=05
20=03  20=06
21=04  21=07
22=05  22=08
23=06  23=09
24=07  24=10

Show the timezone offset based on the timezone name.
SELECT Name,
	TIMESTAMPDIFF(HOUR, UTC_TIMESTAMP(), CONVERT_TZ(UTC_TIMESTAMP(), "Etc/UTC", Name)) as Offset
FROM 
	mysql.time_zone_name 
WHERE (Name IN ('America/Vancouver', 'Etc/UTC', 'America/Denver'));


