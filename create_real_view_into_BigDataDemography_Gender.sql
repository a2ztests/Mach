--drop view view_BigDataDemography_Gender

create view view_BigDataDemography_Gender
As

select row_number() over(order by [GenderDesc]) 'GenderCode'
,[GenderDesc]
  FROM [BigData].[BigData].[vw_BigDataDemography]
  group by [GenderDesc]
  --having [BirthCountryDesc] is not null 
  having nullif([GenderDesc],'') is not null 
  