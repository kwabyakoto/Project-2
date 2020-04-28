--View to distinguish Injury vs no Injury
Create View	vInjury As
Select		tmodel.ModelNO,
			tmodel.ModelDescr,
			tProblemReport.Injury,
			tProblemReport.InjuryDescr,
			Case
				When tProblemReport.Injury = 'Y'
				then 1
				else 0
			End As CountofInjuryReports,

			Count(tTest.ReportID) CountofTest
From tModel
Left Outer Join tToy
On				tModel.ModelNO = tToy.modelNO
Left Outer Join	tProblemReport
On				tToy.SerialNO = tProblemReport.ProblemReportSerialNO
Left Outer Join	tTest
On				tTest.ReportID = tProblemReport.ReportID
Group By		tModel.ModelNO, ModelDescr, tProblemReport.Injury, tProblemReport.InjuryDescr, tTest.ReportID