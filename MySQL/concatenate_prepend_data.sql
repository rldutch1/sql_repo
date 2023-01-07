/*
Prepending data in a column can be done with any alphanumeric characters. This example uses a period.

 mysql> select * from namelist;
 +—-+———-+————+
 | id | first    | last       |
 +—-+———-+————+
 | 61 | Dutch    | Shultz     |
 | 62 | Winnie   | Pooh       |
 | 63 | Spider   | Man        |
 | 64 | Super    | Man        |
 | 65 | Green    | Lantern    |
 | 66 | Yellow   | Lantern    |
 | 67 | Bunky    | Carmichael |
 | 68 | Mo       | Zilla      |
 | 69 | God      | Zilla      |
 | 70 | File     | Zilla      |
 | 71 | Wonder   | Woman      |
 | 72 | Johnny   | Jack       |
 | 73 | Tubby    | Twoton     |
 | 74 | Darrel   | McFarrel   |
 | 75 | Nancy    | McFancy    |
 | 76 | Donovan  | Williams   |
 | 77 | Willie   | Mays       |
 | 78 | Abraham  | Lincoln    |
 | 79 | Barry    | Bonds      |
 | 80 | Mohammad | Ali        |
 +—-+———-+————+
 20 rows in set (0.00 sec)

Prepend the data in the column with a period by using the update command.
 mysql> update namelist set last = concat(“.”, last);

The last column now looks like this.

 mysql> select * from namelist;
 +—-+———-+————-+
 | id | first    | last        |
 +—-+———-+————-+
 | 61 | Dutch    | .Shultz     |
 | 62 | Winnie   | .Pooh       |
 | 63 | Spider   | .Man        |
 | 64 | Super    | .Man        |
 | 65 | Green    | .Lantern    |
 | 66 | Yellow   | .Lantern    |
 | 67 | Bunky    | .Carmichael |
 | 68 | Mo       | .Zilla      |
 | 69 | God      | .Zilla      |
 | 70 | File     | .Zilla      |
 | 71 | Wonder   | .Woman      |
 | 72 | Johnny   | .Jack       |
 | 73 | Tubby    | .Twoton     |
 | 74 | Darrel   | .McFarrel   |
 | 75 | Nancy    | .McFancy    |
 | 76 | Donovan  | .Williams   |
 | 77 | Willie   | .Mays       |
 | 78 | Abraham  | .Lincoln    |
 | 79 | Barry    | .Bonds      |
 | 80 | Mohammad | .Ali        |
 +—-+———-+————-+
 20 rows in set (0.00 sec)
*/

This is a query that I used to sequentially rename some video files so they would be in the correct order. I accidentally numbered them 1 to 32 and they were in alphabetical order instead of chronological order. I had to renumber them so they would be in chronolocial order:

I used the concat and substring_index functions:

	select concat('mv ',oldname,' ',newnum,'.',substring_index(oldname,'.',-2)) as Rename_Script from v_rename;


Concatenate multiple MySQL rows into one field?
You can use GROUP_CONCAT:

SELECT person_id, GROUP_CONCAT(hobbies SEPARATOR ', ')
FROM peoples_hobbies
GROUP BY person_id;
As Ludwig stated in his comment, you can add the DISTINCT operator to avoid duplicates:

SELECT person_id, GROUP_CONCAT(DISTINCT hobbies SEPARATOR ', ')
FROM peoples_hobbies 
GROUP BY person_id;
As Jan stated in their comment, you can also sort the values before imploding it using ORDER BY:

SELECT person_id, GROUP_CONCAT(hobbies ORDER BY hobbies ASC SEPARATOR ', ')
FROM peoples_hobbies
GROUP BY person_id;
As Dag stated in his comment, there is a 1024 byte limit on the result. To solve this, run this query before your query:

SET group_concat_max_len = 2048;
Of course, you can change 2048 according to your needs. To calculate and assign the value:

SET group_concat_max_len = CAST(
    (SELECT SUM(LENGTH(hobbies)) + COUNT(*) * LENGTH(', ')
    FROM peoples_hobbies 
    GROUP BY person_id)
    AS UNSIGNED
);

Source: https://stackoverflow.com/questions/276927/can-i-concatenate-multiple-mysql-rows-into-one-field?rq=1
