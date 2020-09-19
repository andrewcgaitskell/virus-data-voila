DROP TABLE IF EXISTS public."data_CovidTrackerGantt";

SELECT
index,
"CountryName",
"CountryCode",
case when public.is_valid_date("Date") then "Date"::date else Null end "Date",
"Name",
"Category_x",
"CategoryJoin",
"ShortCode",
"ShortDescription",
"Description",
"Measurement",
"Category_y",
"Type",
"ActivityLong",
"Activity",
"ActivityGroup",
prev_name,
prev_category,
newtask,
case when is_valid_date(startdate) then "startdate"::date else Null end startdate,
case when is_valid_date(enddate) then "enddate"::date else Null end enddate,
prev_activity,
case when is_valid_date(prev_date) then "prev_date"::date else Null end prev_date
into public."data_CovidTrackerGantt"
FROM public."raw_CovidTrackerGantt";

ALTER TABLE public."data_CovidTrackerGantt"
    OWNER to pythonuser;
