select
    order_id,
    sum(amount) as total_amount
from RAW.jaffle_shop_xf.stg_stripe__payments
group by 1
having total_amount < 0