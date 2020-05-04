import cx_Oracle
from misc import password, api_key


def get_all_interesting_fields(filename="interesting_fields.csv"):
    headers = []
    with open(filename) as file:
        for line in file:
            headers.append(line.rstrip())

    return headers


def delete_all_quotes_in_string(string):
    new_str = ""
    for symbol in string:
        if symbol == "'":
            new_str+="\""
        else:
            new_str += symbol


def debug_print(*args):
    if DEBUG:
        print(*args)


DEBUG = True

username = 'SYSTEM'
database = 'localhost'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

all_developers = []
dev_index = 0
all_platforms = []
platform_index = 0
all_genres = []
genre_index = 0
interesting_headers = get_all_interesting_fields()
with open('steam.csv', encoding='utf-8') as csv_file:
    headers = csv_file.readline().rstrip().split(',')
    headers_indexes = {}
    for i, header in enumerate(headers):
        if header in interesting_headers:
            headers_indexes[header] = i

    assert all([header in headers_indexes for header in interesting_headers])

    n = 1
    for line in csv_file:
        debug_print(f"Analysing line {n}")
        n += 1
        try:
            game_list = line.rstrip().split(',')
            game_dict = {}
            for header in headers_indexes:
                game_dict[header] = game_list[headers_indexes[header]]

            if game_dict['developer'] not in all_developers:
                debug_print(game_dict['developer'])
                query = f"INSERT INTO Developer(id, name) VALUES ({dev_index}, '{game_dict['developer']}')"
                cursor.execute(query)
                all_developers.append(game_dict['developer'])
                current_dev_id = dev_index
                dev_index += 1
            else:
                current_dev_id = all_developers.index(game_dict['developer'])

            platforms = game_dict['platforms'].split(';')
            platforms_indexes = []
            for platform in platforms:
                if platform not in all_platforms:
                    query = f"INSERT INTO Platform(id, name) VALUES ({platform_index}, '{platform}')"
                    cursor.execute(query)
                    all_platforms.append(platform)
                    platforms_indexes.append(platform_index)
                    platform_index += 1
                else:
                    platforms_indexes.append(all_platforms.index(platform))

            genres = game_dict['genres'].split(';')
            genres_indexes = []
            for genre in genres:
                if genre not in all_genres:
                    query = f"INSERT INTO Genre(id, name) VALUES ({genre_index}, '{genre}')"
                    cursor.execute(query)
                    all_genres.append(genre)
                    genres_indexes.append(genre_index)
                    genre_index += 1
                else:
                    genres_indexes.append(all_genres.index(genre))

            try:
                query = f"INSERT INTO Game(id, name, developer_id) VALUES ({game_dict['appid']}, '{game_dict['name']}', {current_dev_id})"
                cursor.execute(query)
            except cx_Oracle.DatabaseError:
                try:
                    query = f"INSERT INTO Game(id, name, developer_id) VALUES ({game_dict['appid']}, '{delete_all_quotes_in_string(game_dict['name'].encode('utf-8', 'replace').decode('utf-8', 'ignore'))}', {current_dev_id})"
                    cursor.execute(query)
                except cx_Oracle.DatabaseError:
                    pass

            query = f"INSERT INTO Ratings(id, positive, negative) VALUES ({game_dict['appid']}, {game_dict['positive_ratings']}, {game_dict['negative_ratings']})"
            cursor.execute(query)

            for id_ in platforms_indexes:
                query = f"INSERT INTO Game_Platform(platform_id, game_id) VALUES ({id_}, {game_dict['appid']})"
                cursor.execute(query)

            for id_ in genres_indexes:
                query = f"INSERT INTO Game_Genre(game_id, genre_id) VALUES ({game_dict['appid']}, {id_})"
                cursor.execute(query)

            query = f"INSERT INTO Game_Ratings(game_id, ratings_id) VALUES ({game_dict['appid']}, {game_dict['appid']})"
            cursor.execute(query)
        except cx_Oracle.DatabaseError as e:
            debug_print("Error line :(    " + str(e))
            raise(e)
        except UnicodeEncodeError as e:
            debug_print("Error line :(    " + str(e))

connection.commit()
