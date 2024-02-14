--Museum_Hours table has 1 invalid entry. Identify it and remove it.

delete from museum_hours 
where ctid not in (
	select min(ctid)
	from museum_hours
	group by museum_id, day );
