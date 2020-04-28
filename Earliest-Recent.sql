--View to find the earliest and recent dates
Create View vDate AS
Select		tmodel.ModelNO,
			ModelDescr,
			Max(tProblemReport.ReportDate) 'MostRecentReportDate',
			Min(tProblemReport.ReportDate) 'EarliestReportDate',
			Max(tTest.TestDate) 'MostRecentTestDate',
			Min(tTest.TestDate) 'EarliestTestDate'
From		tModel
Left Outer Join	tToy
On			tmodel.ModelNO = tToy.modelNO
Left Outer Join	tProblemReport
on			tToy.SerialNO = tProblemReport.ProblemReportSerialNO
Left Outer Join	tTest
on			tTest.ReportID = tProblemReport.ReportID
Group By tmodel.ModelNO, ModelDescr