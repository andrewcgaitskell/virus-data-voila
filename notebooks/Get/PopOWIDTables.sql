drop table if exists public."data_All_OWID_Data";

SELECT
index,
iso_code,
continent,
"Country",
case when public.is_valid_date("date") then "date"::date else Null end "date",
week,
variable,
value
into public."data_All_OWID_Data"
FROM public."raw_All_OWID_Data";

ALTER TABLE public."data_All_OWID_Data"
    OWNER to pythonuser;
