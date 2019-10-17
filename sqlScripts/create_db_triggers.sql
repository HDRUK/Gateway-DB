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
    OWNER TO postgres;
