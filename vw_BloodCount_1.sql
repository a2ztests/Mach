SELECT distinct[PersonId]
      ,[BloodCountDate]
      ,[ReportingSourceTypeDesc]
      ,[HGB]
      ,[HGBValid]
      ,[MCV]
      ,[MCH]
      ,[RDW]
      ,[IsReferral]
      ,[Comments]
  FROM [BigData].[BigData].[vw_BloodCount]

where 

[BigData].[BigData].[vw_BloodCount].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
