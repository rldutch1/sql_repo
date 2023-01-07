select m.*, c.firstname, c.lastname, c.workphone, c.cellphone, c.title
    from 
    manufacturers m
    join contacts c on (m.id = c.mfg_id);
-- http://webomania.wordpress.com/2006/10/01/out-of-range-value-adjusted-for-column-error/
-- ScanShell Fax: (419) 735-2419
