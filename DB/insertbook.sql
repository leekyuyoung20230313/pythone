create or replace NONEDITIONABLE PROCEDURE InsertBook 
(  
  mybookname in VARCHAR2,
  mypublisher in varchar2,
  myprice in NUMBER  
) AS 
BEGIN 
 insert into book(bookid, bookname,publisher,price)
 values(
    (select max(bookid)+1 from book),
        mybookname,mypublisher,myprice
     );
END InsertBook ;
