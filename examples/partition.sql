DROP TABLE IF EXISTS test CASCADE;

CREATE TABLE test (
	name VARCHAR(255),
	number INT NOT NULL
) PARTITION BY RANGE (number);

CREATE TABLE test_a PARTITION OF test
	FOR VALUES FROM (0) TO (6);

CREATE TABLE test_b PARTITION OF test
	FOR VALUES FROM (6) TO (10);

CREATE INDEX ON test (number);

INSERT INTO test (name, number) VALUES
	('Hugo', 3),
	('Maxence', 7),
	('Louise', 6),
	('Tom', 5);
