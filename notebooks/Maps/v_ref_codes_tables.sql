-- View: public.v_ref_codes_tables

-- DROP VIEW public.v_ref_codes_tables;

CREATE OR REPLACE VIEW public.v_ref_codes_tables
 AS
 SELECT DISTINCT raw_ew_lsoapolys."LSOA11CD" AS code,
    'LSOA11CD'::text AS column_names,
    'poly_lsoa'::text AS table_names
   FROM raw_ew_lsoapolys
UNION
 SELECT DISTINCT raw_ew_lsoapolys."MSOA11CD" AS code,
    'MSOA11CD'::text AS column_names,
    'poly_msoa'::text AS table_names
   FROM raw_ew_lsoapolys
UNION
 SELECT DISTINCT raw_ew_lsoapolys."LAD17CD" AS code,
    'LAD17CD'::text AS column_names,
    'poly_lad'::text AS table_names
   FROM raw_ew_lsoapolys
UNION
 SELECT DISTINCT raw_ew_lsoapolys."RGN11CD" AS code,
    'RGN11CD'::text AS column_names,
    'poly_region'::text AS table_names
   FROM raw_ew_lsoapolys
UNION
 SELECT DISTINCT raw_ew_lsoapolys."CTRY11CD" AS code,
    'CTRY11CD'::text AS column_names,
    'poly_country'::text AS table_names
   FROM raw_ew_lsoapolys;

ALTER TABLE public.v_ref_codes_tables
    OWNER TO pythonuser;
