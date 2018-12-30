SELECT distinct [PersonId]
      ,[CodeSensitivityType]
      ,[SensitivityTypeDesc]
      ,[CodeSensitivitySubType]
      ,[SensitivitySubTypeDesc]
      ,[CodeResponseType]
      ,[ResponseTypeDesc]
      ,[SymptomTypeDesc]
      ,[SymptomDetails]
      ,[Comments]
  FROM [BigData].[BigData].[vw_Sensitivities]

  where 

[BigData].[BigData].[vw_Sensitivities].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
