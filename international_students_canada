#Viewing Data

SELECT * 
FROM international_students_canada
;

# Deleting hearders from data

DELETE FROM `international_students_canada`
WHERE `Country Of Citizenship` = 'Country of Citizenship'
;

# Number of Countries that contribute with international students

SELECT COUNT(`Country of Citizenship`) AS number_of_countries
FROM  (SELECT `Country of Citizenship`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students
      FROM international_students_canada
      GROUP BY `Country of Citizenship`) AS countries
WHERE total_international_students >0
;

# Total number of international students between 2015 and 2023

SELECT SUM(`total_international_students`) AS number_of_students
FROM  (SELECT `Country of Citizenship`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students
      FROM international_students_canada
      GROUP BY `Country of Citizenship`) AS countries
;

# Top 5 Countries that have contributed with more international students between 2015 and 2023

SELECT `Country of Citizenship`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students
FROM international_students_canada
GROUP BY `Country of Citizenship`
ORDER BY total_international_students DESC
LIMIT 5
;


# Top 5 Countries that have contributed with less international students between 2015 and 2023

SELECT `Country of Citizenship`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students
FROM international_students_canada
GROUP BY `Country of Citizenship`
HAVING total_international_students >0
ORDER BY total_international_students ASC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2015

SELECT `Country of Citizenship`, `2015`
FROM international_students_canada
ORDER BY `2015` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2016

SELECT `Country of Citizenship`, `2016`
FROM international_students_canada
ORDER BY `2016` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2017

SELECT `Country of Citizenship`, `2017`
FROM international_students_canada
ORDER BY `2017` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2018

SELECT `Country of Citizenship`, `2018`
FROM international_students_canada
ORDER BY `2018` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2019

SELECT `Country of Citizenship`, `2019`
FROM international_students_canada
ORDER BY `2019` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2020

SELECT `Country of Citizenship`, `2020`
FROM international_students_canada
ORDER BY `2020` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2021

SELECT `Country of Citizenship`, `2021`
FROM international_students_canada
ORDER BY `2021` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2022

SELECT `Country of Citizenship`, `2022`
FROM international_students_canada
ORDER BY `2022` DESC
LIMIT 5
;

# Top 5 Countries that contribute with more international students in 2023

SELECT `Country of Citizenship`, `2023`
FROM international_students_canada
ORDER BY `2023` DESC
LIMIT 5
;

# Total number of International Students per year

SELECT SUM(`2015`) AS total_2015, 
SUM(`2016`) AS total_2016, 
SUM(`2017`) AS total_2017, 
SUM(`2018`) AS total_2018, 
SUM(`2019`) AS total_2019, 
SUM(`2020`) AS total_2020,
SUM(`2021`) AS total_2021,
SUM(`2022`) AS total_2022,
SUM(`2023`) AS total_2023
FROM international_students_canada
;

# Average number of International students between 2015 and 2023

SELECT ROUND((`total_2015`+`total_2016`+`total_2017`+`total_2018`+`total_2019`+`total_2020`+`total_2021`+`total_2022`+`total_2023`)/9,2) AS average_number_of_international_students
FROM (
      SELECT SUM(`2015`) AS total_2015, 
      SUM(`2016`) AS total_2016, 
      SUM(`2017`) AS total_2017, 
      SUM(`2018`) AS total_2018, 
      SUM(`2019`) AS total_2019, 
      SUM(`2020`) AS total_2020,
      SUM(`2021`) AS total_2021,
      SUM(`2022`) AS total_2022,
      SUM(`2023`) AS total_2023
      FROM international_students_canada) AS total_years
;


# Creating Pivot Table

CREATE TABLE pivot_total_students_years AS
       SELECT '2015' AS Year, SUM(`2015`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2016' AS Year, SUM(`2016`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2017' AS Year, SUM(`2017`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2018' AS Year, SUM(`2018`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2019' AS Year, SUM(`2019`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2020' AS Year, SUM(`2020`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2021' AS Year, SUM(`2021`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2022' AS Year, SUM(`2022`) AS total_students
FROM international_students_canada
UNION ALL
       SELECT '2023' AS Year, SUM(`2023`) AS total_students
FROM international_students_canada
;

# Average growth of international students per year

SELECT year, 
       total_students,
       total_students - LAG(total_students) OVER(ORDER BY year ASC) AS students_growth,
       ROUND((total_students-LAG(total_students) OVER(ORDER BY year ASC))/LAG(total_students) OVER(ORDER BY year ASC)*100,2) AS international_students_growth
FROM pivot_total_students_years
;


# Delete headers from data

SELECT *
FROM international_students_province
;

DELETE FROM `international_students_province`
WHERE `Province/territory` = 'Province/territory'
;

# International students distribution between 2015 and 2023

SELECT `Province/territory`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students_province
      FROM international_students_province
      WHERE `Province/territory` <> 'Province/territory not stated Total'
      GROUP BY `Province/territory`
      ORDER BY total_international_students_province DESC
; 

# Top 5 provinces with most international students between 2015 and 2023

SELECT `Province/territory`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students_province
      FROM international_students_province
      GROUP BY `Province/territory`
      ORDER BY total_international_students_province DESC
      LIMIT 5
;
      
# Top 5 provinces with least international students between 2015 and 2023

SELECT `Province/territory`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students_province
      FROM international_students_province
      GROUP BY `Province/territory`
      ORDER BY total_international_students_province ASC
      LIMIT 5
;

# Gender segmentation of provinces with international students between 2015 and 2023


SELECT `Province/territory`, `Sex`, SUM(`2015`+`2016`+`2017`+`2018`+`2019`+`2020`+`2021`+`2022`+`2023`) AS total_international_students_province
FROM international_students_province
WHERE `Province/territory` <> 'Province/territory not stated Total' AND `Sex` <> 'Gender not stated'
GROUP BY `Province/territory`, `Sex`
HAVING total_international_students_province >0
ORDER BY total_international_students_province DESC, `Sex`, `Province/territory`
;

