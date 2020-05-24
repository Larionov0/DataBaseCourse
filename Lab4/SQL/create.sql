CREATE TABLE User_ (
    id INTEGER PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Genre (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Developer (
    id INTEGER PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE Game (
    id INTEGER PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    developer_id INTEGER REFERENCES Developer(id)
);

CREATE TABLE Comment_ (
    id INTEGER PRIMARY KEY,
    text VARCHAR(1000),
    user_id INTEGER REFERENCES User_(id),
    game_id INTEGER REFERENCES Game(id)
);

CREATE TABLE Game_Ratings (
    rate INTEGER CHECK(rate = 0 or rate = 1 or rate = -1),
    user_id INTEGER REFERENCES User_(id),
    game_id INTEGER REFERENCES Game(id),
    CONSTRAINT game_ratings_pk PRIMARY KEY (user_id, game_id)
);

CREATE TABLE Platform (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Game_Platform (
    game_id INTEGER REFERENCES Game(id),
    platform_id INTEGER REFERENCES Platform(id),
    CONSTRAINT platform_game_pk PRIMARY KEY (game_id, platform_id)
);

CREATE TABLE Game_Genre (
    game_id INTEGER REFERENCES Game(id),
    genre_id INTEGER REFERENCES Genre(id),
    CONSTRAINT platform_genre_pk PRIMARY KEY (game_id, genre_id)
);

