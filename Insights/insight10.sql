--Identify the museums which are open on both Sunday and Monday. Display museum name, city.

select m.name, m.city, string_agg(mh.day, ', ') as days
from museum as m
join museum_hours as mh on m.museum_id = mh.museum_id
where mh.day in ('Sunday', 'Monday')
group by m.museum_id, m.name, m.city
having count(distinct mh.day) = 2