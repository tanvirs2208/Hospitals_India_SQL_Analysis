# Hospitals_India_SQL_Analysis

# 🏥 Hospitals in India - SQL Data Analysis

## 📊 Project Overview
This project analyzes an anonymized dataset of **2,566 hospital records across India** using SQL.  
The dataset provides insights into hospital ratings, reviews, geographical distribution, and density-based analysis.  

The main objective is to derive meaningful healthcare insights and identify patterns across different states.

---

## 📂 Dataset
- **File**: Indian_hospitals_dataset.csv  
- **Total Rows**: 2,566  
- **Unique Hospitals**: 2,557  
- **Coverage**: 250 Cities, 25 States, 204 Districts  

### Columns:
- `ID` – Unique hospital identifier  
- `City` – City name  
- `State` – State name  
- `District` – District name  
- `Rating` – Hospital rating (1–5 scale)  
- `Number of Reviews` – Total reviews received  
- `Density` – Population density of the region  

---

## 🔍 SQL Analysis Performed
1. **Dataset Overview**
   - Total hospitals, cities, states, and districts  
2. **Hospital Performance**
   - Top 10 hospitals by reviews  
   - Hospitals with perfect 5⭐ ratings  
3. **State-Level Analysis**
   - Average hospital rating per state  
   - States with the highest number of hospitals  
4. **Correlation Analysis**
   - Relationship between population density and hospital ratings  

---

## 📈 Key Insights
- ✅ The dataset covers **25 states, 250 cities, and 204 districts**.  
- ⭐ A number of hospitals have achieved a **perfect 5-star rating**, reflecting strong patient satisfaction.  
- 🏙️ **Maharashtra (521), Karnataka (327), and Telangana (323)** have the **highest number of hospitals** in the dataset.  
- 📊 States with the **highest average ratings** are:  
  - Pondicherry (**4.6**)  
  - Assam (**4.5**)  
  - Chandigarh (**4.3**)  
- 🔄 **Population density does not directly correlate with ratings** – some densely populated states still have lower satisfaction scores.  

---

## 🛠️ Tools & Technologies
- **SQL (MySQL)** – for data querying & insights  
- **CSV Dataset** – raw hospital data  

---

## 🔑 SQL Queries Used

```sql
-- Create Database
create database hospitals;
use hospitals;

-- Total Hospitals
select distinct count(id) as Total_hospitals from hospitals_in_india;

-- Total Cities
select count(distinct city) as Total_city
from hospitals_in_india;

-- Total States
select count(distinct state) as Total_states
from hospitals_in_india;

-- Total Districts
select count(distinct District) as Total_districts
from hospitals_in_india;

-- Top 10 Hospitals by Reviews
select id, city, state, rating, `number of reviews`
from hospitals_in_india
order by `Number of Reviews` desc
limit 10;

-- Hospitals with rating 5
select id, city, state, rating 
from hospitals_in_india
where rating = 5
order by rating desc;

-- Avg Rating per state
select state, round(avg(Rating),1) as avg_rating
from hospitals_in_india
group by state;

-- States with Highest Number of Hospitals
select state, count(*) as Total_hospitals
from hospitals_in_india
group by state
order by Total_hospitals desc;

-- Correlation between Density and Rating
SELECT State,
       ROUND(AVG(Density),2) AS Avg_Density,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM hospitals_in_india
GROUP BY State;
