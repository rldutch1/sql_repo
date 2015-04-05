trim(fieldname)
TRIM(Replace(Replace(Replace(fieldname,'\t',''),'\n',''),'\r',''));

select id, term, ccl_program, TRIM(Replace(Replace(Replace(code_snippet,'\t',''),'\n',''),'\r','')), filename, filesize from iviewterms limit 0, 10;


update iviewterms set code_snippet = TRIM(Replace(Replace(Replace(code_snippet,'\t',''),'\n',''),'\r',''));
