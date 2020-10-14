drop table if exists public.cumsum_lsoa;
drop table if exists public.cumsum_msoa;
drop table if exists public.cumsum_lad;
drop table if exists public.cumsum_rgn;
drop table if exists public.cumsum_ctry;

---losa

select
q.LSOA11CD,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.LSOA11CD
                         ORDER BY q.week) AS cum_cases
into public.cumsum_lsoa
from						
(
SELECT
l."LSOA11CD" as LSOA11CD,
'LSOA' as polys,
week,
sum(cases) as cases
FROM
public."data_LSOATrends" t,
public.data_lsoalookup l
where
t.lsoa11_cd = l."LSOA11CD"
group by l."LSOA11CD", week) q
group by
q.LSOA11CD,
q.polys,
q.week,
q.cases;

---msoa

select
q.MSOA11CD,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.MSOA11CD
                         ORDER BY q.week) AS cum_cases
into public.cumsum_msoa
from						
(
SELECT
l."MSOA11CD" as MSOA11CD,
'MSOA' as polys,
week,
sum(cases) as cases
FROM
public."data_LSOATrends" t,
public.data_lsoalookup l
where
t.lsoa11_cd = l."LSOA11CD"
group by l."MSOA11CD", week) q
group by
q.MSOA11CD,
q.polys,
q.week,
q.cases;

---lad

select
q.LAD17CD,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.LAD17CD
                         ORDER BY q.week) AS cum_cases
into public.cumsum_lad
from						
(
SELECT
l."LAD17CD" as LAD17CD,
'LAD' as polys,
week,
sum(cases) as cases
FROM
public."data_LSOATrends" t,
public.data_lsoalookup l
where
t.lsoa11_cd = l."LSOA11CD"
group by l."LAD17CD", week) q
group by
q.LAD17CD,
q.polys,
q.week,
q.cases;


---rgn

select
q.RGN11CD,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.RGN11CD
                         ORDER BY q.week) AS cum_cases
into public.cumsum_rgn
from						
(
SELECT
l."RGN11CD" as RGN11CD,
'RGN' as polys,
week,
sum(cases) as cases
FROM
public."data_LSOATrends" t,
public.data_lsoalookup l
where
t.lsoa11_cd = l."LSOA11CD"
group by l."RGN11CD", week) q
group by
q.RGN11CD,
q.polys,
q.week,
q.cases;

---ctry

select
q.CTRY11CD,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.CTRY11CD
                         ORDER BY q.week) AS cum_cases
into public.cumsum_ctry
from						
(
SELECT
l."CTRY11CD" as CTRY11CD,
'CTRY' as polys,
week,
sum(cases) as cases
FROM
public."data_LSOATrends" t,
public.data_lsoalookup l
where
t.lsoa11_cd = l."LSOA11CD"
group by l."CTRY11CD", week) q
group by
q.CTRY11CD,
q.polys,
q.week,
q.cases;
