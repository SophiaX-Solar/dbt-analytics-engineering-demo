
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from RAW.jaffle_shop_xf.stg_jaffle_shop__customers
where customer_id is null



  
  
      
    ) dbt_internal_test