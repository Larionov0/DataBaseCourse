import plotly.graph_objs as go
import cx_Oracle
from misc import password, api_key
import chart_studio
import chart_studio.plotly as py


chart_studio.tools.set_credentials_file(username='larionov', api_key=api_key)

username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()


# Вивести кількість ігор по кожному розробнику. Стовпчикова діаграма.

first_query = """
SELECT * FROM
    (
    SELECT Developer.id, Developer.name, COUNT(Game.id) counts
    FROM Developer 
    Join Game ON Developer.id = Game.developer_id
    GROUP BY 
        Developer.id, Developer.name
    ORDER BY 
        counts DESC
    )
where ROWNUM <= 50
"""


# Вивести топ ігор за відношенням кількості позитивних оцінок до загальної кількості оцінок.

second_query = """
SELECT * FROM
    (
    SELECT 
        GamesWithRatings.id game_id, 
        GamesWithRatings.name name, 
        GamesWithRatings.positive positive, 
        GamesWithRatings.negative negative, 
        ROUND(GamesWithRatings.positive / nullif(GamesWithRatings.negative, 0), 3) as ratio, 
        ROUND(100 * positive / nullif(positive + negative, 0), 3) as percentage_of_positive
    FROM 
        GamesWithRatings  -- VIEW
    WHERE positive > 100
    ORDER BY
        ratio DESC
    )
where ROWNUM <= 50
"""


# Вивести топ платформ за кількістю розроблених ігор

third_query = """
SELECT * FROM 
    (
    SELECT platform.name, count(game.id) as count_of_games
    FROM Platform
    JOIN Game_Platform ON Platform.id = Game_Platform.platform_id
    JOIN Game
    ON Game_Platform.game_id = Game.id
    GROUP BY
        platform.name
    ORDER BY 
        count_of_games DESC
    )
WHERE ROWNUM <= 50
"""

# --- 1
cursor.execute(first_query)
x = []
y = []
for r in cursor:
    x.append(r[1])
    y.append(r[2])

fig = go.Figure(
    data=[go.Bar(x=x, y=y, name='топ платформ за кількістю розроблених ігор')],
    layout_title_text="query1"
)

py.plot(fig, filename='query1.html', auto_open=True)
# fig.write_html('query1.html', auto_open=True)


# --- 2
cursor.execute(second_query)

x = []
y = []
for r in cursor:
    x.append(r[1])
    y.append(r[-1])

fig = go.Figure(
    data=[go.Pie(labels=x, values=y, name='топ ігор за відношенням кількості позитивних оцінок до загальної кількості оцінок')],
    layout_title_text="query2"
)


py.plot(fig, filename='query2.html', auto_open=True)
# fig.write_html('query2.html', auto_open=True)


# --- 3
cursor.execute(third_query)
x = []
y = []
for r in cursor:
    x.append(r[0])
    y.append(r[1])

fig = go.Figure(
    data=[go.Scatter(x=x, y=y, name='топ платформ за кількістю розроблених ігор')],
    layout_title_text="query3"
)

py.plot(fig, filename='query3.html', auto_open=True)
# fig.write_html('query3.html', auto_open=True)
