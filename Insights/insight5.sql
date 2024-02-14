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

