-- Table: public.searchsaved

-- DROP TABLE public.searchsaved;

CREATE TABLE public.searchsaved
(
    searchsaved_id integer NOT NULL
    GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    searchsaved_user_id character varying
    (100) COLLATE pg_catalog."default",
    searchsaved_searchaudit_id integer,
    searchsaved_created_on timestamp
    with time zone DEFAULT now
    (),
    searchsaved_updated_on timestamp
    with time zone DEFAULT now
    (),
    CONSTRAINT searchsaved_pkey PRIMARY KEY
    (searchsaved_id),
    CONSTRAINT searchsaved_searchaudit_id FOREIGN KEY
    (searchsaved_searchaudit_id)
        REFERENCES public.searchaudit_log
    (searchaudit_id) MATCH SIMPLE
        ON
    UPDATE NO ACTION
        ON
    DELETE NO ACTION
)

TABLESPACE
    pg_default;

    ALTER TABLE public.searchsaved
    OWNER to "HDR_DB_ACCESS";

    -- Index: fki_searchsaved_searchaudit_id

    -- DROP INDEX public.fki_searchsaved_searchaudit_id;

    CREATE INDEX fki_searchsaved_searchaudit_id
    ON public.searchsaved USING btree
    (searchsaved_searchaudit_id)
    TABLESPACE pg_default;