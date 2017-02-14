create table uspresidents (id int(11) unsigned auto_increment primary key
firstname varchar(20) not null
, middlename varchar(20) null
, lastname varchar(20) not null
, birth date not null
, death date null
, presidency_start date not null
, presidency_end date null
, state_born varchar(20) not null
, party varchar(30) not null
, vice_president varchar(50) not null
) engine=innodb;

insert into uspresidents (firstname, middlename, lastname, birth, death, presidency_start, presidency_end, state_born, party, vice_president) values
("George", "", "Washington", "1732-02-22", "1799-12-14", "1789-04-30", "1797-03-04", "Virginia", "Federalist", "John Adams"),
("John", "", "Adams", "1735-10-30", "1826-07-04", "1797-03-04", "1801-03-04", "Massachusetts", "Federalist", "Thomas Jefferson"),
("Thomas", "", "Jefferson", "1743-04-13", "1826-07-04", "1801-03-04", "1809-03-04", "Virginia", "Democratic-Republican", "Aaron Burr, George Clinton"),
("James", "", "Madison", "1751-03-16", "1836-06-28", "1809-03-04", "1817-03-04", "Virginia", "Democratic-Republican", "George Clinton, Elbridge Gerry"),
("James", "", "Monroe", "1758-04-28", "1831-07-04", "1817-03-04", "1825-03-04", "Virginia", "Democratic-Republican", "Daniel D. Tompkins"),
("John", "Quincy", "Adams", "1767-07-11", "1848-02-23", "1825-03-04", "1829-03-04", "Massachusetts" "Democratic-Republican", "John Calhoun"),
("Andrew", "", "Jackson", "1767-03-15", "1845-06-08", "1829-03-04", "1837-03-04", "Tennessee", "Democrat", "John C. Calhoun, Martin Van Buren"),
("Martin", "", "Van Buren", "1782-11-05", "1862-07-24", "1837-03-04", "1841-03-04", "New York", "Democrat", "Richard M. Johnson"),
("William", "Henry", "Harrison", "1773-02-09", "1841-04-04", "1841-03-04", "1841-04-04", "Ohio", "Whig", "John Tyler"),
("John", "", "Tyler", "1790-03-29", "1862-01-18", "1841-04-04", "1845-03-04", "Virginia", "Whig", "No Vice-President"),
("James", "Knox", "Polk", "1795-11-02", "1849-06-15", "1845-03-04", "1849-03-04", "Tennessee", "Democrat", "George Mifflin Dallas"),
("Zachary", "", "Taylor", "1784-11-24", "1850-07-09", "1849-03-04", "1850-03-04", "Louisiana", "Whig", "Millard Filmore"),
("Millard", "", "Filmore", "1800-01-07", "1874-03-08", "1850-07-09", "1853-03-04", "New York", "Whig", "No Vice-President"),
("Franklin", "", "Pierce", "1804-11-23", "1869-10-08", "1853-03-04", "1857-03-04", "New Hampshire", "Democrat", "William R. King"),
("James", "", "Buchanan", "1791-04-23", "1868-06-01", "1857-03-04", "1861-03-04", "Pennsylvania", "Democrat", "John C. Breckinridge"),
("Abraham", "", "Lincoln", "1809-02-12", "1865-04-15", "Illinois", "Republican", "Hannibal Hamlin, Andrew Johnson"),
("Andrew", "", "Johnson", "1808-12-29", "1875-07-31", "1865-04-15", "1869-03-04", "Tennessee", "Democratic-Union", "No Vice-President"),
("Ulysses", "Simpson", "Grant", "1822-02-27", "1885-07-23", "1869-03-04", "1877-03-04", "Illinois", "Republican", "Schyler Colfax, Henry Wilson"),
("Rutherford", "Birchard", "Hayes", "1822-10-04", "1893-01-17", "1877-03-04", "1881-03-04", "Ohio", "Republican", "William Wheeler"),
("James", "Abraham", "Garfield", "1831-11-19", "1881-09-19", "1881-03-04", "1881-09-19", "Ohio", "Republican", "Chester A. Aurthur"),
("Chester", "Alan", "Arthur", "1829-10-25", "1886-11-18", "1881-09-19", "1885-03-04", "New York", "Republican", "No Vice-President"),
("Stephen", "Grover", "Cleveland", "1837-03-18", "1908-06-24", "1885-03-04", "1889-03-04", "New York", "Democrat", "Thomas Hendricks"),
("Benjamin" "", "Harrison", "1833-08-20", "1901-03-13", "1889-03-04", "1893-03-04", "Indiana", "Republican", "Levi P. Morton"),
("Stephen", "Grover", "Cleveland", "1837-03-18", "1908-06-24", "1893-03-04", "1897-03-04", "New York", "Democrat", "Adalai Stevenson"),
("William", "", "McKinley", "1843-01-29", "1901-09-14", "1897-03-04", "1901-09-14", "Ohio", "Republican", "Garret Hobart, Theodore Roosevelt"),
("Theodore", "", "Roosevelt", "1858-10-27", "1919-01-06", "1901-09-14", "1904-03-04", "New York", "Republican", "Charles Fairbanks"),
("William", "Howard", "Taft", "1857-09-15", "1930-03-08", "1909-03-04", "1913-03-04", "Ohio", "Republican", "James Sherman"),
("Thomas", "Woodrow", Wilson", "1856-12-28", "1924-02-03", "1913-03-04", "1921-03-04", "
