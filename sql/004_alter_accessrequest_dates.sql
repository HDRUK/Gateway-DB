ALTER TABLE accessrequest
    ADD accessrequest_updated_on timestamp
        with time zone DEFAULT now
        ();
ALTER TABLE accessrequest RENAME COLUMN accessrequest_requested_on TO accessrequest_created_on;
ALTER TABLE accessrequest ALTER COLUMN accessrequest_project_startdate DROP DEFAULT;