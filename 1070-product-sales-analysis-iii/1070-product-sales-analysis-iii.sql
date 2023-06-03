# Write your MySQL query statement below
with t as (
select s.product_id, s.year as first_year, s.quantity, s.price,
    dense_rank() over (partition by s.product_id order by s.year) as rn
from sales s)

select product_id, first_year, quantity, price from t
where rn = 1;