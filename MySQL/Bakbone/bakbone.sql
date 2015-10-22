<?php

//Bakbone table query.
use bakbone;
select l.logfile, t.tapename, b.path from logfiles l join tapes t on (l.tape_id=t.id) join backups b on (b.tape_id=t.id) where b.path like '%insane%' order by t.id;


?>