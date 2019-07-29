CREATE KEYSPACE IF NOT EXISTS cypher
        WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

USE cypher;

CREATE TABLE IF NOT EXISTS users (
        user_id uuid,
        first_name text,
        last_name text,
        phone_numbers list<text>,
        age tinyint,
        account_creation_date timestamp,
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

CREATE TYPE event_classification (
    classification_name text,
    classification_type tinyint,
);

CREATE TABLE events (
    event text,
    event_duration tuple<int, text>,
    classification frozen<event_classification>,
)

INSERT INTO events (event, event_duration) VALUES ('ev1', (3, 'hours'));

CREATE MATERIALIZED VIEW monkeySpecies_by_population AS
    SELECT * FROM monkeySpecies
    WHERE population IS NOT NULL AND species IS NOT NULL
    PRIMARY KEY (population, species)
    WITH comment='Allow query by population instead of species';
