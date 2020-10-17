drop table if exists public.data_lsoalookup;

SELECT
case when public.is_valid_int("index") then "index"::integer else 0 end "index",
"OA11CD",
"OAC11CD",
"OAC11NM",
"LSOA11CD",
"LSOA11NM",
"SOAC11CD",
"SOAC11NM",
"MSOA11CD",
"MSOA11NM",
"LAD17CD",
"LAD17NM",
"LACCD",
"LACNM",
"RGN11CD",
"RGN11NM",
"CTRY11CD",
"CTRY11NM",
case when public.is_valid_int("FID") then "FID"::integer else 0 end "FID"
into public.data_lsoalookup
FROM public.raw_lsoalookup;

ALTER TABLE public."data_lsoalookup"
    OWNER to pythonuser;
    
    
drop table if exists public.data_msoalookup;

SELECT distinct "MSOA11CD", "MSOA11NM", "LAD17CD", "LAD17NM",
"LACCD", "LACNM", "RGN11CD", "RGN11NM", "CTRY11CD", "CTRY11NM" into public.data_msoalookup
FROM public.data_lsoalookup;

ALTER TABLE public."data_msoalookup"
    OWNER to pythonuser;
