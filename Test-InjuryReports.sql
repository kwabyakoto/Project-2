--View To Sum tests and Injury Reports
Create View		vSumInjury As
Select			ModelNO,
				ModelDescr,
				Sum(CountofTest) CountofTest,
				Sum(CountofInjuryReports) CountofInjuryReports
From			vInjury
Group By		ModelNO, ModelDescr

--Views to Count Reports
Create View vSumReport As
Select		ModelNO,
			sum(CountofReports) CountofReports
From		vReportCount
Group By	ModelNO