-- Table: public.tbl_LSOATrends

DROP TABLE IF EXISTS public."raw_LSOATrends";


---LSOA11_CD	LSOA11_NM	WeekAsText	Cases	Week


CREATE TABLE public."raw_LSOATrends"
(
    index bigint,
    "LSOA11_CD" text COLLATE pg_catalog."default",
    "LSOA11_NM" text COLLATE pg_catalog."default",
    WeekAsText text COLLATE pg_catalog."default",
    Cases text COLLATE pg_catalog."default",
    Week text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_LSOATrends"
    OWNER to pythonuser;
