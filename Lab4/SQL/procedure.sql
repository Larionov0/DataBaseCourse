CREATE OR REPLACE PROCEDURE delete_comment(game_id INTEGER, comment_id INTEGER)
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
        RAISE game_not_found_error;
    END IF;
    
    DELETE FROM Comment_ WHERE Comment_.id=comment_id;
    
    EXCEPTION 
    WHEN game_not_found_error 
        THEN DBMS_OUTPUT.PUT_LINE('Game' || TO_CHAR(game_id) || ' not found');
    WHEN comment_not_found_error 
        THEN DBMS_OUTPUT.PUT_LINE('Comment' || TO_CHAR(comment_id) || ' not found');
END;

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.enable;
    delete_comment(game_id=>2, comment_id=>3);
END;

    