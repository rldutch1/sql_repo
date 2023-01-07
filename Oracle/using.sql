-- https://stackoverflow.com/questions/2890572/cannot-have-a-qualifier-in-the-select-list-while-performing-a-join-w-using-keyw

-- It is complaining about the oi qualifier:

SELECT oi.order_id, product_jd, order_date
       ^^^
-- Oracle does not allow qualifiers in combination with a using join. The clearest way out is using a regular join:

SELECT oi.order_id, product_jd, order_date
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id

-- You can also omit the qualifier. The using statement tells Oracle that even though there are two fields called order_id, they are both equal:

SELECT order_id, product_jd, order_date
FROM order_items oi JOIN orders o
USING(order_id)

