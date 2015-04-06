-- Create trigger to prevent the insertion of data into a table.
create trigger name_of_trigger
on name_of_table
after insert
as
begin
print 'Insert Not Allowed'
rollback transaction
end
go

-- Create trigger to prevent the creation of a table in a database.
create trigger name_of_trigger
on database
after create_table
as
begin
print 'Creation of tables is not allowed.'
rollback transaction
end
go

