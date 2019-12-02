export default add_searchsaved_name_column = {
    up: () => `
    ALTER TABLE searchsaved
    ADD searchsaved_name character varying (100) COLLATE pg_catalog."default"`,

    down: () => `
    ALTER TABLE searchsaved
    DROP COLUMN searchsaved_name`
};
