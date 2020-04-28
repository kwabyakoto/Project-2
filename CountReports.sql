-- Query 6
-- View to Count Reports
Create View	vReportCount As
Select		tmodel.ModelNO,
			modeldescr,
			tproblemreport.ProblemReportSerialNO,
			count(tToy.SerialNO) 'CountofReports'
From		tModel

Inner Join	tToy
On			tmodel.ModelNO = tToy.ModelNO
Left Outer Join tProblemReport 
On			tToy.serialNO = tProblemReport.ProblemReportSerialNO
Group By	tmodel.ModelNO, ModelDescr, tproblemreport.ProblemReportSerialNO, tProblemReport.ReportDate