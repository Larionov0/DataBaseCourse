import cx_Oracle
from misc import password

username = 'SYSTEM'
database = 'localhost/xe'

connection = cx_Oracle.connect(username, password, database)

query = "SELECT 'Hello world:)' FROM Dual"

cursor = connection.cursor()

cursor.execute(query)

result = cursor.fetchone()
print(result)
