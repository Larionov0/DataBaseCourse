-- Заповнення Developer
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


-- Заповнення Genre
INSERT INTO Genre(id, name)
VALUES (1, 'MOBA');
INSERT INTO Genre(id, name)
VALUES (2, 'Action');
INSERT INTO Genre(id, name)
VALUES (3, 'Strategy');
INSERT INTO Genre(id, name)
VALUES (4, 'RPG');


-- Заповнення Game
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (1, 'Pooh', 4, 2, 5882, 236);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (2, 'FiksiBattles', 3, 3, 822, 34);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (3, 'CounterStrike', 2, 2, 15102, 811);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (4, 'Fiksing', 3, 2, 401, 2);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (5, 'Lol', 1, 1, 25122, 1236);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (6, 'MoreThanBarny', 4, 4, 1882, 1391);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (7, 'ShleemyHeroes', 5, 1, 10882, 3105);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (8, 'CardBattles', 1, 3, 1104, 97);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (9, 'VVV', 2, 1, 82, 3236);
INSERT INTO GAME(id, name, developer_id, genre_id, positive_ratings, negative_ratings)
VALUES (10, 'HoneyHunt', 4, 2, 13001, 2);


-- Заповнення Platform
INSERT INTO Platform(id, name)
VALUES (1, 'windows');
INSERT INTO Platform(id, name)
VALUES (2, 'mac');
INSERT INTO Platform(id, name)
VALUES (3, 'linux');


-- Заповнення PlatformApp
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (1, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (1, 3);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (2, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (3, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (3, 2);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (3, 3);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (4, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (5, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (5, 2);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (6, 3);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (7, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (7, 2);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (7, 3);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (8, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (8, 2);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (9, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (10, 1);
INSERT INTO PlatformApp(game_id, platform_id)
VALUES (10, 3);
