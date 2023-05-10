# -*- coding: utf-8 -*-
"""
Created on Tue May  9 17:52:32 2023

@author: user
"""

def dbconnection(host = "192.168.10.125",
                 port = 1521,
                 sid = "xe",
                 username = "system",
                 password = "admin"
):
    import cx_Oracle
    # 데이터베이스 연결 정보
    host = host
    port = port
    sid = sid
    username = username
    password = password
    
    # 데이터베이스 연결 생성
    dsn = cx_Oracle.makedsn(host, port, sid=sid)
    print(dsn)
    connection = cx_Oracle.connect(username, password, dsn)
    
    # 데이터베이스 연결 테스트
    print(f"연결된 버전은 {connection.version}")    
    return connection


if __name__ == '__main__':
    # 쿼리 실행
    connection = dbconnection();
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM book')
    result = cursor.fetchall()
    
    # 결과 출력
    for row in result:
        print(row)