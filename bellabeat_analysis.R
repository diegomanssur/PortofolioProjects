### Installing packages

install.packages('readr')
install.packages('tidyverse')
install.packages('data.table')
install.packages('dplyr')
install.packages('janitor')
install.packages('stringr')
install.packages('lubridate')
install.packages('ggplot2')
install.packages("ggpubr")



### Loading packages

library('readr')
library('tidyverse')
library('data.table')
library('dplyr')
library('janitor')
library('stringr')
library('lubridate')
library("ggplot2")
library("ggpubr")


### Loading datasets

daily_activity<- read_csv("/Users/diegomanssur/Desktop/CaseStudy/datasets/dailyActivity_merged.csv")
daily_sleep<- read_csv("/Users/diegomanssur/Desktop/CaseStudy/datasets/sleepDay_merged.csv")
hourly_intensities<- read_csv("/Users/diegomanssur/Desktop/CaseStudy/datasets/hourlyIntensities_merged.csv")

#### Examining Datasets

### Viewing full dataset

View(daily_activity)
View(daily_sleep)
View(hourly_intensities)

### Checking first 10 rows of datasets

head(daily_activity, n=10)
head(daily_sleep, n=10)
head(hourly_intensities, n=10)

### Checking column names of datasets

colnames(daily_activity)
colnames(daily_sleep)
colnames(hourly_intensities)

### Checking structure of datasets

str(daily_activity)
str(daily_sleep)
str(hourly_intensities)

### Changing column names to lower case

names(daily_activity)<-tolower(names(daily_activity))
daily_activity

names(daily_sleep)<-tolower(names(daily_sleep))
daily_sleep

names(hourly_intensities)<-tolower(names(hourly_intensities))
daily_sleep

### Renaming sleepday to activitydate in the daily_sleep dataset

daily_sleep<-daily_sleep %>%
  rename(activitydate=sleepday)

### Converting activitydate data to date format

daily_activity$activitydate = as.POSIXct(daily_activity$activitydate, format = '%m/%d/%Y', tz=Sys.timezone())
View(daily_activity)

daily_sleep$activitydate = as.POSIXct(daily_sleep$activitydate, format = '%m/%d/%Y %I:%M:%S %p', tz=Sys.timezone())
View(daily_sleep)

hourly_intensities$activityhour = as.POSIXct(hourly_intensities$activityhour, format = '%m/%d/%Y %I:%M:%S %p', tz=Sys.timezone())
hourly_intensities$activitytime<- format(hourly_intensities$activityhour, format = "%H:%M:%S", tz=Sys.timezone())
hourly_intensities$activityhour<- format(hourly_intensities$activityhour, format = '%m/%d/%Y', tz=Sys.timezone())
hourly_intensities$activityhour = as.POSIXct(hourly_intensities$activityhour, format = '%m/%d/%Y', tz=Sys.timezone())

hourly_intensities<-hourly_intensities %>%
  rename(activitydate=activityhour)

### Merging daily_activity and daily_sleep

daily_activity_sleep <- merge(daily_activity, daily_sleep, by =c('id','activitydate'))
View(daily_activity_sleep)


### Summarizing data

summary(daily_activity_sleep)
summary(hourly_intensities)

users<-daily_activity_sleep %>%
  group_by(id)%>%
  summarize(totalsteps = sum(totalsteps), totalveryactiveminutes = sum(veryactiveminutes), totalminutesasleep = sum(totalminutesasleep), totaldistance = sum(totaldistance), totaltimeinbed = sum(totaltimeinbed))
View(users)

max(daily_activity_sleep$activitydate)
min(daily_activity_sleep$activitydate)

max(hourly_intensities$activitydate)
min(hourly_intensities$activitydate)

### Summarizing Total Steps and Total Minutes Asleep per Weekday

daily_activity_sleep<- daily_activity_sleep %>%
  mutate(weekday=weekdays(activitydate))

daily_activity_sleep$weekday<-ordered(daily_activity_sleep$weekday, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
weekdays_steps_sleep$weekday<-ordered(weekdays_steps_sleep$weekday, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))


weekdays_steps_sleep<-daily_activity_sleep %>%
  group_by(weekday)%>%
  summarize(totalsteps = sum(totalsteps), totalminutesasleep = sum(totalminutesasleep), totaldistance = sum(totaldistance), totalveryactiveminutes = sum(veryactiveminutes), totalcalories = sum(calories))
View(weekdays_steps_sleep)

### Visualizing Data: Relationship between Total Steps and Calories

ggplot(daily_activity_sleep, aes(x=totalsteps, y=calories))+
  geom_point(color = "blue")+
  geom_smooth(method="loess", se=F, color ="orange")+
  labs(title = "Total Steps vs Calories",
       y = "Calories",
       x = "Total Steps",
       caption = "Source: FitBit")

### Visualizing Data: Relationship between Calories and Total Minutes Asleep

ggplot(daily_activity_sleep, aes(x=totalminutesasleep, y=calories))+  
geom_point(color = "blue")+
  geom_smooth(method="loess", se=F, color ="orange")+
  labs(title = "Total Calories vs Total Minutes Asleep",
       y = "Calories",
       x = "Total Minutes Asleep",
       caption = "Source: FitBit")
  coord_cartesian(xlim = c(401382,596875))
  

### Visualizing Days with the most amount of sleep
  
ggplot(weekdays_steps_sleep, aes(x=weekday,y=totalminutesasleep))+
  geom_col (fill = "#4646D1")+
  labs(title = "Total Minutes Asleep per Weekday", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))+
  coord_cartesian(ylim = c(19685,28689))

  
### Visualizing Most Active Days of the Week by Steps

weekdays_vs_steps<-ggplot(weekdays_steps_sleep, aes(x=weekday,y=totalsteps))+
  geom_col (fill = "#4646D1")+
  labs(title = "Most Active Days per Steps", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  coord_cartesian(ylim = c(401382,596875))

### Visualizing Most Active Days of the Week per Very Active Minutes

weekdays_vs_minutes<-ggplot(weekdays_steps_sleep, aes(x=weekday,y=totalveryactiveminutes))+
  geom_col (fill = "#4646D1")+
  labs(title = "Most Active Days per Very Active Minutes", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  coord_cartesian(ylim = c(1206,1990))

### Visualizing Most Active Days of the Week per Distance

weekdays_vs_distance<-ggplot(weekdays_steps_sleep, aes(x=weekday,y=totaldistance))+
  geom_col (fill = "#4646D1")+
  labs(title = "Most Active Days per Distance", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))+
  coord_cartesian(ylim = c(285.16,417.95))

### Visualizing Most Active Days of the Week per Calories

weekdays_vs_calories<-ggplot(weekdays_steps_sleep, aes(x=weekday,y=totalcalories))+
  geom_col (fill = "#4646D1")+
  labs(title = "Most Active Days per Calories", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))+
  coord_cartesian(ylim = c(115876,162253))


### Visualizing four charts

ggarrange(weekdays_vs_steps, weekdays_vs_minutes, weekdays_vs_distance, weekdays_vs_calories, 
          ncol = 2, nrow = 2)


### Visualizing Most Active Hours of the Week by Intensities

ggplot(hourly_intensities, aes(x=activitytime,y=totalintensity))+
  geom_col (fill = "#4646D1")+
  labs(title = "Total Intensity per Hour", x = "", y="")+
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))
