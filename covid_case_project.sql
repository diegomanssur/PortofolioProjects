SELECT *
FROM covid_deaths
WHERE continent <> ''

# Select Data we need

SELECT continent, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
order by 1, 2

# Looking at Total Cases vs Total Deaths
# Shows likelyhood of dying if you get covid in your country

SELECT continent, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100,2) AS death_percentage
FROM covid_deaths
WHERE Location = 'Canada' AND continent <> ''
ORDER BY 1,2
;

# Looking at Total Cases vs Population
# Shows what percentage of population got Covid

SELECT continent, date, total_cases,population, ROUND((total_cases/population)*100,2) AS covid_infected_percentage
FROM covid_deaths
WHERE Location = 'Canada' AND continent <> ''
ORDER BY 1,2
;

# Countries with highest infection rates compared to population

SELECT continent, Population, MAX(total_cases) AS highest_infection_count, ROUND(MAX(total_cases/population)*100,2) AS covid_infected_percentage
FROM covid_deaths
WHERE continent <> ''
GROUP BY continent, Population
ORDER BY covid_infected_percentage DESC
;

# Countries with highest deaths by Covid

SELECT continent, MAX(CAST(total_deaths AS UNSIGNED)) AS highest_death_count
FROM covid_deaths
WHERE continent <> ''
GROUP BY continent
ORDER BY highest_death_count DESC
;


# Showing the continents with highest death counts

SELECT continent, MAX(CAST(total_deaths AS UNSIGNED)) AS highest_death_count
FROM covid_deaths
WHERE continent <> ''
GROUP BY continent
ORDER BY highest_death_count DESC
;

# Breaking Global numbers

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS UNSIGNED)) AS total_deaths, ROUND(SUM(new_deaths)/SUM(new_cases)*100,2) AS death_percentage_globaly
FROM covid_deaths
WHERE continent <> ''
#GROUP BY date
ORDER BY 1,2
;

# Breaking Global numbers per day

SELECT date, SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS UNSIGNED)) AS total_deaths, ROUND(SUM(new_deaths)/SUM(new_cases)*100,2) AS death_percentage_globaly
FROM covid_deaths
WHERE continent <> ''
GROUP BY date
ORDER BY 1,2
;

# Total Population vs Vaccination

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> ''
ORDER BY 2,3
;

# USE CTE

WITH PopvsVac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> ''
)
SELECT *, ROUND((rolling_people_vaccinated/population)*100,2) AS percentage_people_vaccinated
FROM PopvsVac
;

SELECT *
FROM `percent_population_vaccinated`

