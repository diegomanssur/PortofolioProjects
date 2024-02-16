# Viewing Data

SELECT * 
FROM sleep_lifestyle_health
;

# Average Sleep Duration Per Occupation

SELECT Occupation, 
ROUND(AVG(`Sleep Duration`),2) AS Average_Sleep_per_Occupation
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_per_Occupation DESC
;

# Average Quality of Sleep Per Occupation

SELECT Occupation, 
ROUND(AVG(`Quality of Sleep`),2) AS Average_Quality_Sleep
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Quality_Sleep DESC
;

# Average Daily Steps Per Occupation

SELECT Occupation, 
ROUND(AVG(`Daily Steps`),2) AS Average_Daily_Steps
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Daily_Steps DESC
;

# Correlation between Age and Sleep Duration

SELECT Age, 
ROUND(AVG(`Sleep Duration`),2) AS Average_Sleep_Duration
FROM sleep_lifestyle_health
GROUP BY Age
ORDER BY Age DESC
;

# Correlation between Sleep Duration and Sleep Quality

SELECT `Sleep Duration`, 
ROUND(AVG(`Quality of Sleep`),2) AS Average_Quality_of_Sleep
FROM sleep_lifestyle_health
GROUP BY `Sleep Duration`
ORDER BY `Sleep Duration` DESC
;

# Correlation between Age and Sleep Quality

SELECT Age, 
ROUND(AVG(`Quality of Sleep`),2) AS Average_Quality_of_Sleep
FROM sleep_lifestyle_health
GROUP BY Age
ORDER BY Age DESC
;

# Correlation between Quality of Sleep vs Average Number of Steps

SELECT `Quality of Sleep`,
ROUND(AVG(`Daily Steps`),2) AS Average_Daily_Steps
FROM sleep_lifestyle_health
GROUP BY `Quality of Sleep`
ORDER BY `Quality of Sleep` DESC
;

# Correlation between Quality of Sleep vs Stress Level

SELECT `Quality of Sleep`,
ROUND(AVG(`Stress Level`),2) AS Average_Stress_Level
FROM sleep_lifestyle_health
GROUP BY `Quality of Sleep`
ORDER BY `Quality of Sleep` DESC
;

# Correlation betweeen Sleep Duration and Physical Activity Level

SELECT `Sleep Duration`,
ROUND(AVG(`Physical Activity Level`),2) AS Average_Physical_Activity_Level
FROM sleep_lifestyle_health
GROUP BY `Sleep Duration`
ORDER BY `Sleep Duration` DESC
;

# Correlation betweeen Quality of Sleep and Physical Activity Level

SELECT `Quality of Sleep`,
ROUND(AVG(`Physical Activity Level`),2) AS Average_Physical_Activity_Level
FROM sleep_lifestyle_health
GROUP BY `Quality of Sleep`
ORDER BY `Quality of Sleep` DESC
;

# Correlation betweeen Daily Steps and Heart Rate

SELECT `Heart Rate`,
ROUND(AVG(`Daily Steps`),2) AS Average_Daily_Steps
FROM sleep_lifestyle_health
GROUP BY `Heart Rate`
ORDER BY `Heart Rate` DESC
;

# Correlation between BMI Category and Insomnia

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS Insomnia
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'Insomnia'
GROUP BY `BMI Category`
;

# Correlation between BMI Category and Sleep Apnea

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS Sleep_Apnea
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'Sleep Apnea'
GROUP BY `BMI Category`
;

# Correlation between BMI Category and No Sleep Disorder

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS None
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'None'
GROUP BY `BMI Category`
;



