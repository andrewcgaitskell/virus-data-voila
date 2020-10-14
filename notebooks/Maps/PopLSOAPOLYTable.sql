drop table if exists public.data_ew_lsoapolys;

select
"OBJECTID",
"LSOA11CD",
"LSOA11NM",
"MSOA11CD",
"MSOA11NM" ,
"LAD17NM",
"LAD17CD",
"RGN11CD" ,
"RGN11NM" ,
"CTRY11CD" ,
"CTRY11NM",
case when public.is_valid_float("Shape__Are") then "Shape__Are"::float else 0 end "Shape__Are",
case when public.is_valid_float("Shape__Len") then "Shape__Len"::float else 0 end "Shape__Len",
t.geometry geometryastext,
case when public.is_valid_geom(t.geometry) then  ST_GeomFromText(t."geometry") else Null end valid_geom
into public.data_ew_lsoapolys
from public.raw_ew_lsoapolys t;

ALTER TABLE public.data_ew_lsoapolys
    OWNER to pythonuser;