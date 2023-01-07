select year(cur_dttm) as Year, month(cur_dttm) as Month from tablename
order by cur_dttm desc limit 0, 10;


-- Show average weight for May 2013:

select avg(pounds) as avg_pounds from (select pounds from weight where
year(date) = 2013 and month(date) = 5 order by date desc) a;
