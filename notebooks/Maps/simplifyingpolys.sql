drop table if exists public.poly_lsoa;
drop table if exists public.poly_msoa;
drop table if exists public.poly_msoa_simp;
drop table if exists public.poly_lad;
drop table if exists public.poly_lad_simp;
drop table if exists public.poly_rgn;
drop table if exists public.poly_rgn_simp;
drop table if exists public.poly_ctry;
drop table if exists public.poly_ctry_simp;


SELECT l."LSOA11CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry into public.poly_lsoa
	FROM public.data_ew_lsoapolys l
	group by l."LSOA11CD";

SELECT l."MSOA11CD" as code, ST_Union(l.valid_geom) as geometry into public.poly_msoa
	FROM public.data_ew_lsoapolys l
	group by l."MSOA11CD";

select code, ST_SimplifyPreserveTopology(geometry,0.1) as geometry into public.poly_msoa_simp
from public.poly_msoa;


SELECT l."LAD17CD" as code, ST_Union(l.valid_geom) as geometry into public.poly_lad
	FROM public.data_ew_lsoapolys l
	group by l."LAD17CD";

select code, ST_SimplifyPreserveTopology(geometry,0.1) as geometry into public.poly_lad_simp
from public.poly_lad;


SELECT l."RGN11CD" as code, ST_Union(l.valid_geom) as geometry into public.poly_rgn
	FROM public.data_ew_lsoapolys l
	group by l."RGN11CD";

select code, ST_SimplifyPreserveTopology(geometry,0.1) as geometry into public.poly_rgn_simp
from public.poly_rgn;



SELECT l."CTRY11CD" as code,  ST_UnaryUnion(ST_Collect(l.valid_geom)) as geometry into public.poly_ctry
	FROM public.data_ew_lsoapolys l
	group by l."CTRY11CD";

select code, ST_SimplifyPreserveTopology(geometry,0.1) as geometry into public.poly_ctry_simp
from public.poly_ctry;

CREATE TABLE public.poly_ctry AS 
    SELECT l."CTRY11CD" as code ,
	(ST_DUMP(l.valid_geom)).geom::geometry(Polygon,0) AS geometry
	FROM public.data_ew_lsoapolys l;
