-- Table: public.searchaudit_log

-- DROP TABLE public.searchaudit_log;

CREATE TABLE public.searchaudit_log
(
    searchaudit_id integer NOT NULL
    GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    searchaudit_user_id character
    (100) COLLATE pg_catalog."default",
    searchaudit_detail character
    (2500) COLLATE pg_catalog."default",
    searchaudit_end_point character
    (500) COLLATE pg_catalog."default",
    searchaudit_record_offset integer DEFAULT 0,
    searchaudit_record_limit integer DEFAULT 10,
    searchaudit_created_on timestamp
    with time zone DEFAULT now
    (),
    searchaudit_updated_on timestamp
    with time zone DEFAULT now
    (),
    CONSTRAINT searchaudit_log_pkey PRIMARY KEY
    (searchaudit_id)
)

TABLESPACE pg_default;

    ALTER TABLE public.searchaudit_log
    OWNER to "HDR_DB_ACCESS";

    -- Index: search_user

    -- DROP INDEX public.search_user;

    CREATE INDEX search_user
    ON public.searchaudit_log USING btree
    (searchaudit_user_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;