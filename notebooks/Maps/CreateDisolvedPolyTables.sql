drop table if exists public.poly_lsoa;
drop table if exists public.poly_msoa;
drop table if exists public.poly_lad;
drop table if exists public.poly_rgn;
drop table if exists public.poly_ctry;

--select distinct "LAD17CD" from public.data_ew_lsoapolys l

SELECT l."MSOA11CD" as code,
ST_MakePolygon(ST_ExteriorRing((ST_Dump(ST_Union(valid_geom))).geom)) as geometry
into public.poly_msoa
FROM public.data_ew_lsoapolys l
group by l."MSOA11CD";

SELECT
"LAD17CD" as code,
ST_MakePolygon(ST_ExteriorRing((ST_Dump(ST_Union(valid_geom))).geom)) as geometry
into public.poly_lad
FROM public.data_ew_lsoapolys
group by "LAD17CD";

SELECT
"RGN11CD" as code,
ST_MakePolygon(ST_ExteriorRing((ST_Dump(ST_Union(valid_geom))).geom)) as geometry
into public.poly_rgn
FROM public.data_ew_lsoapolys
group by "RGN11CD";

SELECT
"CTRY11CD" as code,
ST_MakePolygon(ST_ExteriorRing((ST_Dump(ST_Union(valid_geom))).geom)) as geometry
into public.poly_ctry
FROM public.data_ew_lsoapolys
group by "CTRY11CD";
