-- Find duplicate data in a column.

SELECT column1, COUNT(*) c FROM tablename GROUP BY column1 HAVING c > 1;

-- Show number of presidents from each state.
select state_born State, count(*) Number_of_Presidents from uspresidents group by state having Number_of_Presidents > 0 order by Number_of_Presidents, state;

-- Needed to find out the maximum length of each column so that I could dynamically adjust the column width in PDF output. This shows the maximum length of the manufacturer_importer column.
select inventory_number, manufacturer_importer, max(char_length(`manufacturer_importer`)) Number_of_Characters from vw_ffl_book2 group by manufacturer_importer, inventory_number order by Number_of_Characters desc;

-- This shows me the maximum length of the model column from highest to lowest.
select model, max(char_length(`model`)) Number_of_Characters from vw_ffl_book2 group by model order by Number_of_Characters desc;
