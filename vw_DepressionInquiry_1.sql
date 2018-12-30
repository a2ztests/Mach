SELECT distinct [PersonId]
      ,[MotherPersonId]
      ,[QuestionnaireDate]
      ,[CodeStatus]
      ,[StatusDesc]
      ,[CodeStatusReason]
      ,[StatusReasonDesc]
      ,[MarkInGeneral]
      ,[MarkForQuestionTen]
      ,[Commnet]
  FROM [BigData].[BigData].[vw_DepressionInquiry]
  where 

[BigData].[BigData].[vw_DepressionInquiry].[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [dbo].[view_identify_k_problematic_records]
)
