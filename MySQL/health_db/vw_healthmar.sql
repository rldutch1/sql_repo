 CREATE VIEW `vw_healthmar` AS select 
 concat(`p`.`firstname`,_latin1' '
 ,`p`.`middlename`,_latin1' '
 ,`p`.`lastname`,_latin1' ') AS `person`
 ,`m`.`medication` AS `medication`
 ,`m`.`dose` AS `dose`
 ,`m`.`unit` AS `unit`
 ,`m`.`admin_dttm` AS `date_time` 
 from (`healthmar` `m` 
 join `healthperson` `p` on(((`m`.`person_id` = `p`.`id`) and (`m`.`active_ind` = 1))))

