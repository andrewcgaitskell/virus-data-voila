drop table if exists public.data_msoa_populations_byage;

delete from public.raw_pop_allpersons
where "Age" = 'Age';

delete from public.raw_pop_malepersons
where "Age" = 'Age';

delete from public.raw_pop_femalepersons
where "Age" = 'Age';

select
index,
'All' as mf,
"MSOA Code" as code,
"Age" as age,
case when public.is_valid_float("Value") then "Value"::float else 0 end as value
into public.data_msoa_populations_byage
from public.raw_pop_allpersons
union
select
index,
'Male' as mf,
"MSOA Code" as code,
"Age" as age,
case when public.is_valid_float("Value") then "Value"::float else 0 end as value
from public.raw_pop_malepersons
union
select
index,
'Female' as mf,
"MSOA Code" as code,
"Age" as age,
case when public.is_valid_float("Value") then "Value"::float else 0 end as value
from public.raw_pop_femalepersons;

-----

drop table if exists public.msoa_populations;
drop table if exists public.lad_populations;
drop table if exists public.rgn_populations;
drop table if exists public.ctry_populations;

---msoa

SELECT
l."MSOA11CD" as code,
'MSOA' as polys,
mf,
age,
sum(value) as population
into public.msoa_populations
FROM
public.data_msoa_populations_byage t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by
l."MSOA11CD", mf, age;

---lad

SELECT
l."LAD17CD" as code,
'LAD' as polys,
mf,
age,
sum(value) as population
into public.lad_populations
FROM
public.data_msoa_populations_byage t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by
l."LAD17CD", mf, age;


---rgn

SELECT
l."RGN11CD" as code,
'LAD' as polys,
mf,
age,
sum(value) as population
into public.rgn_populations
FROM
public.data_msoa_populations_byage t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by
l."RGN11CD", mf, age;

---ctry

SELECT
l."CTRY11CD" as code,
'LAD' as polys,
mf,
age,
sum(value) as population
into public.ctry_populations
FROM
public.data_msoa_populations_byage t,
public.data_msoalookup l
where
t.code = l."MSOA11CD"
group by
l."CTRY11CD", mf, age;
