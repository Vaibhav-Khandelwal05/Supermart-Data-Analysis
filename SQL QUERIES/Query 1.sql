SELECT  distinct(product_name) , base_price , promo_type FROM dim_products AS PROD
RIGHT JOIN FACT_EVENTS AS FACT
ON PROD.PRODUCT_CODE = FACT.PRODUCT_CODE
WHERE FACT.BASE_PRICE > 500 AND FACT.PROMO_TYPE = "BOGOF"

# First all the necessary columns are selected to present in the table
# Then Joining of products and events table is done to retreive distinct product name
# Finally conditions are applied 