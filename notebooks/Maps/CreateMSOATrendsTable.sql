-- Table: public.tbl_MSOATrends

DROP TABLE IF EXISTS public."raw_MSOATrends";


CREATE TABLE public."raw_MSOATrends"
(
    index bigint,
    code text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default",
    weekastext text COLLATE pg_catalog."default",
    cases text COLLATE pg_catalog."default",
    lenvar text COLLATE pg_catalog."default",
    week text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_MSOATrends"
    OWNER to pythonuser;
