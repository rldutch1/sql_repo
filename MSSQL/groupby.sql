-- https://www.youtube.com/watch?v=E3rXVrTTROU

select count([order med id]) omid_count, [order med id] omid from dbo.MasterMedlist_20170929_B group by [order med id]

