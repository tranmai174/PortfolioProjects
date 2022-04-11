/*
Covid-19 Data Exploration 
Skills used: Joins, Windows Functions, Aggregate Functions
*/


----Covid Deaths


Select *
From PortfolioProject..CovidDeaths$
where continent is not null
order by 3,4


--Select Data that we are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths$
order by 1,2


-- Looking at Total Cases vs Total Deaths

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
order by 1,2

-- Show the likelihood of dying if you contract covid in your country

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
Where location like '%states%'
order by 1,2


Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
Where location like '%Canada%'
order by 1,2


--Looking at Total Cases vs Population
--Show what percentage of population got Covid

Select location, date, population, total_cases, (total_cases/population)*100 as CasesPercentpopulation
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
order by 1,2

Select location, date, population, total_cases, (total_cases/population)*100 as CasesPercentpopulation
From PortfolioProject..CovidDeaths$
Where location like '%Canada%'
order by 1,2


--Looking at Countries with Highest Infection Rate compared to Population

Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as MaxPercentpopulationInfected
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
Group by location, population
order by 1,2


Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as MaxPercentpopulationInfected
From PortfolioProject..CovidDeaths$
--Where location like '%sweden%'
Group by location, population
order by MaxPercentpopulationInfected desc

-- Showing Countries with Highest Death Count per population: 

Select location, Max(total_deaths) as Highestdeathcount
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
Group by location
order by Highestdeathcount desc

Select location, Max(cast(Total_deaths as int)) as Highestdeathcount
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
where continent is not null
Group by location
order by Highestdeathcount desc

--LET'S BREAK THINGS DOWN BY CONTINENT
--Showing continents with the highest death count per population
Select continent, Max(cast(Total_deaths as int)) as Highestdeathcount
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
where continent is not null
Group by continent
order by Highestdeathcount desc

Select location, Max(cast(Total_deaths as int)) as Highestdeathcount
From PortfolioProject..CovidDeaths$
--Where location like '%Canada%'
where continent is null
Group by location
order by Highestdeathcount desc


--GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
--Where location like '%states%'
where continent is not null
--Group by date
order by 1,2


