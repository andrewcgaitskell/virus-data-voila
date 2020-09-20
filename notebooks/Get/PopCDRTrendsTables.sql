drop table if exists public."data_CDRTrends";

SELECT
index,
"CountryName",
"RegionName",
source,
variable,
value,
case when public.is_valid_date("Date") then "Date"::date else Null end "Date",
case when public.is_valid_date("EarliestConfirmedDate") then "EarliestConfirmedDate"::date else Null end "EarliestConfirmedDate",
case when public.is_valid_int("DaysFromStart") then "DaysFromStart"::integer else Null end "DaysFromStart",
case when public.is_valid_int("DaysFromAnchor") then "DaysFromAnchor"::integer else Null end "DaysFromAnchor",
"Max Source",
case when public.is_valid_float("TrendValue") then "TrendValue"::float else Null end "TrendValue",
case when public.is_valid_int("Country_Rank") then "Country_Rank"::integer else Null end "Country_Rank"
into public."data_CDRTrends"
FROM public."raw_CDRTrends";

ALTER TABLE public."data_CDRTrends"
    OWNER to pythonuser;
