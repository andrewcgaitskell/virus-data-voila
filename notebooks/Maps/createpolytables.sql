SELECT l."LSOA11CD", ST_Union(l.valid_geom) as geometry into public.poly_lsoa
	FROM public.data_ew_lsoapolys l
	group by l."LSOA11CD";

SELECT l."MSOA11CD", ST_Union(l.valid_geom) as geometry into public.poly_msoa
	FROM public.data_ew_lsoapolys l
	group by l."MSOA11CD";

SELECT l."LAD17CD", ST_Union(l.valid_geom) as geometry into public.poly_lad
	FROM public.data_ew_lsoapolys l
	group by l."LAD17CD";
	
SELECT l."RGN11CD", ST_Union(l.valid_geom) as geometry into public.poly_rgn
	FROM public.data_ew_lsoapolys l
	group by l."RGN11CD";

SELECT l."CTRY11CD", ST_Union(l.valid_geom) as geometry into public.poly_ctry
	FROM public.data_ew_lsoapolys l
	group by l."CTRY11CD";
