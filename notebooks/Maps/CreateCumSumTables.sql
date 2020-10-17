drop table if exists public.cumsum_msoa;
drop table if exists public.cumsum_lad;
drop table if exists public.cumsum_rgn;
drop table if exists public.cumsum_ctry;

---msoa

select
q.code,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.code
                         ORDER BY q.week) AS cum_cases
into public.cumsum_msoa
from
(
SELECT
l."MSOA11CD" as code,
'MSOA' as polys,
week,
sum(cases) as cases
FROM
public."data_MSOATrends" t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by l."MSOA11CD", week) q
group by
q.code,
q.polys,
q.week,
q.cases;

---lad

select
q.code,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.code
                         ORDER BY q.week) AS cum_cases
into public.cumsum_lad
from
(
SELECT
l."LAD17CD" as code,
'LAD' as polys,
week,
sum(cases) as cases
FROM
public."data_MSOATrends" t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by l."LAD17CD", week) q
group by
q.code,
q.polys,
q.week,
q.cases;


---rgn

select
q.code,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.code
                         ORDER BY q.week) AS cum_cases
into public.cumsum_rgn
from
(
SELECT
l."RGN11CD" as code,
'RGN' as polys,
week,
sum(cases) as cases
FROM
public."data_MSOATrends" t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by l."RGN11CD", week) q
group by
q.code,
q.polys,
q.week,
q.cases;

---ctry

select
q.code,
q.polys,
q.week,
q.cases as cases,
sum(q.cases) OVER (PARTITION BY q.code
                         ORDER BY q.week) AS cum_cases
into public.cumsum_ctry
from
(
SELECT
l."CTRY11CD" as code,
'CTRY' as polys,
week,
sum(cases) as cases
FROM
public."data_MSOATrends" t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by l."CTRY11CD", week) q
group by
q.code,
q.polys,
q.week,
q.cases;