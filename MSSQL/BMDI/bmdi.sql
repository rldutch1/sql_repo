
use adreference_prod; select * from acquired_data_track where person_id = 1234567890;
-- delete from acquired_data_track where person_id = 1234567890;

declare @PID varchar(50);
set @PID='1234567890';
use adreference_prod; select * from acquired_data_track where person_id = @PID;
-- delete from acquired_data_track where person_id = @PID;
