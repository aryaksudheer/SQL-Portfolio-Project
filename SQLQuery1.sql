select * from PortfolioProjects..Sheet1
update PortfolioProjects..Sheet1
SET [Total Population (Projected 2020)] = '73,183'
WHERE [State Name] = 'Lakshadweep'

select * From PortfolioProjects..Sheet1 
Select * From PortfolioProjects..TotalCasesAndVaccinated


--Joining Two Tables
select [State/UnionTerritory],TotalCasesReported,TotalCured,TotalDeaths,TotalDosesAdministrated,TotalIndividualsVaccinated, [Total Population (Projected 2020)]
From PortfolioProjects..TotalCasesAndVaccinated
Join PortfolioProjects..Sheet1
	on  TotalCasesAndVaccinated.[State/UnionTerritory] = Sheet1.[State Name] 

--Creating a View 
Create View Total_Covid_info as
select [State/UnionTerritory],TotalCasesReported,TotalCured,TotalDeaths,TotalDosesAdministrated,TotalIndividualsVaccinated, [Total Population (Projected 2020)]
From PortfolioProjects..TotalCasesAndVaccinated
Join PortfolioProjects..Sheet1
	on  TotalCasesAndVaccinated.[State/UnionTerritory] = Sheet1.[State Name] 

Select * From Total_Covid_info