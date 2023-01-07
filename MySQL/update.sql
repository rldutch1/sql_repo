--Update method
update tablename set columname = 'xxxxx' where id = 'yyyyy';

-- This example ignores the default "strict mode" setting (as of MySQL 5.7) for date/datetime being defaulted to 0000-00-00 or 0000-00-00 00:00:00.
-- https://stackoverflow.com/questions/36374335/error-in-mysql-when-setting-default-value-for-date-or-datetime.
update ignore fflbook set disposed_to_date = '0000-00-00' where disposed_to_date = '1111-11-11';

--Replace part of a string in a column (Note that it is case sensitive):
--https://stackoverflow.com/questions/10177208/update-a-column-value-replacing-part-of-a-string
UPDATE urls SET url = REPLACE(url, 'domain1.com/images/', 'domain2.com/otherfolder/');

