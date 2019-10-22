INSERT INTO public."searchAudit_log"
    ("search_user_ID", "search_Detail", search_end_point)
VALUES
    ( 'ANON', 'https://theapi/thesearch?param1=1', 'theapi'),
    ( 'WARD.T', 'https://theapi/thesearch?param1=2', 'theapi'),
    ( 'BARNEY_F', 'https://theapi/thesearch?param1=3', 'theapi'),
    ( 'ANON', 'https://theapi/thesearch?param1=4', 'theapi'),
    ( 'ANON', 'https://theapi/thesearch?param1=5', 'theapi'),
    ( 'ANON', 'https://theapi/thesearch?param1=6', 'theapi'),
    ( 'ANON', 'https://theapi/thesearch?param1=7', 'theapi');