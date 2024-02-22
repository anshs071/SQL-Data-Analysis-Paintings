-- Are there museums without any paintings?

select * from museum m
where not exists (
    select 1
    from work w
    where w.museum_id = m.museum_id
)



--Identify the museums which are open on both Sunday and Monday. Display museum name, city.

select m.name, m.city, string_agg(mh.day, ', ') as days
from museum as m
join museum_hours as mh on m.museum_id = mh.museum_id
where mh.day in ('Sunday', 'Monday')
group by m.museum_id, m.name, m.city
having count(distinct mh.day) = 2



--Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

select m.name, count(w.name) as paintings_count
from museum as m
join work as w on m.museum_id = w.museum_id
group by m.name, m.museum_id  
order by paintings_count desc
limit 5



--Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)

select a.full_name, count(w.work_id) as paintings_done
from artist as a
join work as w on w.artist_id = a.artist_id
group by a.artist_id, a.full_name
order by paintings_done desc



-- How many paintings have an asking price of more than their regular price?

select * from product_size
where sale_price > regular_price;



-- Fetch all the paintings which are not displayed on any museums?

select * from work 
where museum_id is null



-- Identify the paintings whose asking price is less than 50% of its regular price

select * from product_size
where sale_price < (0.5*regular_price)



-- Which canva size costs the most?

select cs.label as canva, ps.sale_price
from (select *, rank() over(order by sale_price desc) as rnk 
	  from product_size) ps
join canvas_size cs on cs.size_id::text=ps.size_id
where ps.rnk=1;	
	
--Alternatively
select cs.label as canva, ps.sale_price
from canvas_size as cs
join product_size as ps on cs.size_id = ps.size_id::bigint
where ps.sale_price = (
    select max(sale_price)::bigint from product_size
);





-- Delete duplicate records from work, product_size, subject and image_link tables

--Using ctid

delete from work
where ctid not in (
	select min(ctid) 
	from work 
	group by work_id);
	
delete from product_size
where ctid not in (
	select min(ctid) 
	from product_size 
	group by work_id);
	
delete from subject
where ctid not in (
	select min(ctid) 
	from subject 
	group by work_id);
	
delete from image_link
where ctid not in (
	select min(ctid) 
	from image_link 
	group by work_id);





--Identify the museums with invalid city information in the given dataset

select * from museum
where city ~ '^[0-9]'



--Museum_Hours table has 1 invalid entry. Identify it and remove it.

delete from museum_hours 
where ctid not in (
	select min(ctid)
	from museum_hours
	group by museum_id, day );




--Fetch the top 10 most famous painting subject

select * from (
select s.subject, count(1) as No_of_Paintings, 
	rank() over(order by count(1) desc) as ranking
from work as w
join subject as s on w.work_id = s.work_id
group by s.subject
)
where ranking <= 10



