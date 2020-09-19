-- Table: public.tbl_All_OWID_Data

DROP TABLE if exists public."raw_All_OWID_Data";

CREATE TABLE public."raw_All_OWID_Data"
(
    index bigint,
    iso_code text COLLATE pg_catalog."default",
    continent text COLLATE pg_catalog."default",
    "Country" text COLLATE pg_catalog."default",
    "date" text COLLATE pg_catalog."default",
    week text COLLATE pg_catalog."default",
    variable text COLLATE pg_catalog."default",
    value text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_All_OWID_Data"
    OWNER to pythonuser;
-- Index: ix_tbl_All_OWID_Data_index
