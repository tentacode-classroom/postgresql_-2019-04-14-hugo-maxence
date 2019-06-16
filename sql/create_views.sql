\c github_events;

DROP VIEW IF EXISTS push_event_countCommits;
-- DROP VIEW IF EXISTS issue_event_info;

CREATE VIEW push_event_countCommits AS
SELECT SUM(pe.commits),
       repo.name
FROM push_event pe
         JOIN repo ON repo.id = pe.repo
GROUP BY repo.id;


SELECT *
FROM push_event_countCommits;
