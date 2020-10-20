drop table if exists public.ref_lsoa_hierarchy;

SELECT distinct
--"OA11CD",
--"OAC11CD",
--"OAC11NM",
"LSOA11CD",
--"LSOA11NM",
--"SOAC11CD",
--"SOAC11NM",
"MSOA11CD",
--"MSOA11NM",
"LAD17CD",
--"LAD17NM",
--"LACCD",
--"LACNM",
"RGN11CD",
--"RGN11NM",
"CTRY11CD"--,
--"CTRY11NM"--,
--"FID"
into public.ref_lsoa_hierarchy
FROM public.data_lsoalookup;

-- lsoa names

drop table if exists public.ref_lsoa_names;

SELECT distinct
--"OA11CD",
--"OAC11CD",
--"OAC11NM",
"LSOA11CD" as code,
"LSOA11NM" as name
--"SOAC11CD",
--"SOAC11NM",
--"MSOA11CD",
--"MSOA11NM",
--"LAD17CD",
--"LAD17NM",
--"LACCD",
--"LACNM",
--"RGN11CD",
--"RGN11NM",
--"CTRY11CD"--,
--"CTRY11NM"--,
--"FID"
into public.ref_lsoa_names
FROM public.data_lsoalookup;

-- msoa names

drop table if exists public.ref_msoa_names;

SELECT distinct code, name into public.ref_msoa_names  FROM public."data_MSOATrends";

--- better names

-- lad names

drop table if exists public.ref_lad_names;

SELECT distinct
--"OA11CD",
--"OAC11CD",
--"OAC11NM",
--"LSOA11CD",
--"LSOA11NM",
--"SOAC11CD",
--"SOAC11NM",
--"MSOA11CD" ,
--"MSOA11NM" ,
"LAD17CD" as code,
"LAD17NM" as name
--"LACCD",
--"LACNM",
--"RGN11CD",
--"RGN11NM",
--"CTRY11CD"--,
--"CTRY11NM"--,
--"FID"
into public.ref_lad_names
FROM public.data_lsoalookup;

-- rgn names

drop table if exists public.ref_rgn_names;

SELECT distinct
--"OA11CD",
--"OAC11CD",
--"OAC11NM",
--"LSOA11CD",
--"LSOA11NM",
--"SOAC11CD",
--"SOAC11NM",
--"MSOA11CD" ,
--"MSOA11NM" ,
--"LAD17CD" ,
--"LAD17NM" ,
--"LACCD" ,
--"LACNM" ,
"RGN11CD" as code,
"RGN11NM" as name
--"CTRY11CD",
--"CTRY11NM",
--"FID"
into public.ref_rgn_names
FROM public.data_lsoalookup;

-- ctry names

drop table if exists public.ref_ctry_names;

SELECT distinct
--"OA11CD",
--"OAC11CD",
--"OAC11NM",
--"LSOA11CD",
--"LSOA11NM",
--"SOAC11CD",
--"SOAC11NM",
--"MSOA11CD" ,
--"MSOA11NM" ,
--"LAD17CD" ,
--"LAD17NM" ,
--"LACCD" ,
--"LACNM" ,
--"RGN11CD",
--"RGN11NM",
"CTRY11CD" as code,
"CTRY11NM" as name
--"FID"
into public.ref_ctry_names
FROM public.data_lsoalookup;