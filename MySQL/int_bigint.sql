-- http://stackoverflow.com/questions/3135804/types-in-mysql-bigint20-vs-int20-etcc

INT is a four-byte signed integer. BIGINT is an eight-byte signed integer.

The 20 in INT(20) and BIGINT(20) means almost nothing. It's a hint for display width, it has nothing to do with storage. Practically, it affects only the ZEROFILL option:

CREATE TABLE foo ( bar INT(20) ZEROFILL );
INSERT INTO foo (bar) VALUES (1234);
SELECT bar from foo;

+----------------------+
| bar                  |
+----------------------+
| 00000000000000001234 |
+----------------------+
It's a common source of confusion for MySQL users to see INT(20) and assume it's a size limit, something analogous to CHAR(20).