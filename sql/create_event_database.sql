-- Delete database is exist and create a new Database

DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;


-- Create table with values

CREATE TABLE repo
(
    id   BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255)          NOT NULL,
    url  VARCHAR(255)          NOT NULL
);

CREATE TABLE actor
(
    id            BIGSERIAL PRIMARY KEY NOT NULL,
    login         VARCHAR(255) UNIQUE   NOT NULL,
    display_login VARCHAR(255)          NOT NULL,
    url           VARCHAR(255)          NOT NULL,
    avatar_url    VARCHAR(255)
);

CREATE TABLE events
(
    id     BIGSERIAL PRIMARY KEY        NOT NULL,
    actor  BIGINT REFERENCES actor (id) NOT NULL,
    repo   BIGINT REFERENCES repo (id)  NOT NULL,
    public boolean                      NOT NULL
);

CREATE TABLE pull_request_event
(
    title TEXT NOT NULL,
    body  TEXT
) INHERITS (events);

CREATE TABLE issue_event
(
    html_url TEXT NOT NULL,
    body     TEXT
) INHERITS (events);

CREATE TABLE push_event
(
    commits int
) INHERITS (events);


-- Insert fake values on tables to test

INSERT INTO repo (name, url)
VALUES ('repo-max', 'https://github.com/MaxenceMottard'),
       ('repo-hugo', 'https://github.com/HugoBordais');

INSERT INTO actor (login, display_login, url, avatar_url)
VALUES ('max', 'max', 'https://github.com/MaxenceMottard',
        'https://avatars1.githubusercontent.com/u/28975415?s=400&v=4'),
       ('hugo', 'hugo', 'https://github.com/HugoBordais',
        'https://avatars3.githubusercontent.com/u/33489155?s=400&v=4');

INSERT INTO events (actor, repo, public)
VALUES (1, 2, true),
       (2, 1, true);

INSERT INTO pull_request_event (actor, repo, public, title, body)
VALUES (2, 2, true, 'Nouveau fichier', 'Un nouveau fichier a été ajouté pour tester'),
       (1, 2, true, 'Mise à jour 5.2', 'MAJ de WordPress vers la version 5.2');

INSERT INTO issue_event (actor, repo, public, body, html_url)
VALUES (2, 2, true, 'Error test', 'https://google.fr'),
       (1, 2, true, 'Fix Navbar style', 'https://google.fr');

INSERT INTO push_event (actor, repo, public, commits)
VALUES (1, 1, true, 37),
       (2, 1, true, 0);


-- Show tables

SELECT *
FROM repo;
SELECT *
FROM actor;
SELECT *
FROM events;
SELECT *
FROM pull_request_event;
SELECT *
FROM push_event;


-- Delete fake values

TRUNCATE repo RESTART IDENTITY CASCADE;
TRUNCATE actor RESTART IDENTITY CASCADE;
TRUNCATE events RESTART IDENTITY CASCADE;
