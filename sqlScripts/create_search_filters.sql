-- Table: public."searchFilters"

-- DROP TABLE public."searchFilters";

CREATE TABLE public."searchFilters"
(
    "searchFiletrs_Created_on" time
    with time zone[] NOT NULL,
    "searchFilters_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "searchFilters_Last_Updated" time
    with time zone[] NOT NULL,
    "searchFilters_Value" character varying
    (100) COLLATE pg_catalog."default" NOT NULL,
    "serachFilters_Type" character varying
    (100) COLLATE pg_catalog."default" NOT NULL,
    "searchFilters_SearchAudit_ID" integer NOT NULL,
    CONSTRAINT "searchFilters_pkey" PRIMARY KEY
    ("searchFilters_ID"),
    CONSTRAINT "SearchAuditLogJoin" FOREIGN KEY
    ("searchFilters_SearchAudit_ID")
        REFERENCES public."searchAudit_log"
    ("searchAudit_ID") MATCH SIMPLE
        ON
    UPDATE NO ACTION
        ON
    DELETE NO ACTION
        NOT VALID
    )

TABLESPACE pg_default;

    ALTER TABLE public."searchFilters"
    OWNER to "HDR_DB_ACCESS";