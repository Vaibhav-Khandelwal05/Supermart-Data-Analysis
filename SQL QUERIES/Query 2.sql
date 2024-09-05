# Overview of the number of stores in each city.
# It will help us to identify the cities with the highest store presence.

SELECT DISTINCT(CITY) , COUNT(CITY) AS TOTAL_STORES FROM dim_stores
GROUP BY CITY
ORDER BY TOTAL_STORES DESC

# Selected the required columns for the query
# Appiled group by according to the city to get the total stores count 
# Odered the query in descending order of the total store count
