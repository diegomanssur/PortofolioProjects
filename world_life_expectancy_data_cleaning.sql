# World Life Expectancy (Data Cleaning)

# Viewing Data

SELECT *
FROM world_life_expectancy_001
;

# Identifying Duplicates

SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM world_life_expectancy_001
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) >1
;

SELECT *
FROM (
     SELECT Row_ID, 
     CONCAT(Country, Year),
     ROW_NUMBER () OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
     FROM world_life_expectancy_001
     ) AS Row_table
WHERE Row_Num > 1
;

# Deleting duplicates

DELETE FROM world_life_expectancy_001
WHERE Row_ID IN (
      SELECT Row_ID
FROM (
     SELECT Row_ID, 
     CONCAT(Country, Year),
     ROW_NUMBER () OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
     FROM world_life_expectancy_001
     ) AS Row_table
WHERE Row_Num > 1
)
;

# Checking Blanks or Nulls

SELECT *
FROM world_life_expectancy_001
WHERE Status = ''
;

SELECT DISTINCT(Status)
FROM world_life_expectancy_001
WHERE Status <> ''
;

# Populating Blank Spaces

SELECT DISTINCT (Country)
FROM world_life_expectancy_001
WHERE Status = 'Developing'
;
 
UPDATE world_life_expectancy_001 t1
JOIN world_life_expectancy_001 t2
     ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'
;


SELECT DISTINCT (Country)
FROM world_life_expectancy_001
WHERE Status = 'Developed'
;

UPDATE world_life_expectancy_001 t1
JOIN world_life_expectancy_001 t2
     ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed'
;

# Joining tables to populate with Average Life Expectancy

SELECT *
FROM world_life_expectancy_001
WHERE Lifeexpectancy = ''
;

SELECT Country, Year, Lifeexpectancy
FROM world_life_expectancy_001
WHERE Lifeexpectancy = ''
;

SELECT t1.Country, t1.Year, t1.Lifeexpectancy, 
t2.Country, t2.Year, t2.Lifeexpectancy,
t3.Country, t3.Year, t3.Lifeexpectancy,
(ROUND((t2.Lifeexpectancy + t3.Lifeexpectancy)/2,1))AS Average
FROM world_life_expectancy_001 t1
JOIN world_life_expectancy_001 t2
     ON t1.Country = t2.Country
     AND t1.Year = t2.Year - 1
JOIN world_life_expectancy_001 t3
     ON t1.Country = t3.Country
     AND t1.Year = t3.Year + 1
WHERE t1.Lifeexpectancy = ''
;


UPDATE world_life_expectancy_001 t1
JOIN world_life_expectancy_001 t2
     ON t1.Country = t2.Country
     AND t1.Year = t2.Year - 1
JOIN world_life_expectancy_001 t3
     ON t1.Country = t3.Country
     AND t1.Year = t3.Year + 1
SET t1.Lifeexpectancy = ROUND((t2.Lifeexpectancy + t3.Lifeexpectancy)/2,1)
WHERE t1.Lifeexpectancy = ''
;



