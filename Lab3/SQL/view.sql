CREATE OR REPLACE VIEW GamesWithRatings AS
    SELECT
        Game.id,
        Game.name,
        Ratings.positive,
        Ratings.negative
    FROM
        Game
        JOIN Game_Ratings ON Game.id = Game_Ratings.game_id
        JOIN Ratings ON Game_Ratings.ratings_id = Ratings.id;
