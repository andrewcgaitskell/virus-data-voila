CREATE OR REPLACE FUNCTION public.is_valid_float(text)
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

DROP TABLE IF EXISTS public."raw_OxCGRTData";

CREATE TABLE public."raw_OxCGRTData"
(
    index bigint,
    "CountryName" text COLLATE pg_catalog."default",
    "CountryCode" text COLLATE pg_catalog."default",
    "RegionName" text COLLATE pg_catalog."default",
    "RegionCode" text COLLATE pg_catalog."default",
    "Date" text COLLATE pg_catalog."default",
    variable text COLLATE pg_catalog."default",
    value text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_OxCGRTData"
    OWNER to pythonuser;