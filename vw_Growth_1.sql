SELECT distinct [PersonId]
      ,[ExaminationDate]
      ,[Weight]
      ,[WHO_WeightPercentile]
      ,[Height]
      ,[WHO_HeightPercentile]
      ,[WHO_WeightHeightPercentile]
      ,[HeadCircumference]
      ,[WHO_HeadCircumferencePercentile]
      ,[WHO_BMIPercentile]
      ,[SummaryDesc]
      ,replace(replace(replace(replace([Comment],'|','/'),',','|'),char(10),''),char(13),'')[Comment]
      ,[Referral]
	  --select max(len(comment))
  FROM [BigData].[BigData].[vw_Growth]

  where 

[BigData].[BigData].[vw_Growth].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)


  