-- Table: public.tbl_LSOATrends

DROP TABLE IF EXISTS public."raw_ew_lsoapolys";

--['OBJECTID', 'LSOA11CD', 'LSOA11NM', 'LSOA11NMW', 'Shape__Are',
--       'Shape__Len', 'geometry'],

CREATE TABLE public."raw_ew_lsoapolys"
(
    index text COLLATE pg_catalog."default",
    "OBJECTID" text COLLATE pg_catalog."default",
    "LSOA11CD" text COLLATE pg_catalog."default",
    "LSOA11NM" text COLLATE pg_catalog."default",
    "Shape__Are" text COLLATE pg_catalog."default",
    "Shape__Len" text COLLATE pg_catalog."default",
    "geometry" text COLLATE pg_catalog."default",
    "MSOA11CD" text COLLATE pg_catalog."default",
    "MSOA11NM" text COLLATE pg_catalog."default",
    "LAD17NM" text COLLATE pg_catalog."default",
    "LAD17CD" text COLLATE pg_catalog."default",
    "RGN11CD" text COLLATE pg_catalog."default",
    "RGN11NM" text COLLATE pg_catalog."default",
    "CTRY11CD" text COLLATE pg_catalog."default",
    "CTRY11NM" text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_ew_lsoapolys"
    OWNER to pythonuser;