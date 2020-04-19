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
x = []
y = []
for r in cursor:
    print('%-15d|%-15s|%-15d' % r)
    x.append(r[1])
    y.append(r[2])

py.plot([go.Bar(x=x, y=y)], filename='first_query', auto_open=True)
