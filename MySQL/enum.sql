/*
Enum is a good choice for boolean type of fields except that it is treated as a string 
and not an integer. In this case I just want to set a column in the table to indicate 
whether the row is active (1) or not (0). I do not want someone to accidentally enter 
a 2, 3, etc. in the field.
*/
-- http://komlenic.com/244/8-reasons-why-mysqls-enum-data-type-is-evil/

alter table healthtemperature1 add column active_ind enum('0','1') not null;

