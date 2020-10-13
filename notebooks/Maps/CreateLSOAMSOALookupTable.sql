-- Table: public.testoalookup

DROP TABLE if exists public.raw_lsoalookup;

CREATE TABLE public.raw_lsoalookup
(
    index text COLLATE pg_catalog."default",
    "OA11CD" text COLLATE pg_catalog."default",
    "OAC11CD" text COLLATE pg_catalog."default",
    "OAC11NM" text COLLATE pg_catalog."default",
    "LSOA11CD" text COLLATE pg_catalog."default",
    "LSOA11NM" text COLLATE pg_catalog."default",
    "SOAC11CD" text COLLATE pg_catalog."default",
    "SOAC11NM" text COLLATE pg_catalog."default",
    "MSOA11CD" text COLLATE pg_catalog."default",
    "MSOA11NM" text COLLATE pg_catalog."default",
    "LAD17CD" text COLLATE pg_catalog."default",
    "LAD17NM" text COLLATE pg_catalog."default",
    "LACCD" text COLLATE pg_catalog."default",
    "LACNM" text COLLATE pg_catalog."default",
    "RGN11CD" text COLLATE pg_catalog."default",
    "RGN11NM" text COLLATE pg_catalog."default",
    "CTRY11CD" text COLLATE pg_catalog."default",
    "CTRY11NM" text COLLATE pg_catalog."default",
    "FID" text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_lsoalookup
    OWNER to pythonuser;
-- Index: ix_testoalookup_index

-- DROP INDEX public.ix_testoalookup_index;