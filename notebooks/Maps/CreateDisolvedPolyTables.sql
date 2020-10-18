drop table if exists public.poly_lsoa;
drop table if exists public.poly_msoa;
drop table if exists public.poly_lad;
drop table if exists public.poly_rgn;
drop table if exists public.poly_ctry;


SELECT l."LSOA11CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry into public.poly_lsoa
	FROM public.data_ew_lsoapolys l
	group by l."LSOA11CD";

SELECT l."MSOA11CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry  into public.poly_msoa
	FROM public.data_ew_lsoapolys l
	group by l."MSOA11CD";

SELECT l."LAD17CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry into public.poly_lad
	FROM public.data_ew_lsoapolys l
	group by l."LAD17CD";

SELECT l."RGN11CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry into public.poly_rgn
	FROM public.data_ew_lsoapolys l
	group by l."RGN11CD";

SELECT l."CTRY11CD" as code, ST_UnaryUnion(ST_Collect(l.valid_geom)) geometry into public.poly_ctry
	FROM public.data_ew_lsoapolys l
	group by l."CTRY11CD";
