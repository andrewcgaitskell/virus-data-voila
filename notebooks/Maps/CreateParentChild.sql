drop table if exists public.ref_parentchild;

select a.* into public.ref_parentchild from
(SELECT distinct
"CTRY11CD" as parent_code,
"CTRY11NM" as parent_name,
"RGN11CD" as child_code,
"RGN11NM" as child_name,
'Country' as focus_level_name,
 1 as focus_level_number
--"LAD17CD",
--"LAD17NM",
--"MSOA11CD",
--"MSOA11NM",
--"LSOA11CD",
--"LSOA11NM"
FROM public.data_msoalookup
union
SELECT distinct
--"CTRY11CD" as parent_code,
--"CTRY11NM" as parent_name,
"RGN11CD" as parent_code,
"RGN11NM" as parent_name,
"LAD17CD" as child_code,
"LAD17NM" as child_name,
'Region' as focus_level_name,
2 as focus_level_number
--"MSOA11CD",
--"MSOA11NM",
--"LSOA11CD",
--"LSOA11NM"
FROM public.data_msoalookup
union
SELECT distinct
--"CTRY11CD" as parent_code,
--"CTRY11NM" as parent_name,
--"RGN11CD" as parent_code,
--"RGN11NM" as parent_name,
"LAD17CD" as parent_code,
"LAD17NM" as parent_name,
"MSOA11CD" as child_name,
"MSOA11NM" as child_code,
'Local Authority' as focus_level_name,
3 as focus_level_number
--"LSOA11CD",
--"LSOA11NM"
FROM public.data_msoalookup
) a
