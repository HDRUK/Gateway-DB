with SearchAdt as (
INSERT INTO public."searchaudit_log"
    ("searchaudit_user_id", "searchaudit_detail", "searchaudit_end_point", "searchaudit_record_offset", "searchaudit_record_limit")
VALUES
    ( 'JAN123', 'diabeties + sugar', 'https://theapi/thesearch', 0, 20)
RETURNING "searchaudit_id"), SearchADT2 as
(

INSERT INTO public."searchfilters"
    ("searchfilters_searchaudit_id", "searchfilters_value", "searchfilters_type")
VALUES
    ((select searchaudit_id
        from SearchADT)
, 'England', 'Geography'),
    ((select searchaudit_id
        from SearchADT)
, '1234', 'Random')
RETURNING "searchfilters_searchaudit_id"
),
SearchADT3 as
(
INSERT INTO public."searchsort"
    ("searchsort_searchaudit_id", "searchsort_applied", "searchsort_value")
VALUES
    ((select searchaudit_id
        from SearchADT)
, 'Release Date', '1234'),
    ((select searchaudit_id
        from SearchADT)
, 'Alphabetical', 'Direction')
)
INSERT INTO public."searchsaved"
    ("searchsaved_searchaudit_id", "searchsaved_user_id")
VALUES
    ((select searchaudit_id
        from SearchADT)
, 'JAN123')
