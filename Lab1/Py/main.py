import cx_Oracle
from misc import password

username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

first_query = """
SELECT Developer.id, Developer.name, COUNT(Game.id) counts
FROM Developer Join Game
ON Developer.id = Game.developer_id
GROUP BY 
    Developer.id, Developer.name
ORDER BY 
    counts DESC
"""
print("FIRST QUERY")
print(f"{'developer_id':15}|{'developer_name':15}|{'counts of games':15}")
cursor.execute(first_query)
for r in cursor:
    print('%-15d|%-15s|%-15d' % r)


second_query = """
SELECT Game.id game_id, Game.name, positive_ratings, negative_ratings, ROUND(positive_ratings / negative_ratings, 3) as ratio, ROUND(100 * positive_ratings / (positive_ratings + negative_ratings), 3) as percentage_of_positive
FROM Game
ORDER BY
    ratio DESC
"""
print("\nSECOND QUERY")
print(f"{'game_id':15}|{'game_name':15}|{'pos_ratings':11}|{'neg_ratings':11}|{'ratio':11}|{'percentage_of_positive'}")
cursor.execute(second_query)
for r in cursor:
    print('%-15d|%-15s|%-11d|%-11d|%-11d|%-15d' % r)


third_query = """
SELECT platform.name, count(game.id) as count_of_games
FROM Platform
JOIN PlatformApp
ON Platform.id = PlatformApp.platform_id
JOIN Game
ON PlatformApp.game_id = Game.id
GROUP BY
    platform.name
ORDER BY 
    count_of_games DESC
"""
print("\nTHIRD QUERY")
print(f"{'platform_name':15}|{'count_of_games':15}")
cursor.execute(third_query)
for r in cursor:
    print('%-15s|%-15s' % r)

