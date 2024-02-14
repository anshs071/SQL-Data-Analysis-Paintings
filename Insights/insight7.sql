--Identify the museums with invalid city information in the given dataset

select * from museum
where city ~ '^[0-9]'