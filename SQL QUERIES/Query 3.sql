# Displays the Total Revenue generated for each campaign before and after the promotions are applied.

SELECT CAMPAIGN_NAME , 
CONCAT(ROUND(SUM(base_price*`quantity_sold(before_promo)`)/1000000 , 2) , " Millions") AS 'TOTAL_REVENUE( BEFORE_PROMOTION )' ,
CONCAT(ROUND(SUM(
CASE
WHEN PROMO_TYPE = "25% OFF" THEN base_price*0.75*`quantity_sold(after_promo)`
WHEN PROMO_TYPE = "33% OFF" THEN base_price*0.67*`quantity_sold(after_promo)`
WHEN PROMO_TYPE = "50% OFF" THEN base_price*0.50*`quantity_sold(after_promo)`
WHEN PROMO_TYPE = "500 Cashback" THEN (base_price-500)*`quantity_sold(after_promo)`
WHEN PROMO_TYPE = "BOGOF" THEN base_price*0.5*2*(`quantity_sold(after_promo)`)
END)/1000000 , 2) , " Millions") AS 'TOTAL_REVENUE( AFTER_PROMOTION )'
FROM FACT_EVENTS AS FACT
JOIN DIM_CAMPAIGNS CAMP
ON FACT.CAMPAIGN_ID = CAMP.CAMPAIGN_ID
GROUP BY CAMPAIGN_NAME

# Used simple logic of multiplying cost of product and quantity sold for getting revenue before and after promotion
# Joined events and campaign tables to get campaign name
# Grouped the tables according to the campaign name to get the respective revenues
