--drop view view_BigDataDemography_BirthCountry

create view view_BigDataDemography_BirthCountry
As

select row_number() over(order by [BirthCountryDesc]) 'BirthCountryCode'
,[BirthCountryDesc]
  FROM [BigData].[BigData].[vw_BigDataDemography]
  group by [BirthCountryDesc]
  --having [BirthCountryDesc] is not null 
  having nullif([BirthCountryDesc],'') is not null 
  