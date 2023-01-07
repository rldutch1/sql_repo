-- vw_healthsummary
CREATE VIEW `vw_healthsummary` AS
select concat(`p`.`firstname`,' ',`p`.`middlename`,' ',`p`.`lastname`,' ') AS `person`,
`med`.`medication` AS `medication`,
concat(`hm`.`dose`,' ',`du`.`unit`) AS `dose_unit`,
`hm`.`admin_dttm` AS `admin_dttm`,
`ht`.`temp_f` AS `temp_f`,
-- If the converted celcius is less than zero display a dash otherwise display the celcius.
if((substr(((`ht`.`temp_f` - 32) * (5 / 9)),1,5) < 0),'-',convert(substr(((`ht`.`temp_f` - 32) * (5 / 9)),1,5))) AS `temp_c`,
`ht`.`symptom` AS `symptom`
from ((((`h_mar` `hm`
join `h_person` `p` on(((`hm`.`person_id` = `p`.`id`)
	and (`hm`.`active_ind` = 1))))
join `h_med` `med` on(((`hm`.`medication` = `med`.`id`)
	and (`med`.`active_ind` = 1))))
join `h_unit` `du` on(((`hm`.`unit` = `du`.`id`)
	and (`du`.`active_ind` = 1))))
join `h_temp` `ht` on(((`hm`.`person_id` = `ht`.`person_id`)
	and (`hm`.`id` = `ht`.`hm_id`))))
order by `hm`.`admin_dttm` desc
