drop table if exists public."data_LSOATrends";

-- LSOA11_CD	LSOA11_NM	WeekAsText	Cases	Week

SELECT
index,
"LSOA11_CD",
"LSOA11_NM",
WeekAsText,
case when public.is_valid_int("Cases") then "Cases"::integer else 0 end "Cases",
case when public.is_valid_int("Week") then "Cases"::integer else 0 end "Week"
into public."data_LSOATrends"
FROM public."raw_LSOATrends";

ALTER TABLE public."data_LSOATrends"
    OWNER to pythonuser;