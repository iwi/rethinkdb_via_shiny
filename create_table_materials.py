import rethinkdb as r

conn = r.connect(host = "db", port = "28015")

r.db('test').table_create('materials').run(conn)
