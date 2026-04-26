use yellow_taxi_feb_2024;


--  preferable payment type
select payment_type,count(*)  as most_used_payments from `yellow_tripdata_2016-03`
group by payment_type
order by most_used_payments Desc;

-- Payment type one is more preferable for customers and 2nd is a moderate outlier but 3rd payment method is rarely used

-- avg fare amount
select round(avg(fare_amount),2) as  avg_fare_amount from `yellow_tripdata_2016-03`;
-- 12.66 is avg fair 

-- sum of total_amount(revenue)
select round(sum(total_amount),2) as  total_revenue from `yellow_tripdata_2016-03`;
-- 13718.65 

-- avg trip distance
select  round(sum(trip_distance),2) as  total_trip_distance,
	    round(avg(trip_distance),2) as  avg_trip_distance 
        from `yellow_tripdata_2016-03`;
        
-- revenue by payment type
select payment_type,
       round(sum(total_amount),2)as Total_revenue 
       from `yellow_tripdata_2016-03`
group by payment_type
order by Total_revenue Desc;    
        
-- finding short,medium and long distance covered trips
select  case
        when trip_distance<2 then 'short'
		when trip_distance between 2 and 5 then 'medium'
        else 'long'
        end as'trip_category',
        count(*)  as total_trips
        from `yellow_tripdata_2016-03`
group by trip_category
order by total_trips Desc;    

-- most trips in day vs night
select  case
         when hour(tpep_pickup_datetime) between 7 and 12  then 'Morning'
		 when hour(tpep_pickup_datetime) between 13 and 17 then 'afternoon'
		 when hour(tpep_pickup_datetime)between 18 and 22 then 'evening'
		 else 'midnight'
         end as 'dayornight',
         count(*) as day_night_trips
         from `yellow_tripdata_2016-03`
group by  dayornight
order by  day_night_trips Desc;
         
-- Which payment type generates the highest average revenue per trip?         
SELECT payment_type, 
       ROUND(AVG(total_amount),2) AS avg_revenue 
FROM `yellow_tripdata_2016-03`
GROUP BY payment_type
ORDER BY avg_revenue DESC
LIMIT 1;

-- Which payment type has the highest total tips?
select payment_type,
       round(sum(tip_amount),2) as total_tip_amount
       from `yellow_tripdata_2016-03`
group by payment_type
order by total_tip_amount desc;


-- Which payment type has the highest average tip per trip?
select payment_type,
       avg(tip_amount) as avg_tip_amount 
       from `yellow_tripdata_2016-03`
group by payment_type
order by avg_tip_amount desc;

