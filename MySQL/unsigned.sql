All integer types can have an optional (nonstandard) attribute UNSIGNED. Unsigned type can be used to permit only nonnegative numbers in a column or when you need a larger upper numeric range for the column. For example, if an INT column is UNSIGNED, the size of the column's range is the same but its endpoints shift from -2147483648 and 2147483647 up to 0 and 4294967295.

Basically, instead of a maximum 2147483647 positive integers for a SIGNED column, you will get 4294967295 positive integers for an UNSIGNED column. You are removing the possibility of negative numbers when using the UNSIGNED attribute.

The range for a SIGNED attribute is: -2147483648 and 2147483647.
The range for an UNSIGNED attribute is: 0 and 4294967295.
