Move DataTables.js in BUILD to use the Websphere.

Sandbox:
	Need the latest version of the mPages: I:\Winintel\Static_Content\MPAGES_6_10




1bh_mp_ens_aos_enrollment.prg
1bh_mp_get_aos_data.prg

Downloads\Custom_Component_in_Cerner_Environment-Sandbox.mp4
https://bannerhealth.sharepoint.com/:f:/r/teams/GRP_AdvisorsRulesmPagesARMTeam/Shared%20Documents/Team%20Projects/Custom_Component_Best_Practice/Sandbox?csf=1&e=fs1Kjs

321MB MPAGES_6_10_VENBANNER

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
