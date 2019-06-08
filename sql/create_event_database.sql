-- Delete database is exist and create a new Database

DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

-- Create table with values

CREATE TABLE repo
(
    id    SERIAL PRIMARY KEY NOT NULL,
    login VARCHAR(255)       NOT NULL,
    name  VARCHAR(255)       NOT NULL,
    url   VARCHAR(255)       NOT NULL
);

CREATE TABLE actor
(
    id            SERIAL PRIMARY KEY  NOT NULL,
    login         VARCHAR(255) UNIQUE NOT NULL,
    display_login VARCHAR(255)        NOT NULL,
    url           VARCHAR(255)        NOT NULL,
    avatar_url    VARCHAR(255)
);

CREATE TABLE events
(
    id     SERIAL PRIMARY KEY        NOT NULL,
    actor  INT REFERENCES actor (id) NOT NULL,
    repo   INT REFERENCES repo (id)  NOT NULL,
    public boolean                   NOT NULL
);

CREATE TABLE issue_event
(
    issue_url varchar(255) NOT NULL
) INHERITS (events);

CREATE TABLE push_event
(
    commits int
) INHERITS (events);

-- Insert fake values on tables to test

INSERT INTO repo (login, name, url)
VALUES ('repo-max', 'maxence', 'https://github.com/MaxenceMottard'),
       ('repo-hugo', 'hugo', 'https://github.com/HugoBordais');

INSERT INTO actor (login, display_login, url, avatar_url)
VALUES ('max', 'max', 'https://github.com/MaxenceMottard',
        'https://avatars1.githubusercontent.com/u/28975415?s=400&v=4'),
       ('hugo', 'hugo', 'https://github.com/HugoBordais',
        'https://avatars3.githubusercontent.com/u/33489155?s=400&v=4');

INSERT INTO events (actor, repo, public)
VALUES (1, 2, true),
       (2, 1, true);

INSERT INTO issue_event (actor, repo, public, issue_url)
VALUES (2, 2, true, 'https://github.com/MaxenceMottard'),
       (1, 2, true, 'https://github.com/HugoBordais');

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
FROM issue_event;
SELECT *
FROM push_event;

TRUNCATE repo RESTART IDENTITY CASCADE;
TRUNCATE actor RESTART IDENTITY CASCADE;
TRUNCATE events RESTART IDENTITY CASCADE;
