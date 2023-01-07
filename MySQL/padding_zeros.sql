-- Number padding
-- Prepend zeros to numbers. There are some links that I saw that said you will need to convert the column to non-numerical to get this to work but I did it on an integer field and it worked.

-- The 8 means to pad up to 8 characters, the zero is the character you want to pad with.
SELECT LPAD('1234567', 8, '0');
