\c github_events;

DROP VIEW IF EXISTS push_event_count_commits;

CREATE VIEW push_event_count_commits AS
SELECT SUM(pe.commits) number_commits,
       repo.name       repo_name
FROM push_event pe
         JOIN repo ON repo.id = pe.repo
GROUP BY repo.id
ORDER BY number_commits DESC;


SELECT *
FROM push_event_count_commits;
