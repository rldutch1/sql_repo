-- Create an output file formatted with comma delimiters and fields enclosed by quotes.

select * into outfile 'nfaweapons.txt' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' from weapons where nfa = 'yes';

/*
File will be located in the database folder. In my case (Fedora 12) it is located in /var/lib/mysql/play/nfaweapons.txt.
*/