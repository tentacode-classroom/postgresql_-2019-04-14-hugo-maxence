\c github_events;

DROP VIEW IF EXISTS push_event_count_commits;

CREATE VIEW push_event_count_commits AS
SELECT SUM(pe.commits),
       repo.name
FROM push_event pe
         JOIN repo ON repo.id = pe.repo
GROUP BY repo.id;


SELECT *
FROM push_event_count_commits;
