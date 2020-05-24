-- Перевірка процедури
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.enable;
    games_package.delete_comment(game_id=>2, comment_id=>3);  -- Видалить коментар
    games_package.delete_comment(game_id=>2, comment_id=>3);  -- Comment 3 not found - Не видалить - бо вже видалений
    games_package.delete_comment(game_id=>15, comment_id=>3);  -- Game 15 not found - Не видалить - немає такої функції
END;


-- Перевірка функції
SELECT * FROM TABLE(games_package.get_games_with_ratings(0, 0));  -- всі ігри
SELECT * FROM TABLE(games_package.get_games_with_ratings(1, 0));  -- всі ігри з мінімум 1 лайком
SELECT * FROM TABLE(games_package.get_games_with_ratings(2, 1));  -- всі ігри з мінімум 2 лайками і мінімум 1 дизлайком
SELECT * FROM TABLE(games_package.get_games_with_ratings(0, 2));  -- всі ігри з мінімум 2 дизлайками


-- Перевірка триггеру  (не забути запустити код генерації тригера trigger.sql)
UPDATE Game_Ratings
SET Game_Ratings.rate = -1  -- встановлюэмо від'ємне значення
WHERE Game_Ratings.user_id=1 AND Game_Ratings.game_id=10;

SELECT Game_Ratings.rate FROM Game_Ratings
WHERE Game_Ratings.user_id=1 AND Game_Ratings.game_id=10;  -- після оновлення має прийняти значення 0, замість -1
