-- Finding duplicate data. You need to use an aggregate function to count the data as alias
	select [order med id] omid, count([order med id]) omid_count
	from dbo.MasterMedlist_20170929_B
	group by [order med id] having count([order med id]) > 1