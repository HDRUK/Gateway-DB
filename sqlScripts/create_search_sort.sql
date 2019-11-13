-- Table: public.searchsort

-- DROP TABLE public.searchsort;

CREATE TABLE public.searchsort
(
    searchsort_id integer NOT NULL
    GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    searchsort_applied character varying
    (100) COLLATE pg_catalog."default",
    searchsort_value character varying
    (100) COLLATE pg_catalog."default",
    searchsort_searchaudit_id integer,
    searchsort_created_on timestamp
    with time zone DEFAULT now
    (),
    searchsort_updated_on timestamp
    with time zone DEFAULT now
    (),
    CONSTRAINT searchsort_pkey PRIMARY KEY
    (searchsort_id),
    CONSTRAINT searchsort_searchaudit FOREIGN KEY
    (searchsort_searchaudit_id)
        REFERENCES public.searchaudit_log
    (searchaudit_id) MATCH SIMPLE
        ON
    UPDATE NO ACTION
        ON
    DELETE NO ACTION
        NOT VALID
    )

TABLESPACE pg_default;

    ALTER TABLE public.searchsort
    OWNER to "HDR_DB_ACCESS";