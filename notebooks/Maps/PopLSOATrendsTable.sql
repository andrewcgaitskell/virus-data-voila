drop table if exists public."data_LSOATrends";

-- LSOA11_CD	LSOA11_NM	WeekAsText	Cases	Week

SELECT
index,
"losa11_cd",
"lsoa11_nm",
WeekAsText,
case when public.is_valid_int("cases") then "cases"::integer else 0 end "cases",
case when public.is_valid_int("week") then "cases"::integer else 0 end "week"
into public."data_LSOATrends"
FROM public."raw_LSOATrends";

ALTER TABLE public."data_LSOATrends"
    OWNER to pythonuser;