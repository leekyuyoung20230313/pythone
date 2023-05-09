-- 인덱스 생성
create index ix_book on book(bookname);
create index ix_book2 on book(publisher,price);

select *
from book
where bookname = '축구';

-- 인덱스를 재 구성 alter index
alter index ix_book rebuild;

-- 삭제
drop index ix_book;
