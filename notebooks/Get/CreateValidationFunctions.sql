-- Table: public.tbl_All_OWID_Data

CREATE OR REPLACE FUNCTION public.is_valid_date(
	text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    IMMUTABLE 
AS $BODY$
begin
  return case when $1::date is null then false else true end;
exception when others then
  return false;
end;$BODY$;

ALTER FUNCTION public.is_valid_date(text)
    OWNER TO pythonuser;

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