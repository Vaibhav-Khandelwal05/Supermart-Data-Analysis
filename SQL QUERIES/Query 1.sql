# List of products with a Base Price greater than 500 and that are featured in promo type 'BOGOF'(Buy One Get One Free).
# This info will help us identify high-value products that are currently being heavily discounted, which can be used for evaluating pricing and promotion strategies. 

SELECT  distinct(product_name) , base_price , promo_type FROM dim_products AS PROD
RIGHT JOIN FACT_EVENTS AS FACT
ON PROD.PRODUCT_CODE = FACT.PRODUCT_CODE
WHERE FACT.BASE_PRICE > 500 AND FACT.PROMO_TYPE = "BOGOF"

# First all the necessary columns are selected to present in the table
# Then Joining of products and events table is done to retreive distinct product name
# Finally conditions are applied 
