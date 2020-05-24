CREATE OR REPLACE PACKAGE games_package IS
    TYPE gamerow_type IS RECORD (
        id                 INTEGER,
        name               VARCHAR(60),
        positive_ratings   INTEGER,
        negative_ratings   INTEGER
    );

    TYPE tableofgames IS
        TABLE OF gamerow_type;

    FUNCTION get_games_with_ratings (
        min_amount_of_positive   INT DEFAULT 0,
        min_amount_of_negative   INT DEFAULT 0
    ) RETURN tableofgames
        PIPELINED;

    PROCEDURE delete_comment(game_id INTEGER, comment_id INTEGER);
END games_package;
/
CREATE OR REPLACE PACKAGE BODY games_package IS

    FUNCTION get_games_with_ratings (    -- Функція, що повертає таблицю з тими іграми, чия кількість лайків і дизлайків більше за задані значення
    -- Довелося змінити код Вью з 3 воркшопу, бо він не підходив для нової моделі бази даних.
        min_amount_of_positive   INT DEFAULT 0,
        min_amount_of_negative   INT DEFAULT 0
    ) RETURN tableofgames
        PIPELINED
    IS
    BEGIN
        FOR games_iterator IN (
            SELECT
                tab1.id                 id,
                tab1.name               name,
                tab1.positive_ratings   positive_ratings,
                tab2.negative_ratings   negative_ratings
            FROM
                (
                    SELECT
                        game.id,
                        game.name,
                        COUNT(game_ratings.rate) positive_ratings
                    FROM
                        game left
                        JOIN game_ratings ON game_ratings.game_id = game.id
                                             AND game_ratings.rate = 1
                    GROUP BY
                        game.id,
                        game.name
                ) tab1
                JOIN (
                    SELECT
                        game.id,
                        COUNT(game_ratings.rate) negative_ratings
                    FROM
                        game left
                        JOIN game_ratings ON game_ratings.game_id = game.id
                                             AND game_ratings.rate = -1
                    GROUP BY
                        game.id
                ) tab2 ON tab1.id = tab2.id
            ORDER BY
                tab1.id
        )
        LOOP
            IF games_iterator.positive_ratings >= min_amount_of_positive and games_iterator.negative_ratings >= min_amount_of_negative
            THEN
                PIPE ROW ( games_iterator );
            END IF;
        END LOOP;
    END;
    
    
    
    PROCEDURE delete_comment(game_id INTEGER, comment_id INTEGER)
    IS
        games_amount INTEGER;
        comments_amount INTEGER;
        game_not_found_error EXCEPTION;
        comment_not_found_error EXCEPTION;
    BEGIN
        SELECT COUNT(*)
        INTO games_amount
        FROM Game
        WHERE Game.id = game_id;
        
        IF games_amount != 1
        THEN 
            RAISE game_not_found_error;
        END IF;
        
        SELECT COUNT(*)
        INTO comments_amount
        FROM Comment_
        WHERE Comment_.id = comment_id;
        
        IF comments_amount != 1
        THEN 
            RAISE comment_not_found_error;
        END IF;
        
        DELETE FROM Comment_ WHERE Comment_.id=comment_id;
        
        EXCEPTION 
        WHEN game_not_found_error 
            THEN DBMS_OUTPUT.PUT_LINE('Game ' || TO_CHAR(game_id) || ' not found');
        WHEN comment_not_found_error 
            THEN DBMS_OUTPUT.PUT_LINE('Comment ' || TO_CHAR(comment_id) || ' not found');
    END;

END games_package;
