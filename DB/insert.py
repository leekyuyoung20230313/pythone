import dbconn
conn = dbconn.dbconnection()
cursor = conn.cursor()
sql = "insert into book values(50,'a','a',50000)"
cursor.execute(sql)
conn.commit()
print(cursor.rowcount)

