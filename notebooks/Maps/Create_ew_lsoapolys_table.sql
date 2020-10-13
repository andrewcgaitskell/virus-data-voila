-- Table: public.data_ew_lsoapolys

DROP TABLE if exists public.data_ew_lsoapolys;

CREATE TABLE public.data_ew_lsoapolys
(
    "OBJECTID" bigint,
    "LSOA11CD" text COLLATE pg_catalog."default",
    "LSOA11NM" text COLLATE pg_catalog."default",
    "LSOA11NMW" text COLLATE pg_catalog."default",
    "Shape__Are" double precision,
    "Shape__Len" double precision,
	"geometryastext" text COLLATE pg_catalog."default",
    geometry geometry(Geometry,27700)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.data_ew_lsoapolys
    OWNER to pythonuser;