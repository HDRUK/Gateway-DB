CREATE TABLE public.accessrequest
    (
        accessrequest_id integer NOT NULL
        GENERATED ALWAYS AS IDENTITY
        ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
        accessrequest_user_id character varying
        (100) COLLATE pg_catalog."default",
        accessrequest_datamodel_id character varying
        (100) COLLATE pg_catalog."default",
        accessrequest_created_on timestamp
        with time zone DEFAULT now
        (),
        accessrequest_updated_on timestamp
        with time zone DEFAULT now
        (),
        CONSTRAINT accessrequest_pkey PRIMARY KEY
        (accessrequest_id)
)

TABLESPACE
    pg_default;

ALTER TABLE public.accessrequest
OWNER to :userName;

-- Index: fki_accessrequest_user_id

-- DROP INDEX public.fki_accessrequest_user_id;

CREATE INDEX fki_accessrequest_user_id
ON public.accessrequest USING btree
(accessrequest_user_id)
TABLESPACE pg_default;