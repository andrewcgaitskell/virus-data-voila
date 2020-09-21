drop table if exists public."tbl_Countries";

select 
"SourceTable",
"CountryName","RegionName", 
concat("CountryName" ,' - ', "RegionName") as  "FilterList",
concat("CountryName",' - ', 'N/A') as "AllOWIDSelect",
concat("CountryName",' - ', 'N/A') as "CDRTrendsSelect"
into public."tbl_Countries"
from
(
SELECT distinct 'All_OWID_Data' as "SourceTable", "Country" as "CountryName" , 'N/A' as "RegionName"
FROM public."data_All_OWID_Data"
union
select distinct 'CDRTrends', t."CountryName" , t."RegionName" from public."data_CDRTrends" t
union
select distinct 'CovidTrackerGantt',"CountryName","RegionName"  from public."data_CovidTrackerGantt"
union
select distinct 'OxCGRTData',"CountryName", "RegionName" from public."data_OxCGRTData"
) f;

ALTER TABLE public."tbl_Countries"
    OWNER to pythonuser;
-- Index: ix_tbl_CovidIndexData_index
