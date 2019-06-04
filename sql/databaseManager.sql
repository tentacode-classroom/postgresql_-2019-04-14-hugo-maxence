CREATE DATABASE github_events;

CREATE TABLE events
(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
--     type VARCHAR(30),
--     actor VARCHAR(30),
--     repo VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE watch_events
(

) inherits (events);

CREATE TABLE push_events
(

) inherits (events);

SELECT events.id from events;
