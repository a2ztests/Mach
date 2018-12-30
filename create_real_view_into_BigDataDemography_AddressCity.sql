--drop view view_BigDataDemography_AddressCity

create view view_BigDataDemography_AddressCity
As

select row_number() over(order by [AddressCityDesc]) 'AddressCityCode'
,[AddressCityDesc]
  FROM [BigData].[BigData].[vw_BigDataDemography]
  group by [AddressCityDesc]
  --having [AddressCityDesc] is not null 
  having nullif([AddressCityDesc],'') is not null 
  