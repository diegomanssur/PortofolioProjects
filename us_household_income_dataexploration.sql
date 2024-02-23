# US Household Income (Exploratory Data Analysis)

# Viewing Data

SELECT *
FROM us_project.us_household_income
;

SELECT *
FROM us_project.us_household_income_statistics
;

# Exploring Land and Water Area

SELECT `State Name`, SUM(ALand) AS Total_Land, SUM(AWater) AS Total_Water
FROM us_project.us_household_income
GROUP BY `State Name`
ORDER BY 3 DESC
;

# Top 10 States by Land Area

SELECT `State Name`, SUM(ALand) AS Total_Land, SUM(AWater) AS Total_Water
FROM us_project.us_household_income
GROUP BY `State Name`
ORDER BY 2 DESC
LIMIT 10
;

# Top 10 States by Water Area

SELECT `State Name`, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY `State Name`
ORDER BY 3 DESC
LIMIT 10
;

# Joining Tables

SELECT *
FROM us_project.us_household_income u
JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
;

SELECT *
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
;

# Exploring Mean and Median Income


# Top 10 Highest Household Mean Income

SELECT u.`State Name`,ROUND(AVG(Mean),1) AS Avg_Mean, ROUND(AVG(Median),1) Avg_Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
GROUP BY u.`State Name`
ORDER BY 2 DESC
LIMIT 10
;

# Top 10 Lowest Household Mean Income

SELECT u.`State Name`,ROUND(AVG(Mean),1) AS Avg_Mean, ROUND(AVG(Median),1) AS Avg_Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
GROUP BY u.`State Name`
ORDER BY 2 
LIMIT 10
;

# Top 10 Highest Household Median Income

SELECT u.`State Name`,ROUND(AVG(Mean),1) AS Avg_Mean, ROUND(AVG(Median),1) AS Avg_Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
GROUP BY u.`State Name`
ORDER BY 3 DESC
LIMIT 10
;

# Top 10 Lowest Household Median Income

SELECT u.`State Name`,ROUND(AVG(Mean),1) AS Avg_Mean, ROUND(AVG(Median),1) AS Avg_Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
GROUP BY u.`State Name`
ORDER BY 3 
LIMIT 10
;


# Type of Area

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) >100
ORDER BY 4 DESC
;

# Highest Household Mean Income by City

SELECT u.`State Name`, City, ROUND(AVG(Mean),1) AS Average_Mean,ROUND(AVG(Median),1) AS Average_Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
     ON  u.id = us.id
GROUP BY u.`State Name`, City
ORDER BY ROUND(AVG(Mean),1) DESC
LIMIT 10
;
