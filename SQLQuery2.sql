Select * From PortfolioProjects..covid_19_india 

Select Date, [State/UnionTerritory], Cured, Deaths, Confirmed, ROUND((Deaths/NULLIF(Confirmed, 0))*100, 2) as DeathPercentage from PortfolioProjects..covid_19_india Order by [State/UnionTerritory],Date


Select Date, [State/UnionTerritory], Cured, Deaths, Confirmed, ROUND((Deaths/NULLIF(Confirmed, 0))*100, 2) as DeathPercentage from PortfolioProjects..covid_19_india Where [State/UnionTerritory] like '%Unassigned%' Order by [State/UnionTerritory],Date


Select [State/UnionTerritory], 
MAX(Deaths) as TotalDeaths,  MAx(Cured) as TotalCured 
From PortfolioProjects..covid_19_india
Where [State/UnionTerritory] not like '%unassigned%' and [State/UnionTerritory] not like '%Daman & Diu%' and [State/UnionTerritory] not like '%Cases being reassigned to states%'
Group by [State/UnionTerritory] 
order by TotalDeaths



Select [State/UnionTerritory], 
MAX(Confirmed) as TotalCasesReported,   MAx(Cured) as TotalCured, MAX(Deaths) as TotalDeaths, 
Max([Total Doses Administered]) as TotalDosesAdministrated,MAX([Total Individuals Vaccinated]) as TotalIndividualsVaccinated
From PortfolioProjects..covid_19_india dea
Join PortfolioProjects..covid_vaccine_statewise vac
	on dea.Date = vac.[Updated On]
	and dea.[State/UnionTerritory] = vac.State
Where [State/UnionTerritory] not like '%unassigned%' and [State/UnionTerritory] not like '%Daman & Diu%' and [State/UnionTerritory] not like '%Cases being reassigned to states%'
Group by [State/UnionTerritory] 
order by TotalDeaths


Select * From PortfolioProjects..covid_19_india

Select * From PortfolioProjects..covid_vaccine_statewise


Select Date,[State/UnionTerritory], Cured,Deaths, Confirmed,[Total Doses Administered],[Total Individuals Vaccinated] 
From PortfolioProjects..covid_19_india dea
Join PortfolioProjects..covid_vaccine_statewise vac
	on dea.Date = vac.[Updated On]
	and dea.[State/UnionTerritory] = vac.State
Where [State/UnionTerritory] not like '%unassigned%' and [State/UnionTerritory] not like '%Daman & Diu%' and [State/UnionTerritory] not like '%Cases being reassigned to states%'


--Creating view for visulization

Create View TotalCasesAndVaccinated as
Select [State/UnionTerritory], 
MAX(Confirmed) as TotalCasesReported,   MAx(Cured) as TotalCured, MAX(Deaths) as TotalDeaths, 
Max([Total Doses Administered]) as TotalDosesAdministrated,MAX([Total Individuals Vaccinated]) as TotalIndividualsVaccinated
From PortfolioProjects..covid_19_india dea
Join PortfolioProjects..covid_vaccine_statewise vac
	on dea.Date = vac.[Updated On]
	and dea.[State/UnionTerritory] = vac.State
Where [State/UnionTerritory] not like '%unassigned%' and [State/UnionTerritory] not like '%Daman & Diu%' and [State/UnionTerritory] not like '%Cases being reassigned to states%'
Group by [State/UnionTerritory] 
--order by TotalDeaths

Select * From TotalCasesAndVaccinated