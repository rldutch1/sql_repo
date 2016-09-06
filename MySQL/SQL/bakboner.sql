/*
Joblist has: jobname, job_id, active_ind.
Jobs has: jobtitle, tape_id, nv_job_id, job_dt_tm.
		(jl.job_id = jo.nv_job_id)
		(jl.jobname = jo.jobtitle)
*/


select
	jl.job_id
	, jl.jobname
	, jo.tape_id
	, jo.job_dt_tm

from joblist jl
join jobs jo on (jl.job_id = jo.nv_job_id)


/*
select * from jobs where nv_job_id not in
(select
	jl.job_id

from joblist jl
join jobs jo on (jl.job_id = jo.nv_job_id)
)
*/
