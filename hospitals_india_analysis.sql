# Create database
create database hospitals;
use hospitals;


# Total Hospitals
select distinct count(id) as Total_hospitals from hospitals_in_india;


# Total Cities
select count(distinct city) as Total_city
from hospitals_in_india;


# Total States
select count(distinct state) as Total_states
from hospitals_in_india;


# Total Districts
select count(distinct District) as Total_districts
from hospitals_in_india;


# Top 10 Hospitals by Reviews
select id, city, state, rating, `number of reviews`
from hospitals_in_india
order by `Number of Reviews` desc
limit 10;


# Hospitals with rating 5
select id, city, state, rating from hospitals_in_india
where rating =5
order by rating desc;


# Avg Rating per state
select state, round(avg(Rating),1) as avg_rating
from hospitals_in_india
group by state;


# States with Highest Number of Hospitals
select state, count(*) as Total_hospitals
from hospitals_in_india
group by state
order by Total_hospitals desc;



# Correlation between Density and Rating
SELECT State,
       ROUND(AVG(Density),2) AS Avg_Density,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM hospitals_in_india
GROUP BY State;