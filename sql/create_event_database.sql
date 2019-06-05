DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;



CREATE TABLE repo
(
    id    INT PRIMARY KEY NOT NULL,
    login VARCHAR(255)    NOT NULL,
    name  VARCHAR(255)    NOT NULL,
    url   VARCHAR(255)    NOT NULL
);

CREATE TABLE actor
(
    id            INT PRIMARY KEY NOT NULL,
    login         VARCHAR(255)    NOT NULL,
    display_login VARCHAR(255)    NOT NULL,
    url           VARCHAR(255)    NOT NULL,
    avatar_url    VARCHAR(255)
);

CREATE TABLE events
(
    id     INT PRIMARY KEY           NOT NULL,
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

INSERT INTO repo (id, login, name, url)
VALUES ('HG120', 'repo-max', 'maxence', 'https://github.com/MaxenceMottard'),
       ('T_601', 'repo-hugo', 'hugo', 'https://github.com/HugoBordais');

INSERT INTO actor (id, login, display_login, url, avatar_url)
VALUES ('UA502', 'max', 'max', 'https://github.com/MaxenceMottard',
        'https://avatars1.githubusercontent.com/u/28975415?s=400&v=4'),
       ('B6717', 'hugo', 'hugo', 'https://github.com/HugoBordais',
        'https://avatars3.githubusercontent.com/u/33489155?s=400&v=4');

INSERT INTO events (id, actor, repo, public)
VALUES ('PH917', 'jean-paul', 'azertyuiop', true),
       ('MH420', 'pierre-henry', 'poiuytreza', true);

INSERT INTO issue_event (id, actor, repo, public, issue_url)
VALUES ('PH7MH91420', 'jean-paul', 'azertyuiop', true, 'https://github.com/MaxenceMottard'),
       ('B6UA571702', 'pierre-henry', 'poiuytreza', true, 'https://github.com/HugoBordais');

INSERT INTO push_event (id, actor, repo, public, commits)
VALUES ('PH7MHHG12091420', 'jean-paul', 'azertyuiop', true, 37),
       ('B6UAT_601571702', 'pierre-henry', 'poiuytreza', true, 0);

SELECT * FROM repo;
SELECT * FROM actor;
SELECT * FROM issue_event;
SELECT * FROM push_event;
