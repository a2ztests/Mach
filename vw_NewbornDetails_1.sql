SELECT distinct [PersonId]
      ,[PregnancyWeek]
      ,[BirthWeight]
      ,[ApgarOneMinute]
      ,[ApgarFiveMinutes]
      ,[BirthOrder]
      ,[NumNewBornsInBirth]
      ,[HeadCircumference]
      ,[HospitalLeaveDate]
      ,[LeaveHospitalWeight]
      ,[Length]
      ,[BirthType]
      ,[G6PDStatus]
      ,[HearingScreening]
      ,[NewbornPosition]
      ,[RedReflexDesc]
  FROM [BigData].[BigData].[vw_NewbornDetails]

  where 

[BigData].[BigData].[vw_NewbornDetails].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
