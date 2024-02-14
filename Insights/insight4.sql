-- Identify the paintings whose asking price is less than 50% of its regular price

select * from product_size
where sale_price < (0.5*regular_price)