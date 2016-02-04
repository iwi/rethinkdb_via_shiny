import rethinkdb as r

conn = r.connect(host = "db", port = "28015")

r.db_create('test').run(conn)
