SELECT distinct [PersonId]
      ,[VaccinationDesc]
      ,[VaccinationDate]
      ,[VacStatusDesc]
      ,[VacStatusReasonDesc]
  FROM [BigData].[BigData].[vw_VaccinationsPerPerson]

where 

[BigData].[BigData].[vw_VaccinationsPerPerson].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)