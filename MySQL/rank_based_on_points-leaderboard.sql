https://stackoverflow.com/questions/67772143/create-view-with-an-additional-generated-column
Basically you want to RANK people based on points

If I recreate and populate the users table with

create table users
(
user_fname varchar,
user_lname varchar,
points int
);

insert into users values ('Carlo','Rossi',33);
insert into users values ('Mario','Bianchi',35);
insert into users values ('Giorgia','Verdi',35);
insert into users values ('Maria','Blu',37);
The leaderboard can be created with

create or replace view leaderboard as
select
RANK() OVER (ORDER BY POINTS DESC) as position,
user_fname,
user_lname,
points
from users
order by points desc;
That will provide

defaultdb=> select * from leaderboard order by position;
 position | user_fname | user_lname | points
----------+------------+------------+--------
        1 | Maria      | Blu        |     37
        2 | Mario      | Bianchi    |     35
        2 | Giorgia    | Verdi      |     35
        4 | Carlo      | Rossi      |     33
(4 rows)
Note that Mario Bianchi and Giorgia Verdi are both at the 2nd position since they share the same 35 points

