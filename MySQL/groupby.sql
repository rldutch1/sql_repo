-- Find duplicate data in a column.

SELECT column1, COUNT(*) c FROM tablename GROUP BY column1 HAVING c > 1;

-- Show number of presidents from each state.
select state_born State, count(*) Number_of_Presidents from uspresidents group by state having Number_of_Presidents > 0 order by Number_of_Presidents, state;