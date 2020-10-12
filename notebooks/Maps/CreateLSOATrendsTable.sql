-- Table: public.tbl_LSOATrends

DROP TABLE IF EXISTS public."raw_LSOATrends";


---LSOA11_CD	LSOA11_NM	WeekAsText	Cases	Week


CREATE TABLE public."raw_LSOATrends"
(
    index bigint,
    "lsoa11_cd" text COLLATE pg_catalog."default",
    "lsoa11_nm" text COLLATE pg_catalog."default",
    weekastext text COLLATE pg_catalog."default",
    cases text COLLATE pg_catalog."default",
    week text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_LSOATrends"
    OWNER to pythonuser;
