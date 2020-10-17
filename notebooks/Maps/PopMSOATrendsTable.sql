drop table if exists public."data_MSOATrends";

-- LSOA11_CD	LSOA11_NM	WeekAsText	Cases	Week

SELECT
index,
code,
name,
weekastext,
case when public.is_valid_int(cases) then cases::integer else 0 end as cases,
case when public.is_valid_int(lenvar) then lenvar::integer else 0 end as lenvar,
case when public.is_valid_int(week) then week::integer else 0 end as week
into public."data_MSOATrends"
FROM public."raw_MSOATrends";

ALTER TABLE public."data_MSOATrends"
    OWNER to pythonuser;