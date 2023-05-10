import dbconn
conn = dbconn.dbconnection()

cursor = conn.cursor()
cursor.execute('SELECT * FROM customer')
result = cursor.fetchall()

# 결과 출력
for row in result:
    print(row)