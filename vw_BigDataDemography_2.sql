SELECT  distinct a.[PersonId]
		--,[IdEncrypt] Will not be supplied
		,a.[MotherId]
		,d.[GenderCode]
		--,convert(nvarchar,dateadd(day,-7,convert(date,convert (nvarchar(8),[BirthDate],101))),112) as Birthdate
		,[Birthdate] --Because of using mom age and k deltions - this field will not be shifted
         
		 --,[NationalityDesc] Will not be supplied. Instead supply[NationalityCode]
		 ,f.[NationalityCode]

		--,[BirthCountryDesc] Will not be supplied. Instead supply [BirthCountryCode]
	  ,c.[BirthCountryCode]

	  --,[AddressCityDesc] Will not be supplied. Instead supply [AddressCityDesc]
      ,b.[AddressCityCode]
	  ,e.[StationCode]

  FROM [BigData].[BigData].[vw_BigDataDemography] a
  
  join 
 
 [BigData].[dbo].[view_BigDataDemography_AddressCity] b
  on isnull(a.[AddressCityDesc] Collate Hebrew_CI_AS ,-999)=isnull( b.[AddressCityDesc] Collate Hebrew_CI_AS,-999)

  join 
    [BigData].[dbo].[view_BigDataDemography_BirthCountry] c
  on isnull(a.[BirthCountryDesc] Collate Hebrew_CI_AS ,-999)=isnull( c.[BirthCountryDesc] Collate Hebrew_CI_AS,-999)

  join 
   [BigData].[dbo].[view_BigDataDemography_Gender] d
  on isnull(a.[GenderDesc] Collate Hebrew_CI_AS ,-999)=isnull( d.[GenderDesc] Collate Hebrew_CI_AS,-999)

  join 
   [BigData].[dbo].[view_BigDataDemography_Station] e
  on isnull(a.[StationName] Collate Hebrew_CI_AS ,-999)=isnull( e.[StationName] Collate Hebrew_CI_AS,-999)

  join 
   [BigData].[dbo].[view_BigDataDemography_Nationality] f
  on isnull(a.[NationalityDesc] Collate Hebrew_CI_AS ,-999)=isnull( f.[NationalityDesc] Collate Hebrew_CI_AS,-999)


where 

a.[PersonId] not in 
(
--Cutting off the records with k annonimity problem
SELECT  [PersonId] from [BigData].[dbo].[view_identify_k_problematic_records]
)