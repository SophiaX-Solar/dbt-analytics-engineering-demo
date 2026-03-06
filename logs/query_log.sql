-- created_at: 2026-02-25T14:15:34.550279+00:00
-- finished_at: 2026-02-25T14:15:34.805549+00:00
-- elapsed: 255ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c2a677-0002-e95b-0003-1f32000c4026
-- desc: execute adapter call
show terse schemas in database RAW
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:35.332543+00:00
-- finished_at: 2026-02-25T14:15:35.451065+00:00
-- elapsed: 118ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe__payments
-- query_id: 01c2a677-0002-e900-0003-1f32000c208a
-- desc: Get table schema
describe table "RAW"."STRIPE"."PAYMENT";
-- created_at: 2026-02-25T14:15:35.398085+00:00
-- finished_at: 2026-02-25T14:15:35.478774+00:00
-- elapsed: 80ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__customers
-- query_id: 01c2a677-0002-e95b-0003-1f32000c402a
-- desc: Get table schema
describe table "RAW"."JAFFLE_SHOP"."CUSTOMERS";
-- created_at: 2026-02-25T14:15:35.402711+00:00
-- finished_at: 2026-02-25T14:15:35.506106+00:00
-- elapsed: 103ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__orders
-- query_id: 01c2a677-0002-e900-0003-1f32000c208e
-- desc: Get table schema
describe table "RAW"."JAFFLE_SHOP"."ORDERS";
-- created_at: 2026-02-25T14:15:36.044482+00:00
-- finished_at: 2026-02-25T14:15:36.167360+00:00
-- elapsed: 122ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe__payments
-- query_id: 01c2a677-0002-e95b-0003-1f32000c402e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "RAW"."JAFFLE_SHOP_XF" LIMIT 10000;
-- created_at: 2026-02-25T14:15:36.103796+00:00
-- finished_at: 2026-02-25T14:15:36.277279+00:00
-- elapsed: 173ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__orders
-- query_id: 01c2a677-0002-e8d6-0003-1f32000c5006
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "RAW"."JAFFLE_SHOP_XF" LIMIT 10000;
-- created_at: 2026-02-25T14:15:36.143813+00:00
-- finished_at: 2026-02-25T14:15:36.298473+00:00
-- elapsed: 154ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__customers
-- query_id: 01c2a677-0002-e8d6-0003-1f32000c500a
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "RAW"."JAFFLE_SHOP_XF" LIMIT 10000;
-- created_at: 2026-02-25T14:15:36.174223+00:00
-- finished_at: 2026-02-25T14:15:36.371321+00:00
-- elapsed: 197ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe__payments
-- query_id: 01c2a677-0002-e900-0003-1f32000c2092
-- desc: execute adapter call
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

  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_stripe__payments", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.301357+00:00
