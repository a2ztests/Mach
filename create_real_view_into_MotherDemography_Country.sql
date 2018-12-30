--drop view view_motherDemography_country;

create view view_motherDemography_country
As

select row_number() over(order by [CountryDesc]) 'CountryCode'
,[CountryDesc]
  FROM [BigData].[BigData].[vw_MotherDemography]
  group by [CountryDesc]
  --having [CountryDesc] is not null 
  having nullif([CountryDesc],'') is not null 
  