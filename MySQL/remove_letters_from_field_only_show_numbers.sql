https://stackoverflow.com/questions/22510736/mysql-select-only-numeric-values-from-varchar-column
  SELECT * 
  FROM mixedvalues 
  WHERE value REGEXP '^[0-9]+$';

