use sakila;

/*
select customer_id,max(amount)
from payment
group by customer_id
limit 10;


select distinct p1.amount
from payment p1
where 2 = (select count(distinct amount) from payment p2 where p1.amount <= p2.amount);


select distinct amount
from payment
order by amount desc
limit 10; 

select distinct amount
from payment
order by amount desc
limit 1 , 1;
*/

(select *
from payment
limit 10)
UNION
(select * 
from payment
limit 5,10)

