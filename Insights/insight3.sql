-- Fetch all the paintings which are not displayed on any museums?

select * from work 
where museum_id is null