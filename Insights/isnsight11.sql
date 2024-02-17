--Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

select m.name, count(w.name) as paintings_count
from museum as m
join work as w on m.museum_id = w.museum_id
group by m.name, m.museum_id  
order by paintings_count desc
limit 5