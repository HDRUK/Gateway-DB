INSERT INTO public."searchAudit_log"
    ("search_user_ID", "search_Detail", "search_end_point", "search_record_offset", "search_record_limt")
VALUES
    ( 'ANON', 'diabeties + sugar', 'https://theapi/thesearch', 0, 20),
    ( 'WARD.T', 'sugar', 'https://theapi/thesearch', 0, 20),
    ( 'BARNEY_F', 'temperature', 'https://theapi/thesearch', 0, 10),
    ( 'ANON', 'cancer', 'https://theapi/thesearch', 10, 20),
    ( 'ANON', 'fluid + transfer', 'https://theapi/thesearch', 0, 20),
    ( 'ANON', 'heart rate', 'https://theapi/thesearch', 20, 20),
    ( 'ANON', 'diasease', 'https://theapi/thesearch', 0, 20);