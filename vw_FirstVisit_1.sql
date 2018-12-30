SELECT distinct [PersonId]
      ,[VisitDate]
  FROM [BigData].[BigData].[vw_FirstVisit]

where 

[BigData].[BigData].[vw_FirstVisit].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
