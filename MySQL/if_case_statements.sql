There are times where running IF statements inside a query can be useful. MySQL provides a simple way to do this through the use of IF and CASE statements.

The IF statement takes three arguments; the conditional, the true value and the false value. False and true values may be static values or column values. For example:

SELECT IF(score > 100, 100, score) AS score
FROM exam_results

this will return the value in the score column limited to a maximum value of 100. IF statements can also be nested:

SELECT IF(score > 100, 100, IF(score < 0, 0, score)) FROM exam_results

CASE statements (switch statements for those C programmers) are much like if statements. For example:

SELECT CASE num_heads
WHEN 0 THEN 'Zombie'
WHEN 1 THEN 'Human'
ELSE 'Alien'
END AS race
FROM user

This code checks the value in the num_heads coumln and deduces race from the values presented. CASE statements may also be nested in the same way as IF statements.