import sqlite3

def execute_query(sql : str) -> list:
    with sqlite3.connect("my.db") as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()

with open("for_queries\\add_query_2.sql", "r") as q:
    sql = q.read()

print(execute_query(sql))