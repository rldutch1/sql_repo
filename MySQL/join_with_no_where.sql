-- Source: http://stackoverflow.com/questions/1219909/mysql-join-with-where-clause

QUESTION:

  I have two tables I want to join.

  I want all of the categories in the categories table and also all of the categories subscribed to by a user in the category_subscriptions table.

  essentially this is my query so far:

  SELECT *
  FROM categories
  LEFT JOIN user_category_subscriptions
       ON user_category_subscriptions.category_id = categories.category_id
  This works fine however I want to add a where clause on the end of the query which then essentially makes it an inner/equi join.

     SELECT *
      FROM categories
      LEFT JOIN user_category_subscriptions
           ON user_category_subscriptions.category_id = categories.category_id
     WHERE user_category_subscriptions.user_id = 1
  How do I get all the categories as well as all the categories subscribed to by a particular user using only one query?

  category_id being a key in both categories table and user_category_subscriptions. user_id residing in the user_category_subscriptions table.

  thanks

ANSWER:

  You need to put it in the join clause, not the where:

  SELECT *
  FROM categories
  LEFT JOIN user_category_subscriptions ON
      user_category_subscriptions.category_id = categories.category_id
      and user_category_subscriptions.user_id =1
  See, with an inner join, putting a clause in the join or the where is equivalent. However, with an outer join, they are vastly different.

  As a join condition, you specify the rowset that you will be joining to the table. This means that it evaluates user_id = 1 first, and takes the subset of user_category_subscriptions with a user_id of 1 to join to all of the rows in categories. This will give you all of the rows in categories, while only the categories that this particular user has subscribed to will have any information in the user_category_subscriptions columns. Of course, all other categories will be populated with null in the user_category_subscriptions columns.

  Conversely, a where clause does the join, and then reduces the rowset. So, this does all of the joins and then eliminates all rows where user_id doesn't equal 1. You're left with an inefficient way to get an inner join.

  Hopefully this helps!

