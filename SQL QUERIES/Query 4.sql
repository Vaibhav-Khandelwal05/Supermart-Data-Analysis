with diwali_campaign as( select category , 
	round(sum((
    case
    when promo_type = 'BOGOF' then `quantity_sold(after_promo)`*2
    else `quantity_sold(after_promo)`
    end
    - `quantity_sold(before_promo)`)*100 )
    /sum(`quantity_sold(before_promo)`),2) as `ISU%`
    from fact_events as fact
    join dim_products as prod on prod.product_code = fact.product_code  
    join dim_campaigns as camp on camp.campaign_id = fact.campaign_id
    where campaign_name = 'Diwali'
    group by category)

select category , `ISU%` , row_number() OVER(order by `ISU%` desc) AS rank_order
from diwali_campaign