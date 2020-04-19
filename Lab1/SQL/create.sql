CREATE TABLE genre (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE developer (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    developer_id INTEGER REFERENCES developer(id),
    genre_id INTEGER REFERENCES genre(id),
    positive_ratings INTEGER CHECK(positive_ratings >= 0),
    negative_ratings INTEGER CHECK(negative_ratings >= 0)
);

CREATE TABLE platform (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE PlatformApp (
    game_id INTEGER REFERENCES game(id),
    platform_id INTEGER REFERENCES platform(id),
    CONSTRAINT pk_platform_app PRIMARY KEY (game_id, platform_id)
);


