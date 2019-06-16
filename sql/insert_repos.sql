INSERT INTO repo (id, name, url)
    SELECT
	CAST(data_json->'repo'->>'id' AS integer),
	data_json->'repo'->>'name',
	data_json->'repo'->>'url'
    FROM events_raw
    ON CONFLICT DO NOTHING
