--drop view view_BigDataDemography_Station

create view view_BigDataDemography_Station
As

select row_number() over(order by [StationName]) 'StationCode'
,[StationName]
  FROM [BigData].[BigData].[vw_BigDataDemography]
  group by [StationName]
  --having [BirthCountryDesc] is not null 
  having nullif([StationName],'') is not null 
  