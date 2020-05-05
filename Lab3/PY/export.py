import cx_Oracle
from misc import password, api_key
import csv

DEBUG = True

username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()


tables = "Genre", "Developer", "Game", "Platform", "Ratings", "Game_Platform", "Game_Genre", "Game_Ratings"

for table_name in tables:
    if DEBUG:
        print(f"Table {table_name}")
    query = f'SELECT * FROM {table_name}'
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]

    for row in cursor:
        if "_" in table_name:
            id = f"{row[0]}-{row[1]}"
        else:
            id = row[0]
        with open(f'{table_name}/{id}.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            for i, column in enumerate(columns):
                writer.writerow([column, row[i]])

cursor.close()
connection.close()
