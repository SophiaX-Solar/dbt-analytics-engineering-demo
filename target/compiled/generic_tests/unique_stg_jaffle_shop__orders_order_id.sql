
    
    

select
    order_id as unique_field,
    count(*) as n_records

from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
where order_id is not null
group by order_id
having count(*) > 1


