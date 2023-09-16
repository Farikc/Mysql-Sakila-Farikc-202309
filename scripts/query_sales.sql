use sakila;

-- 1. Con CTE
with ventas_por_tienda as (
select
    st.store_id,
    concat(a.address, ', ', ci.city) as store_city,
    co.country_id,
    concat(sf.first_name, ' ', sf.last_name) as staff_name,
    p.amount,
    year(p.payment_date) as payment_year,
    month(p.payment_date) as payment_month,
    dayofmonth(p.payment_date) as payment_day

from store as st
    join address as a using (address_id)
    join city as ci using (city_id)
    join country as co using(country_id)
    join staff as sf using(store_id)
    join payment as p using(staff_id)
),
-- 2. Agrupar
ventas_por_tienda_por_ano_mes as (
select 
    store_id,
    payment_year,
    payment_month,
    sum(amount) as amount
from ventas_por_tienda
group by store_id, payment_year, payment_month
),
-- 3. Poner las sumas de los meses en las columnas
ventas_por_tienda_por_mes as (
select
    store_id,
    sum(case when payment_year=2005 and payment_month=5 then amount else 0 end) may2005,
    sum(case when payment_year=2005 and payment_month=6 then amount else 0 end) jun2005,
    sum(case when payment_year=2005 and payment_month=7 then amount else 0 end) jul2005
from ventas_por_tienda_por_ano_mes
group by store_id
),
-- 4. Calculas diferencias
ventas_por_tienda_comparativo as (
select 
    store_id,
    may2005,
    jun2005,
    (jun2005 - may2005) as diffjun2005,
    jul2005,
    (jul2005 - jun2005) as diffjul2005
from ventas_por_tienda_por_mes
)

select * 
from ventas_por_tienda_comparativo
limit 5;

/*
por cliente cuanto me han comprado mes a mes

*/