-- finished_at: 2026-02-25T14:15:36.494832+00:00
-- elapsed: 193ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__customers
-- query_id: 01c2a677-0002-e900-0003-1f32000c2096
-- desc: execute adapter call
create or replace   view RAW.jaffle_shop_xf.stg_jaffle_shop__customers
  
  
  
  
  as (
    select
    id as customer_id,
    first_name,
    last_name

from raw.jaffle_shop.customers
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop__customers", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.281462+00:00
-- finished_at: 2026-02-25T14:15:36.726100+00:00
-- elapsed: 444ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop__orders
-- query_id: 01c2a677-0002-e78c-0003-1f32000c30ce
-- desc: execute adapter call
create or replace   view RAW.jaffle_shop_xf.stg_jaffle_shop__orders
  
  
  
  
  as (
    select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from raw.jaffle_shop.orders
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop__orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.735033+00:00
-- finished_at: 2026-02-25T14:15:38.535009+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.relationships_stg_jaffle_shop__69c2006accf24d593d7f144684ebb92c.a1e64bf6d9
-- query_id: 01c2a677-0002-e900-0003-1f32000c209a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customer_id as from_field
    from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
    where customer_id is not null
),

parent as (
    select customer_id as to_field
    from RAW.jaffle_shop_xf.stg_jaffle_shop__customers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.relationships_stg_jaffle_shop__69c2006accf24d593d7f144684ebb92c.a1e64bf6d9", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.730291+00:00
-- finished_at: 2026-02-25T14:15:38.534994+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop__customers_customer_id.b4343d8610
-- query_id: 01c2a677-0002-e95b-0003-1f32000c403e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from RAW.jaffle_shop_xf.stg_jaffle_shop__customers
where customer_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop__customers_customer_id.b4343d8610", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.964921+00:00
-- finished_at: 2026-02-25T14:15:38.536137+00:00
-- elapsed: 1.6s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop__orders_order_id.7f899b6afe
-- query_id: 01c2a677-0002-e95b-0003-1f32000c4042
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_id as unique_field,
    count(*) as n_records

from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
where order_id is not null
group by order_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop__orders_order_id.7f899b6afe", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.981284+00:00
-- finished_at: 2026-02-25T14:15:38.536133+00:00
-- elapsed: 1.6s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.accepted_values_stg_jaffle_sho_8d0cd9c77228920edeb7f4a53788bf13.5bb3a17682
-- query_id: 01c2a677-0002-e95b-0003-1f32000c4046
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','returned','return_pending'
)



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.accepted_values_stg_jaffle_sho_8d0cd9c77228920edeb7f4a53788bf13.5bb3a17682", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.734832+00:00
-- finished_at: 2026-02-25T14:15:38.536154+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop__orders_order_id.aad0410d08
-- query_id: 01c2a677-0002-e95b-0003-1f32000c4036
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
where order_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop__orders_order_id.aad0410d08", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.565206+00:00
-- finished_at: 2026-02-25T14:15:38.536228+00:00
-- elapsed: 2.0s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.assert_positive_total_for_payments.e52f241542
-- query_id: 01c2a677-0002-e95b-0003-1f32000c4032
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    order_id,
    sum(amount) as total_amount
from RAW.jaffle_shop_xf.stg_stripe__payments
group by 1
having total_amount < 0
  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.assert_positive_total_for_payments.e52f241542", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:36.730444+00:00
-- finished_at: 2026-02-25T14:15:38.536288+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop__customers_customer_id.231d91af86
-- query_id: 01c2a677-0002-e95b-0003-1f32000c403a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from RAW.jaffle_shop_xf.stg_jaffle_shop__customers
where customer_id is not null
group by customer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop__customers_customer_id.231d91af86", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:38.543310+00:00
-- finished_at: 2026-02-25T14:15:39.322271+00:00
-- elapsed: 778ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.fct_orders
-- query_id: 01c2a677-0002-e95b-0003-1f32000c404a
-- desc: execute adapter call
create or replace transient  table RAW.jaffle_shop_xf.fct_orders
    
    
    
    as (with orders as  (
    select * from RAW.jaffle_shop_xf.stg_jaffle_shop__orders
),

payments as (
    select * from RAW.jaffle_shop_xf.stg_stripe__payments
),

order_payments as (
    select
        order_id,
        sum (case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

 final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.fct_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-02-25T14:15:39.331368+00:00
-- finished_at: 2026-02-25T14:15:40.083321+00:00
-- elapsed: 751ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.dim_customers
-- query_id: 01c2a677-0002-e900-0003-1f32000c209e
-- desc: execute adapter call
create or replace transient  table RAW.jaffle_shop_xf.dim_customers
    
    
    
    as (with customers as (
    select * from RAW.jaffle_shop_xf.stg_jaffle_shop__customers
),
orders as (
    select * from RAW.jaffle_shop_xf.fct_orders
),
customer_orders as (
    select
        customer_id,
        min (order_date) as first_order_date,
        max (order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by 1
),
 final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce (customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value
    from customers
    left join customer_orders using (customer_id)
)
select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.dim_customers", "profile_name": "default", "target_name": "dev"} */;
