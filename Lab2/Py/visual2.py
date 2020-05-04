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

second_query = """
SELECT Game.id game_id, Game.name, positive_ratings, negative_ratings, ROUND(positive_ratings / negative_ratings, 3) as ratio, ROUND(100 * positive_ratings / (positive_ratings + negative_ratings), 3) as percentage_of_positive
FROM Game
ORDER BY
    ratio DESC
"""
print("SECOND QUERY")
print(f"{'game_id':15}|{'game_name':15}|{'pos_ratings':11}|{'neg_ratings':11}|{'ratio':11}|{'percentage_of_positive'}")
cursor.execute(second_query)

x = []
y = []
for r in cursor:
    print('%-15d|%-15s|%-11d|%-11d|%-11d|%-15d' % r)
    x.append(r[1])
    y.append(r[-1])

py.plot([go.Pie(labels=x, values=y, title='percentage of positive ratings')], filename='second_query', auto_open=True)
