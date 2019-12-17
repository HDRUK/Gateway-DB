CREATE TABLE public.accessrequest
    (
        accessrequest_id integer NOT NULL
            GENERATED ALWAYS AS IDENTITY
            ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
        accessrequest_user_id character varying
            (100) COLLATE pg_catalog."default",
        accessrequest_datamodel_id character varying
            (100) COLLATE pg_catalog."default",
        accessrequest_aim character varying
            COLLATE pg_catalog."default",
        accessrequest_linked_datasets character varying
            COLLATE pg_catalog."default",
        accessrequest_requirements character varying
            COLLATE pg_catalog."default",
        accessrequest_project_startdate timestamp
            with time zone DEFAULT now
            (),
        accessrequest_ico_registration character varying
            (100) COLLATE pg_catalog."default",
        accessrequest_benefits character varying
            COLLATE pg_catalog."default",
        accessrequest_evidence character varying
            COLLATE pg_catalog."default",
        accessrequest_contact_number character varying
            (100) COLLATE pg_catalog."default",
        accessrequest_recipient character varying
            (250) COLLATE pg_catalog."default",
        accessrequest_requested_on timestamp
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