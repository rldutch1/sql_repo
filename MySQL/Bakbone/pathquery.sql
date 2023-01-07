select
	jo.nv_job_id,
	jo.job_dt_tm,
	jo.tape_id,
	lf.tape_id,
	jo.jobtitle
from
	jobs jo
join logfiles lf on (lf.jobs_id = jo.id)
limit 0, 100;

select
	jo.nv_job_id,
	jo.job_dt_tm,
	jo.tape_id,
	jo.jobtitle,
	ba.path
from
	jobs jo
join logfiles lf on (lf.jobs_id = jo.id)
join backups ba on (ba.log_id = lf.id)
and ba.path like '%Pushing Crash Cart 1%'
limit 0, 100;

select
	jo.nv_job_id,
	jo.job_dt_tm,
	jo.tape_id,
	jo.jobtitle,
	ba.path
from
	jobs jo
join logfiles lf on (lf.jobs_id = jo.id)
join backups ba on (ba.log_id = lf.id)
and ba.path like '%muhammed%'
limit 0, 100;
