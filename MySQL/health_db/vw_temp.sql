 CREATE VIEW `vw_temp` AS select 
 concat(`p`.`firstname`,' '
 ,`p`.`middlename`,' '
 ,`p`.`lastname`,' ') AS `person`
 ,substr(((`t`.`temp_f` - 32) * (5 / 9)),1,5) AS `celcius`,`t`.`temp_f` AS `Fahrenheit`
 ,`t`.`temp_dttm` AS `date_time` 
 from (`healthtemperature` `t` 
 join `healthperson` `p` on((`t`.`person_id` = `p`.`id`)));

