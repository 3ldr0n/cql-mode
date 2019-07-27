CREATE KEYSPACE IF NOT EXISTS cypher
        WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

USE cypher;

CREATE TABLE IF NOT EXISTS users (
        user_id uuid,
        first_name text,
        last_name text,
        phone_numbers list<text>,
        PRIMARY KEY((transaction_id))
);

INSERT INTO users (user_id, first_name, last_name)
        VALUES ("", "", "");

UPDATE users SET first_name = "Donald"
        WHERE user_id = "random-uuid"

CREATE TYPE IF NOT EXISTS phone (
    country_code int,
    number text,
);

CREATE TYPE IF NOT EXISTS address (
    street text,
    city text,
    zip text,
    phones map<text, phone>
);

CREATE TABLE IF NOT EXISTS user (
    name text PRIMARY KEY,
    addresses map<text, frozen<address>>
);

DROP TYPE phone;

CREATE TABLE durations (
    event text,
    duration tuple<int, text>,
)

INSERT INTO durations (event, duration) VALUES ('ev1', (3, 'hours'));
