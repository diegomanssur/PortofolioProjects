# World Life Expectancy (Exploratory Data)

# Analysing Life Expectancy

SELECT *
FROM world_life_expectancy_001
;

# Analysing Life Expectancy - Min, Max and Increase in the past 15 Years

SELECT Country, 
MIN(Lifeexpectancy), 
MAX(Lifeexpectancy),
ROUND(MAX(Lifeexpectancy) - MIN(Lifeexpectancy),1) AS Life_Increase_15_Years
FROM world_life_expectancy_001
GROUP BY Country
HAVING MIN(Lifeexpectancy) <> 0
AND MAX(Lifeexpectancy) <> 0
ORDER BY Life_Increase_15_Years DESC
;

# Average Life Expectancy per year

SELECT Year, ROUND(AVG(Lifeexpectancy),2) 
FROM world_life_expectancy_001
WHERE Lifeexpectancy <> 0
GROUP BY Year
ORDER BY Year
;

# Correlation Between Life Expectancy and GDP

SELECT Country, ROUND(AVG(Lifeexpectancy),2) AS Life_Exp, ROUND(AVG(GDP),2) AS GDP
FROM world_life_expectancy_001
GROUP BY Country
HAVING Life_Exp <> 0
AND GDP <> 0
ORDER BY GDP DESC
;


SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN Lifeexpectancy ELSE NULL END) High_GDP_Count_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN Lifeexpectancy ELSE NULL END) Low_GDP_Count_Life_Expectancy
FROM world_life_expectancy_001
;

# Correlation Between Life Expectancy and Status

SELECT Status, ROUND(AVG(Lifeexpectancy),1)
FROM world_life_expectancy_001
GROUP BY Status
;

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(Lifeexpectancy),1)
FROM world_life_expectancy_001
GROUP BY Status
;

# Correlation Between Life Expectancy and BMI

SELECT Country, ROUND(AVG(Lifeexpectancy),2) AS Life_Exp, ROUND(AVG(BMI),2) AS BMI
FROM world_life_expectancy_001
GROUP BY Country
HAVING Life_Exp <> 0
AND BMI <> 0
ORDER BY BMI ASC
;

# Adult Mortality

SELECT Country,
Year,
Lifeexpectancy,
AdultMortality,
SUM(AdultMortality)OVER (PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy_001
;


