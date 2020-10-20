drop table if exists public.poly_msoa;
drop table if exists public.poly_lad;
drop table if exists public.poly_rgn;
drop table if exists public.poly_ctry;

SELECT
"MSOA11CD" as code,"LAD17CD","RGN11CD","CTRY11CD",
ST_ConcaveHull(ST_Multi(ST_Union(valid_geom)),0.5) as geometry into public.poly_msoa
FROM public.data_ew_lsoapolys l
group by "MSOA11CD","LAD17CD","RGN11CD","CTRY11CD";

SELECT
"LAD17CD" as code,"RGN11CD","CTRY11CD",
ST_ConcaveHull(ST_Multi(ST_Union(geometry)),0.5) as geometry into public.poly_lad
FROM public.poly_msoa l
group by "LAD17CD","RGN11CD","CTRY11CD";

SELECT
"RGN11CD" as code,"CTRY11CD",
ST_ConcaveHull(ST_Multi(ST_Union(geometry)),0.5) as geometry into public.poly_rgn
FROM public.poly_lad l
group by "RGN11CD","CTRY11CD";

SELECT
"CTRY11CD" as code,
ST_ConcaveHull(ST_Multi(ST_Union(geometry)),0.5) as geometry into public.poly_ctry
FROM public.poly_rgn l
group by "CTRY11CD";
