
  create or replace   view RAW.jaffle_shop_xf.stg_stripe__payments
  
  
  
  
  as (
    select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

from raw.stripe.payment

  );

