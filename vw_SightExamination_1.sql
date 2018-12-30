SELECT distinct [PersonId]
      ,[SightExaminationDate]
      ,[InformationSourceDesc]
      ,[SightExaminationTypeDesc]
      ,[ChartTypeDesc]
      ,[ExaminationDistance]
      ,[SightAcuity_LeftEye]
      ,[SightAcuity_RightEye]
      ,[Result_LeftEye]
      ,[Result_RightEye]
      ,[Findings]
      ,[Comments]
      ,[Referral]
  FROM [BigData].[BigData].[vw_SightExamination]

  where 

[BigData].[BigData].[vw_SightExamination].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
