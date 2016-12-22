use Canned_mPage;
-- alter table directories add constraint FK_Domain_ID foreign key (domain_id) references domain (id) on delete cascade on update cascade
-- create index d_id on directories (domain_id);
-- alter table domain add active_ind int null constraint active_ind_dom default '1';

-- select * from directories;
-- select * from domain do;

select
	('\\PHX00027\'+lower(do.domain_name)+'\custom\mpages\'+d.foldername+'\') as UNC_Path, ('git clone //bhs/groups/BCC_1/cerner/Millennium/mpage/gitrepositories/'+lower(do.domain_name)+'_'+d.foldername+'.git') as Clone_Path
from
	directories d
join domain do on (d.domain_id = do.id)
and d.active_ind = do.active_ind -- Make sure results have identical active_ind
and d.active_ind = 1; --Only look for active_ind

