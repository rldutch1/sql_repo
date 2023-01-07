
select
state_born
, count(*) count
from us_presidents
group by state_born;

select
up.state_born
, count(*) pres_count
from us_presidents up
group by up.state_born;

select
up.state_born
, count(*) pres_count
from us_presidents up
join us_states uss on (up.state_born = s_id)
group by up.state_born;

select
uss.state
, count(*) pres_count
from us_presidents up
join us_states uss on (up.state_born = uss.s_id)
group by uss.state
order by pres_count desc;
