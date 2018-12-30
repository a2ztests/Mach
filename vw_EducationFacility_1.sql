SELECT  distinct
  [PersonId]
      ,[PersonName]
      ,[EducationFacilityTypeDesc]
      ,[PersonAge]
      ,[StartDate]
      --,[Comments]
  FROM [BigData].[BigData].[vw_EducationFacility]

where 

[BigData].[BigData].[vw_EducationFacility].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [dbo].[view_identify_k_problematic_records]
)
