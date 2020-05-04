import cx_Oracle
from misc import password, api_key
import chart_studio
import plotly.graph_objs as go
import chart_studio.plotly as py

chart_studio.tools.set_credentials_file(username='larionov', api_key=api_key)

username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()


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
x = []
y = []
for r in cursor:
    print('%-15s|%-15s' % r)
    x.append(r[0])
    y.append(r[1])

py.plot([go.Scatter(x=x, y=y, name='platforms and counts of games')], filename='third_query', auto_open=True)
