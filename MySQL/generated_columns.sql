https://www.mysqltutorial.org/mysql-generated-columns/

The syntax for defining a generated column is as follows:

  column_name data_type [GENERATED ALWAYS] AS (expression)
     [VIRTUAL | STORED] [UNIQUE [KEY]]

First, specify the column name and its data type.

Next, add the GENERATED ALWAYS clause to indicate that the column is a generated column.

Then, indicate whether the type of the generated column by using the corresponding option: VIRTUAL or STORED. By default, MySQL uses VIRTUAL if you don’t specify explicitly the type of the generated column.

After that, specify the expression within the braces after the AS keyword. The expression can contain literals, built-in functions with no parameters, operators, or references to any column within the same table. If you use a function, it must be scalar and deterministic.

Finally, if the generated column is stored, you can define a unique constraint for it.

Generated column:
Columns are generated because the data in these columns are computed based on predefined expressions. Basically, the columns are generated on the fly based on the data that already exists in the table.

  Virtual Column:
  The "fullname" column is Virtual by default because the generated column type was not specified.
    DROP TABLE IF EXISTS contacts;

    CREATE TABLE contacts (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        fullname varchar(101) GENERATED ALWAYS AS (CONCAT(first_name,' ',last_name)),
        email VARCHAR(100) NOT NULL
    );

  MySQL provides two types of generated columns: stored and virtual. The virtual columns are calculated on the fly each time data is read whereas the stored column are calculated and stored physically when the data is updated.

  Based on this definition, the fullname column that in the example above is a virtual column.

  Stored Column: (If the generated column is stored, you can define a unique constraint for it.)
    ALTER TABLE products ADD COLUMN stockValue DOUBLE GENERATED ALWAYS AS (buyprice*quantityinstock) STORED;
