-- User
INSERT INTO USER_(id, username)
VALUES (1, 'Bob');
INSERT INTO USER_(id, username)
VALUES (2, 'Boba');
INSERT INTO USER_(id, username)
VALUES (3, 'Bobov');


-- Genre
INSERT INTO Genre(id, name)
VALUES (1, 'MOBA');
INSERT INTO Genre(id, name)
VALUES (2, 'Action');
INSERT INTO Genre(id, name)
VALUES (3, 'Strategy');
INSERT INTO Genre(id, name)
VALUES (4, 'RPG');


-- Developer
INSERT INTO Developer(id, name)
VALUES (1, 'Riot');
INSERT INTO Developer(id, name)
VALUES (2, 'Valve');
INSERT INTO Developer(id, name)
VALUES (3, 'Fiksiki');
INSERT INTO Developer(id, name)
VALUES (4, 'Winnie The Pooh');
INSERT INTO Developer(id, name)
VALUES (5, 'MrSnale');


-- Game
INSERT INTO GAME(id, name, developer_id)
VALUES (1, 'Pooh', 4);
INSERT INTO GAME(id, name, developer_id)
VALUES (2, 'FiksiBattles', 3);
INSERT INTO GAME(id, name, developer_id)
VALUES (3, 'CounterStrike', 2);
INSERT INTO GAME(id, name, developer_id)
VALUES (4, 'Fiksing', 3);
INSERT INTO GAME(id, name, developer_id)
VALUES (5, 'Lol', 1);
INSERT INTO GAME(id, name, developer_id)
VALUES (6, 'MoreThanBarny', 4);
INSERT INTO GAME(id, name, developer_id)
VALUES (7, 'ShleemyHeroes', 5);
INSERT INTO GAME(id, name, developer_id)
VALUES (8, 'CardBattles', 1);
INSERT INTO GAME(id, name, developer_id)
VALUES (9, 'VVV', 2);
INSERT INTO GAME(id, name, developer_id)
VALUES (10, 'HoneyHunt', 4);


-- Comment_
INSERT INTO Comment_(id, text, user_id, game_id)
VALUES (1, 'Nice', 2, 10);
INSERT INTO Comment_(id, text, user_id, game_id)
VALUES (2, 'Foooooooooooooooooo', 1, 4);
INSERT INTO Comment_(id, text, user_id, game_id)
VALUES (3, 'The best!!!', 3, 2);


-- Game_Ratings
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 1, 10);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 1, 4);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 1, 2);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 1, 5);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 1, 3);

INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 2, 3);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 2, 5);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 2, 2);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 2, 10);

INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 3, 4);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 3, 2);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 3, 3);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 3, 10);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (-1, 3, 1);
INSERT INTO Game_Ratings(rate, user_id, game_id)
VALUES (1, 3, 7);


-- Platform
INSERT INTO Platform(id, name)
VALUES (1, 'windows');
INSERT INTO Platform(id, name)
VALUES (2, 'mac');
INSERT INTO Platform(id, name)
VALUES (3, 'linux');


-- Game_Platform
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (1, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (1, 3);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (2, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (3, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (3, 2);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (3, 3);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (4, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (5, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (5, 2);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (6, 3);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (7, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (7, 2);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (7, 3);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (8, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (8, 2);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (9, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (10, 1);
INSERT INTO Game_Platform(game_id, platform_id)
VALUES (10, 3);

-- Game_Genre
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (1, 2);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (2, 3);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (3, 2);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (4, 2);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (5, 1);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (6, 4);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (7, 1);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (8, 3);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (9, 1);
INSERT INTO Game_Genre(game_id, genre_id)
VALUES (10, 2);

