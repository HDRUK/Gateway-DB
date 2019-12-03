-- Table: public.searchfilters

-- DROP TABLE public.searchfilters;

CREATE TABLE public.searchfilters
(
    searchfilters_id integer NOT NULL
    GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    searchfilters_value character varying
    (100) COLLATE pg_catalog."default" NOT NULL,
    searchfilters_type character varying
    (100) COLLATE pg_catalog."default" NOT NULL,
    searchfilters_searchaudit_id integer,
    searchfilters_created_on timestamp
    with time zone DEFAULT now
    (),
    searchfilters_updated_on timestamp
    with time zone DEFAULT now
    (),
    CONSTRAINT searchfilters_pkey PRIMARY KEY
    (searchfilters_id),
    CONSTRAINT searchfilters_searchaudit FOREIGN KEY
    (searchfilters_searchaudit_id)
        REFERENCES public.searchaudit_log
    (searchaudit_id) MATCH SIMPLE
        ON
    UPDATE NO ACTION
        ON
    DELETE NO ACTION
        NOT VALID
    )

TABLESPACE pg_default;

    ALTER TABLE public.searchfilters
    OWNER to "HDR_DB_ACCESS";