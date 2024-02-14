-- How many paintings have an asking price of more than their regular price?

select * from product_size
where sale_price > regular_price;