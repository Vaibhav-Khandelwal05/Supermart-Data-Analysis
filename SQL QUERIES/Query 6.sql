with revenue as(
select product_name , category,
	ROUND(((sum(
		(case
		 when promo_type = "25%" then base_price*0.75*`quantity_sold(after_promo)`
         when promo_type = "33%" then base_price*0.67*`quantity_sold(after_promo)`
         when promo_type = "50%" then base_price*0.50*`quantity_sold(after_promo)`
         when promo_type = "500 Cashback" then (base_price-500)*`quantity_sold(after_promo)`
         when promo_type = "BOGOF" then base_price*0.50*2*`quantity_sold(after_promo)`
         ELSE 0
         END)) - SUM((base_price*`quantity_sold(before_promo)`)))*100)/SUM(base_price*`quantity_sold(before_promo)`) , 2) AS `IR%`
        FROM fact_events AS FACT
        JOIN dim_products AS PROD ON PROD.product_code = FACT.product_code
        group by product_name, category
				)
  SELECT product_name , category, `IR%` , row_number() OVER(order by `IR%` DESC) AS "IR%_RANK" 
  FROM REVENUE
  LIMIT 5