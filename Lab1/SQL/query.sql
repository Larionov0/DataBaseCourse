-- Query1: Вивести кількість ігор по кожному розробнику.
SELECT Developer.id, Developer.name, COUNT(Game.id) counts
FROM Developer Join Game
ON Developer.id = Game.developer_id
GROUP BY 
    Developer.id, Developer.name
ORDER BY 
    counts DESC;


-- Query2: Вивести топ ігор за відношенням кількості позитивних оцінок до негативних.
SELECT Game.id game_id, Game.name, positive_ratings, negative_ratings, ROUND(positive_ratings / negative_ratings, 3) as ratio, ROUND(100 * positive_ratings / (positive_ratings + negative_ratings), 3) as percentage_of_positive
FROM Game
ORDER BY
    ratio DESC;


-- Query3: Вивести топ платформ за кількістю розроблених ігор
SELECT platform.name, count(game.id) as count_of_games
FROM Platform
JOIN PlatformApp
ON Platform.id = PlatformApp.platform_id
JOIN Game
ON PlatformApp.game_id = Game.id
GROUP BY
    platform.name
ORDER BY 
    count_of_games DESC;
    