-- Find all Wordpress posts where comments are allowed.
SELECT *
FROM  xx_posts
where comment_status = "open"
and post_author = 2
and post_type = "post"
and post_status = "publish"
LIMIT 0 , 4000
