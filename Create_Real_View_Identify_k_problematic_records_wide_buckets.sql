--drop view view_identify_k_problematic_records;

create view view_identify_k_problematic_records
As
select src.PersonId
from (
SELECT 
i_src.[PersonId]
	  --,convert(nvarchar,dateadd(day,-7,convert(date,convert (nvarchar(8),[BirthDate],101))),112) as Birthdate
	  
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

end as m_src_mom_age_on_delivery

,i_src.[GenderDesc] as GenderDesc
,i_src.[BirthDate] as BirthDate

  FROM [BigData].[BigData].[vw_BigDataDemography] i_src
  join [BigData].[BigData].[vw_MotherDemography] m_src on i_src.MotherId = m_src.MotherId
  --and m.BirthDate is not null
  --and datediff(year, convert(datetime,m_src.BirthDate),i_src.BirthDate)>10
  --and year(i_src.BirthDate) between 2012 and 2017
) src

join (
 --Mother's age buckets + infant b_date + infant_gender

SELECT 
case 
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 0 and 20 then '-21'

/*
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 0 and 5 then '0-5'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 6 and 10 then '6-10'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 11 and 15 then '11-15'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 16 and 20 then '16-20'
*/
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 21 and 25 then '21-25'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 26 and 30 then '26-30'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 31 and 35 then '31-35'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 36 and 40 then '36-40'
/*
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 41 and 45 then '41-45'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 46 and 50 then '46-50'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 51 and 55 then '51-55'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 56 and 60 then '56-60'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 61 and 65 then '61-65'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6)) >65 then '+65'
*/
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6)) >40 then '+41'

end as mom_age_on_delivery

,i.BirthDate
,i.GenderDesc
,count(1) as cnt

  FROM [BigData].[BigData].[vw_BigDataDemography] i
  join [BigData].[BigData].[vw_MotherDemography] m on i.MotherId = m.MotherId
  --and m.BirthDate is not null
  --and datediff(year, convert(datetime,m.BirthDate),i.BirthDate)>10
  --and year(i.BirthDate) between 2012 and 2017
  
  --group by datediff(year, convert(datetime,m.BirthDate),i.BirthDate), i.BirthDate
group by  
case 
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 0 and 20 then '-21'

/*
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 0 and 5 then '0-5'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 6 and 10 then '6-10'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 11 and 15 then '11-15'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 16 and 20 then '16-20'
*/
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 21 and 25 then '21-25'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 26 and 30 then '26-30'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 31 and 35 then '31-35'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 36 and 40 then '36-40'
/*
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 41 and 45 then '41-45'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 46 and 50 then '46-50'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 51 and 55 then '51-55'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 56 and 60 then '56-60'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6))
between 61 and 65 then '61-65'
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6)) >65 then '+65'
*/
when cast(datediff(year, convert(datetime,m.BirthDate),i.BirthDate) as nvarchar(6)) >40 then '+41'


end 
,i.GenderDesc  
,i.BirthDate
  having count(1)<3
  --order by count(1), mom_age_on_delivery,i.GenderDesc asc
)  k_an

on src.m_src_mom_age_on_delivery = k_an.mom_age_on_delivery
and src.GenderDesc = k_an.GenderDesc
and src.BirthDate = k_an.BirthDate
