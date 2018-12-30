SELECT  distinct [PersonId]
      ,[NutritionTrackingDate]
      ,[FormulaManufacturerDesc]
      ,[FormulaTypeDesc]
      ,[NursingEndAgeMonths]
      ,[FormulaStartAgeMonths]
      ,replace(replace(replace(replace([FormulaDetails],'|','/'),',','|'),char(10),''),char(13),'')  [FormulaDetails]
      ,[FormulaReasonDesc]
      ,[IronDesc]
      ,[VitaminD3Desc]
      ,[NursingYN]
      ,[FormulaYN]
      ,[IsConsumptionAppropriteToAgeYN]
      ,[HasProblemsWithFeedingYN]
      ,replace(replace(replace(replace([ParentsQuestion],'|','/'),',','|'),char(10),''),char(13),'') [ParentsQuestion]
      ,[IsGiven_Water]
      ,[AdditionalDrinksDetails]
      ,[FamilyNutritionDesc]
      ,[IsGiven_Fruits]
      ,[IsGiven_Proteins]
      ,[IsGiven_DairyProducts]
      ,[IsGiven_Vegetables]
      ,[IsGiven_Cereals]
      ,[IsGiven_OtherFood]
      ,replace(replace(replace(replace([IsGiven_OtherFoodDetails],'|','/'),',','|'),char(10),''),char(13),'') [IsGiven_OtherFoodDetails]
      ,[IsSelfFeeding]
      ,[IsGivenFromFamilyMeal]
      ,[IsTrackingRequired]
      ,[FoodsStartAgeMonths]
      ,replace(replace(replace(replace([Comment],'|','/'),',','|'),char(10),''),char(13),'')  [Comment]
  FROM [BigData].[BigData].[vw_NutritionTracking]

where 

[BigData].[BigData].[vw_NutritionTracking].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)