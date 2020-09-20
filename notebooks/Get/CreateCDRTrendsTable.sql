-- Table: public.tbl_CovidCDRTrends

DROP TABLE IF EXISTS public."raw_CDRTrends";

CREATE TABLE public."raw_CDRTrends"
(
    index bigint,
    "CountryName" text COLLATE pg_catalog."default",
    "RegionName" text COLLATE pg_catalog."default",
    source text COLLATE pg_catalog."default",
    variable text COLLATE pg_catalog."default",
    value text COLLATE pg_catalog."default",
    "Date" text COLLATE pg_catalog."default",
    "EarliestConfirmedDate" text COLLATE pg_catalog."default",
    "DaysFromStart" text COLLATE pg_catalog."default",
    "DaysFromAnchor" text COLLATE pg_catalog."default",
    "Max Source" text COLLATE pg_catalog."default",
    "TrendValue" text COLLATE pg_catalog."default",
    "Country_Rank" text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."raw_CDRTrends"
    OWNER to pythonuser;
