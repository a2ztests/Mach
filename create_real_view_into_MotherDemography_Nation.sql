--drop view view_motherDemography_nation;

create view view_motherDemography_nation
As

select row_number() over(order by [NationDesc]) 'NationCode'
,[NationDesc]
  FROM [BigData].[BigData].[vw_MotherDemography]
  group by [NationDesc]
  --having [NationDesc] is not null 
  having nullif([NationDesc],'') is not null 
  