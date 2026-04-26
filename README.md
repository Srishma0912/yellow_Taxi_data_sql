**Yellow Taxi Data Analysis – SQL** 
**Overview**
End-to-end analysis of New York City Yellow Taxi trip data using SQL for data querying and Power BI for interactive dashboards. The project uncovers patterns in trip demand, fare amounts, payment behaviour, and temporal trends.

**Tools Used**

**MySQL** — data querying and business analysis
**Dataset** — NYC Yellow Taxi Trip Records (2016-03)

**SQL Analysis**
**Business Questions Answered**
**1. Most preferred payment type**
SELECT payment_type, COUNT(*) AS most_used_payments
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY most_used_payments DESC;
→ Payment type 1 is most preferred. Type 3 is rarely used — a significant outlier.
**3. Average fare amount**
SELECT ROUND(AVG(fare_amount), 2) AS avg_fare_amount
FROM yellow_tripdata;
→ Average fare: $12.66
**4. Total revenue**
SELECT ROUND(SUM(total_amount), 2) AS total_revenue
FROM yellow_tripdata;
→ Total revenue: $13,718.65
**5. Trip distance breakdown**
SELECT CASE
    WHEN trip_distance < 2 THEN 'Short'
    WHEN trip_distance BETWEEN 2 AND 5 THEN 'Medium'
    ELSE 'Long'
END AS trip_category,
COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY trip_category
ORDER BY total_trips DESC;
→ Majority of trips are short distance (under 2 miles)
**6. Day vs Night trip patterns**
sqlSELECT CASE
    WHEN HOUR(tpep_pickup_datetime) BETWEEN 7 AND 12 THEN 'Morning'
    WHEN HOUR(tpep_pickup_datetime) BETWEEN 13 AND 17 THEN 'Afternoon'
    WHEN HOUR(tpep_pickup_datetime) BETWEEN 18 AND 22 THEN 'Evening'
    ELSE 'Midnight'
END AS time_of_day,
COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY time_of_day
ORDER BY total_trips DESC;
**7. Revenue and tips by payment type**
→ Payment type 1 generates highest total revenue and tips

**Key Findings**
InsightFindingPeak trip hours13:00 and 14:00 — 61K trips eachLowest demand05:00 — only 16K tripsHighest average fare05:00 — $17.0 (airport/night rides)Lowest average fare10:00–11:00 — $11.7 (short city commutes)Busiest dayFriday — 356K tripsQuietest dayMonday — 98K tripsAverage fare (SQL)$12.66 per tripPreferred paymentType 1 (likely credit card)Most common tripShort distance (under 2 miles)

**Business Recommendations**
Maximize driver availability at 1–2 PM — peak demand of 61K trips
Target early morning shifts (5 AM) — highest average fare of $17.0 despite low volume
Friday staffing should be prioritized — nearly 4x Monday demand
Promote digital payments — type 1 generates highest revenue and tips

Files in this Repository
FileDescriptiontaxidata1.pbixPower BI dashboard fileyellow_taxi.sqlSQL queries for analysisscreenshot1.pngTrip volume by hour chartscreenshot2.pngAverage fare by hour chartscreenshot3.pngTrips by day of week chart

Author
Srishma Reddy Manne

📧 mannesrishma@gmail.com
💼 LinkedIn
🐙 GitHub


Master's student in Data Science at Hochschule für Angewandte Wissenschaften Kiel, Germany
