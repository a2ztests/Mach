SELECT distinct [PersonId]
      ,[VisitDate]
      ,[Action]
  FROM [BigData].[BigData].[vw_Mgaaim]
  where 

[BigData].[BigData].[vw_Mgaaim].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
