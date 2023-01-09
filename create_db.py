import sqlite3
import os

default = "create_tables.sql"

def create_db():
    with open(os.path.join(os.getcwd(), default)) as f:
        sql = f.read()
        
    with sqlite3.connect("my.db") as con:
        cur = con.cursor()
        cur.executescript(sql)
        
if __name__ == "__main__":
    create_db()