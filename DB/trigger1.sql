create or replace NONEDITIONABLE TRIGGER TRIGGER1 
AFTER INSERT ON BOOK for each ROW
BEGIN
  insert into book_log values(:new.bookid, :new.bookname, :new.publisher, :new.price);
END;
