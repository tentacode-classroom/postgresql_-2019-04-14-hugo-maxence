INSERT INTO actor (id, login, display_login, url, avatar_url)
    SELECT
    CAST(data_json->'actor'->>'id' AS integer),
    data_json->'actor'->>'login',
    data_json->'actor'->>'display_login',
    data_json->'actor'->>'url',
    data_json->'actor'->>'avatar_url'
    FROM events_raw
    ON CONFLICT DO NOTHING;
