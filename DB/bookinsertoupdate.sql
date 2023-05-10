create or replace NONEDITIONABLE PROCEDURE BOOKINSERTORUPDATE 
(
  MYBOOKNAME IN VARCHAR2 
, MYPUBLISHER IN VARCHAR2 
, MYPRICE IN NUMBER 
) AS 
    cnt number;
BEGIN
  select count(*) into cnt from book where bookname like MYBOOKNAME;
  if cnt !=0 then
    update book 
    set publisher = MYPUBLISHER,
        price = MYPRICE
    where bookname like MYBOOKNAME;
  else
    insert into book(bookid, bookname,publisher,price)
    values(
        (select max(bookid)+1 from book),
        MYBOOKNAME,
        MYPUBLISHER,
        MYPRICE
    );
  end if;  
END BOOKINSERTORUPDATE;
