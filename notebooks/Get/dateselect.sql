SELECT
index,
"CountryName",
"CountryCode",
case when is_valid_date("Date") then "Date"::date else Null end "Date",
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
case when is_valid_date(startdate) then "Date"::date else Null end startdate,
case when is_valid_date(enddate) then "Date"::date else Null end enddate
into public."stage_CovidTrackerGantt"
FROM public."raw_CovidTrackerGantt";
