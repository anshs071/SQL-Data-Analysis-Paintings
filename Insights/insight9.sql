--Fetch the top 10 most famous painting subject

select * from (
select s.subject, count(1) as No_of_Paintings, 
	rank() over(order by count(1) desc) as ranking
from work as w
join subject as s on w.work_id = s.work_id
group by s.subject
)
where ranking <= 10