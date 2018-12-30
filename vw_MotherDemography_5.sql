--Remember if needed to cut off the records with k annonimity problem
SELECT  i_src.[MotherId]
	  --,convert(nvarchar,dateadd(day,-7,convert(date,convert (nvarchar(8),[BirthDate],101))),112) as Birthdate
,m_src.BirthDate --Will be delivered to the resort but not to server 32
,case 
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 0 and 20 then '-21'

/*
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 0 and 5 then '0-5'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 6 and 10 then '6-10'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 11 and 15 then '11-15'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 16 and 20 then '16-20'
*/
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 21 and 25 then '21-25'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 26 and 30 then '26-30'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 31 and 35 then '31-35'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 36 and 40 then '36-40'
/*
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 41 and 45 then '41-45'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 46 and 50 then '46-50'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 51 and 55 then '51-55'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 56 and 60 then '56-60'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6))
between 61 and 65 then '61-65'
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6)) >65 then '+65'
*/
when cast(datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) as nvarchar(6)) >40 then '+41'

end as mom_age_on_delivery
	  
     -- ,a.[CountryDesc]
	  ,b.CountryCode
      ,[ShntAlia]
      ,c.[NationCode]
      ,[NationDetails]
      ,[EmploymentStatusDesc]
      ,[Profession]
      ,[EducationLevelDesc]
      ,[EducationLevelDetails]
      ,[MaritalStatusDesc]
      ,[MaritalStatusDetails]
      ,[IsRelation]
      ,[RelationDetails]
	  /*  13.11.2018 - Amir took off becuase it is not in the design
	  ,case when charindex('שנות לימוד',[Comment])>0
	  then 
	  replace(substring([Comment] , charindex('שנות לימוד:',[Comment]),len('שנות לימוד:')+1+2),'שנות לימוד:','')
	  ELSE '' end as 'שנות לימוד'
	  
  FROM [BigData].[BigData].[vw_MotherDemography] a
  left join 
  [BigData].[mng].[MotherDemography_Country] b
  on isnull(a.CountryDesc Collate Hebrew_CI_AS ,-999)=isnull( b.CountryDesc Collate Hebrew_CI_AS,-999)
  */
  
  FROM [BigData].[BigData].[vw_BigDataDemography] i_src
  join [BigData].[BigData].[vw_MotherDemography] m_src on i_src.MotherId = m_src.MotherId
  --and m_src.BirthDate is not null
  and datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate) is not null
  --and year(i_src.BirthDate) between 2012 and 2017

   join 
   [dbo].[view_motherDemography_country] b
  on isnull(m_src.CountryDesc Collate Hebrew_CI_AS ,-999)=isnull( b.CountryDesc Collate Hebrew_CI_AS,-999)

   join 
   [dbo].[view_motherDemography_nation] c
  on isnull(m_src.NationDesc Collate Hebrew_CI_AS ,-999)=isnull( c.NationDesc Collate Hebrew_CI_AS,-999)

---In this query we have to write in  the where part on i_src.[PersonId] & not  m_src.[PersonId] 
  where 

--m_src.[PersonId] not in
i_src.[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)
