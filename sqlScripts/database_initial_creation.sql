
-- NEED TO HAVE RUN THE CREATE DB SCRIPT FIRST
-- psql -f .\sqlScripts\create_db.sql -U HDR_DB_ACCESS

-- psql -f .\sqlScripts\database_initial_creation.sql -U HDR_DB_ACCESS --dbname HDR_GATEWAY_DB_SET

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
    -- OWNER to "HDR_DB_ACCESS";

    -- Index: search_user

    -- DROP INDEX public.search_user;

    CREATE INDEX search_user
    ON public.searchaudit_log USING btree
    (searchaudit_user_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;

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

                -- FUNCTION: public.trigger_set_timestamp()

                -- DROP FUNCTION public.trigger_set_timestamp();

                CREATE FUNCTION public.trigger_set_timestamp()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
                BEGIN
  NEW.last_updated = NOW
                ();
                RETURN NEW;
                END;
$BODY$;

                ALTER FUNCTION public.trigger_set_timestamp()
    OWNER TO "HDR_DB_ACCESS";


                -- FUNCTION: public.trigger_set_timestamp_new()

                -- DROP FUNCTION public.trigger_set_timestamp_new();

                CREATE FUNCTION public.trigger_set_timestamp_new()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
                BEGIN
  NEW.created_on= NOW
                ();
                RETURN NEW;
                END;
$BODY$;

                ALTER FUNCTION public.trigger_set_timestamp_new()
    OWNER TO "HDR_DB_ACCESS";
