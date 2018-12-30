--drop view view_BigDataDemography_Nationality

create view view_BigDataDemography_Nationality
As

select row_number() over(order by [NationalityDesc]) 'NationalityCode'
,[NationalityDesc]
  FROM [BigData].[BigData].[vw_BigDataDemography]
  group by [NationalityDesc]
  --having [NationalityDesc] is not null 
  having nullif([NationalityDesc],'') is not null 
  