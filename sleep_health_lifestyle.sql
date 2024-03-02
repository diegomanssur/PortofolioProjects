# Sleep, Health and LifeStyle (Data Exploration)

# Viewing Data

SELECT COUNT(`Person ID`)
FROM sleep_lifestyle_health
;

# Occupation Breakdown

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

# Average Stress Level Per Occupation

SELECT Occupation, 
ROUND(AVG(`Stress Level`),2) AS Average_Stress_Level
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Stress_Level DESC
;


# Correlations

# Correlation between Sleep Duration and Age per Occupation

SELECT Occupation, 
ROUND(AVG(`Sleep Duration`),2) AS Average_Sleep_Duration,
ROUND(AVG(`Age`),2) AS Average_Age
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Duration DESC
;

# Correlation between Sleep Quality and Age per Occupation

SELECT Occupation, 
ROUND(AVG(`Quality of Sleep`),2) AS Average_Sleep_Quality,
ROUND(AVG(`Age`),2) AS Average_Age
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Quality DESC
;

# Correlation between Sleep Duration and Sleep Quality per Occupation

SELECT Occupation, 
ROUND(AVG(`Quality of Sleep`),2) AS Average_Sleep_Quality,
ROUND(AVG(`Sleep Duration`),2) AS Average_Sleep_Duration
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Quality DESC
;

# Correlation between Sleep Quality and Daily Steps per Occupation

SELECT Occupation,
ROUND(AVG(`Quality of Sleep`),2) AS Average_Sleep_Quality,
ROUND(AVG(`Daily Steps`),2) AS Average_Daily_Steps
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Quality DESC
;

# Correlation between Sleep Quality and Stress Level per Occupation

SELECT Occupation,
ROUND(AVG(`Quality of Sleep`),2) AS Average_Sleep_Quality,
ROUND(AVG(`Stress Level`),2) AS Average_Stress_Level
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Quality DESC
;

# Correlation betweeen Sleep Duration and Physical Activity Level per Occupation

SELECT Occupation,
ROUND(AVG(`Sleep Duration`),2) AS Average_Sleep_Duration,
ROUND(AVG(`Physical Activity Level`),2) AS Average_Physical_Activity_Level
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Duration DESC
;

# Correlation betweeen Sleep Quality and Physical Activity Level per Occupation

SELECT Occupation,
ROUND(AVG(`Quality of Sleep`),2) AS Average_Sleep_Quality,
ROUND(AVG(`Physical Activity Level`),2) AS Average_Physical_Activity_Level
FROM sleep_lifestyle_health
GROUP BY Occupation
ORDER BY Average_Sleep_Quality DESC
;


# Sleep Disorders per BMI Category

# BMI Category and Insomnia

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS Insomnia
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'Insomnia'
GROUP BY `BMI Category`
;

# BMI Category and Sleep Apnea

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS Sleep_Apnea
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'Sleep Apnea'
GROUP BY `BMI Category`
;

# BMI Category and No Sleep Disorder

SELECT `BMI Category`, COUNT(`Sleep Disorder`) AS None
FROM sleep_lifestyle_health
WHERE `Sleep Disorder` = 'None'
GROUP BY `BMI Category`
;


# Quantity and Quality of Sleep per BMI Category

# Average Quality of Sleep per BMI Category

SELECT `BMI Category`, ROUND(AVG(`Quality of Sleep`),2) AS Avg_Quality_of_Sleep
FROM sleep_lifestyle_health
GROUP BY `BMI Category`
;

# Average Quality of Sleep per BMI Category

SELECT `BMI Category`, ROUND(AVG(`Sleep Duration`),2) AS Avg_Sleep_Duration
FROM sleep_lifestyle_health
GROUP BY `BMI Category`
;

