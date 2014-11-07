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