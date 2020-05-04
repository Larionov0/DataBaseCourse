CREATE TABLE Genre (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Developer (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Game (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    developer_id INTEGER REFERENCES Developer(id)
);

CREATE TABLE Platform (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Ratings (
    id INTEGER PRIMARY KEY,
    positive INTEGER CHECK(positive >= 0),
    negative INTEGER CHECK(negative >= 0)
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

CREATE TABLE Game_Ratings (
    game_id INTEGER REFERENCES Game(id),
    ratings_id INTEGER REFERENCES Ratings(id),
    CONSTRAINT platform_rating_pk PRIMARY KEY (game_id, ratings_id)
);
