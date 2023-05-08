-- insert 문
-- insert into 테이블명(컬럼명) values(데이터)
-- 컬럼명을 생략하면 설계한 순서대로 데이터를 삽입
-- 컬럼을 명시하면 주어진 컬럼만 데이터 삽입
select * from book;

insert into book(bookid) values(11);

insert into book values
( (select max(bookid)+1 from book),
'스포츠의학',
'한솔의학서적',
90000)
;

-- 데이터 대량 삽입
insert into  newbook(bookid,bookname,publisher,price) select bookid,bookname,publisher,price from book;
-- 삽입도중에 컬럼크기가 안맞아서 에러발생
alter TABLE newbook MODIFY bookname varchar2(40);
-- 삽입도중에 null을 허용하지 않는 컬럼이 잇어서 null을 허용하도록 변경
alter table newbook modify bookname varchar2(40) null;

-- book테이블에 bookname null값을 찾아서 출력
select * from book where bookname is null;
-- 삭제 delete
delete from book where bookid in 
                        (
                            select bookid from book where bookname is null
                        ) ;
delete from book where bookname is null;

select bookid,bookname,publisher,price from book;

-- update 구문
--update 테이블
--set 컬럼명 = 값, 컬럼명 = 값
--where 
-- 고객번호가 5인 고객의 주소를 대한민국 부산으로 변경
update customer  
set address = (select address from customer where name = '김연아')
where custid = 5;
-- customer 에서 박세리 고객의 주소를 김연아 고객의 주소로 변경

-- delete 
-- customer 테이블에서 고객번호가 5인 고객을 삭제
delete from customer 
where custid = 5;

-- 모든 고객을 삭제
delete from customer;
-- order 테이블의 고객정보를 삭제  고객id를 가진 row를 삭제
delete from orders;

-- 모든 테이블의 데이터를 삭제
delete from orders;
delete from book;
delete from customer;


-- 1.박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- custmer, book, order
select 
DISTINCT c.name
from customer c, book b, orders o
where o.custid = c.custid and o.bookid =b.bookid and b.publisher in (
    select 
    b.publisher
    from customer c, book b, orders o
    where o.custid = c.custid and o.bookid =b.bookid and c.name ='박지성'
)
;
-- 두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름 --
select name from customer where custid in (
    select
    o.custid
    from book b inner join orders o 
        on b.bookid = o.bookid
    group by o.custid    
    having count(distinct b.publisher) >=2
)
;    
-- 전체 고객의 30% 이상이 구매한 도서 --
--select 
--o.custid, count(distinct o.bookid)
--from orders o inner join book b 
--    on o.bookid = b.bookid
--group by o.custid    
--;

-- 2.새로운 도서('스포츠세계,'대한미디어',10000)이 입고되어 상품 추가 만약 더 필요한 데이터가 잇으며 찾아보기
insert into book values
(
    (select max(bookid)+1 from book),
    '스포츠세계',
    '대한미디어',
    10000
);
-- 3.삼성당 에서 출판한 도서를 삭제
delete from book where book.publisher = '삼성당';
-- 4.이상미디어 에서 출판한 도서를 삭제

-- ORA-02292: 무결성 제약조건(SYSTEM.SYS_C007314)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from orders where bookid  in (select bookid from book where book.publisher = '이상미디어');
delete from book where book.publisher = '이상미디어';
-- 5.출판사 대한미디어가  대한출판사로 변경
update book
set publisher = '대한출판사'
where publisher = '대한미디어'
;

