# US Household Income (Data Cleaning)

# Viewing Data
SELECT *
FROM us_household_income
;

SELECT *
FROM us_household_income_statistics
;
# Identifying Duplicates

SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id)>1
;

SELECT *
FROM (
SELECT `row id`, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_household_income) duplicate
WHERE row_num >1
;

# Deleting Duplicates

DELETE FROM us_household_income
WHERE `row id` IN (
      SELECT `row id`
      FROM (
          SELECT `row id`, 
          id,
          ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
          FROM us_household_income) duplicate
          WHERE row_num >1)
;


# Fixing typos

SELECT `State Name`, COUNT(`State Name`)
FROM us_household_income
GROUP BY `State Name`
;

SELECT DISTINCT `State Name`
FROM us_household_income
ORDER BY 1
;

UPDATE us_household_income
SET `State Name` = 'Georgia'
WHERE `State Name` = 'georia'
;

UPDATE us_household_income
SET `State Name` = 'Alabama'
WHERE `State Name` = 'alabama'
;

# Checking Empty Fields

SELECT *
FROM us_household_income
WHERE Place IS NULL
ORDER BY 1
;

SELECT *
FROM us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

# Checking typos in Type

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type
ORDER BY 1
;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

# Checking 0 values

SELECT ALand, AWater
FROM us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater IS NULL)
AND ALand = 0 OR ALand = '' OR ALand IS NULL
;




