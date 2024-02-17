--Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)

select a.full_name, count(w.work_id) as paintings_done
from artist as a
join work as w on w.artist_id = a.artist_id
group by a.artist_id, a.full_name
order by paintings_done desc