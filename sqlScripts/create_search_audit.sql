-- Table: public."searchAudit_log"

-- DROP TABLE public."searchAudit_log";

CREATE TABLE public."searchAudit_log"
(
    "searchAudit_ID" integer NOT NULL
    GENERATED ALWAYS AS IDENTITY
    ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "search_user_ID" character
    (100) COLLATE pg_catalog."default",
    "search_Detail" character
    (2500) COLLATE pg_catalog."default",
    search_end_point character
    (500) COLLATE pg_catalog."default",
    created_on timestamp
    with time zone,
    last_updated timestamp
    with time zone,
    CONSTRAINT "searchAudit_log_pkey" PRIMARY KEY
    ("searchAudit_ID")
)

TABLESPACE pg_default;

    ALTER TABLE public."searchAudit_log"
    OWNER to "HDR_DB_ACCESS";

    -- Index: search_user

    -- DROP INDEX public.search_user;

    CREATE INDEX search_user
    ON public."searchAudit_log" USING btree
    ("search_user_ID" COLLATE pg_catalog."default")
    TABLESPACE pg_default;

    -- Trigger: Created At

    -- DROP TRIGGER "Created At" ON public."searchAudit_log";

    CREATE TRIGGER "Created At"
    BEFORE
    INSERT
    ON public.
    "searchAudit_log"
    FOR
    EACH
    ROW
    EXECUTE
    PROCEDURE public.trigger_set_timestamp_new
    ();

    -- Trigger: Last Updated

    -- DROP TRIGGER "Last Updated" ON public."searchAudit_log";

    CREATE TRIGGER "Last Updated"
    BEFORE
    INSERT OR
    UPDATE OF last_updated
    ON public."searchAudit_log"
    FOR EACH ROW
    EXECUTE
    PROCEDURE public.trigger_set_timestamp
    ();