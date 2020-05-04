import cx_Oracle
from misc import password, api_key


username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

query = "INSERT INTO DEVELOPER(id, name) VALUES (1, 'PyTest')"
cursor.execute(query)
connection.commit()
