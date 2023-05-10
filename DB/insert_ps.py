# -*- coding: utf-8 -*-
"""
Created on Wed May 10 16:25:42 2023

@author: user
"""

# BOOKINSERTORUPDATE
# MYBOOKNAME , MYPUBLISHER, MYPRICE
import dbconn
conn = dbconn.dbconnection()
cursor = conn.cursor()

params = (
    '새로운책2',
    '한빛출판사',
    25000
    )
result = cursor.callproc('BOOKINSERTORUPDATE',params)
print(result)
conn.commit()
# db사용이 끝나면 close 해준다
cursor.close()
conn.close()