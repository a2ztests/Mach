SELECT distinct [PersonId]
      ,[DiagnosisDate]
      ,[CodeDiagnosisLevelOne]
      ,[DiagnosisLevelOneDesc]
      ,[CodeDiagnosisLevelTwo]
      ,[DiagnosisLevelTwoDesc]
      ,[CodeDiagnosisLevelThree]
      ,[DiagnosisLevelThreeDesc]
      ,[CodeDiagnosisStatus]
      ,[DiagnosisStatusDesc]
       ,replace(replace(replace(replace([DiagnosisStatusDetails],'|','/'),',','|'),char(10),''),char(13),'')[DiagnosisStatusDetails]
	  ,replace(replace(replace(replace([Comment],'|','/'),',','|'),char(10),''),char(13),'')[Comment]
  FROM [BigData].[BigData].[vw_Diagnosis]

  where 

[BigData].[BigData].[vw_Diagnosis].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [dbo].[view_identify_k_problematic_records]
)
