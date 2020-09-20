CREATE OR REPLACE FUNCTION public.is_valid_float(
	text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    IMMUTABLE 
AS $BODY$
begin
  return case when $1::float is null then false else true end;
exception when others then
  return false;
end;$BODY$;

ALTER FUNCTION public.is_valid_float(text)
    OWNER TO pythonuser;

CREATE OR REPLACE FUNCTION public.is_valid_int(text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    IMMUTABLE 
AS $BODY$
begin
  return case when $1::integer is null then false else true end;
exception when others then
  return false;
end;$BODY$;

ALTER FUNCTION public.is_valid_int(text)
    OWNER TO pythonuser;

drop table if exists public."data_OxCGRTData";

SELECT
index,
"CountryName",
"CountryCode",
"RegionName",
"RegionCode",
case when public.is_valid_date("Date") then "Date"::date else Null end "Date",
variable,
case when public.is_valid_float("value") then "value"::float else Null end "value"
into public."data_OxCGRTData"
FROM public."raw_OxCGRTData";

ALTER TABLE public."data_OxCGRTData"
    OWNER to pythonuser;
-- Index: ix_tbl_CovidIndexData_index
