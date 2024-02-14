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

