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



-- 내장함수(system function)  api  built-in function
-- customer functon  user-defined function

-- 절대값을 구하는 함수  ABS
select ABS(-100) from dual;
-- 반올림 함수
select round(3.1574,2) from dual;
-- 숫자 함수의 연산
select
custid "고객번호", round(sum(saleprice)/count(*) ) "평균금액"
from orders 
group by custid;

-- 문자열을 치환하는 함수
-- 책 제목에 축구가 포함된 도서를 농구로 변환후 출력
select replace(bookname ,'축구','농구') bookname
from book;

--length  문자열의 길이
-- 고객중에서 같은 성을 가진 사람이 몇명인지 성별 인원수
select substr('이규영',1,1) from dual;

select 
substr(name,1,1) "성",  count(*) "인원"
from customer
group by substr(name,1,1);

-- 서점은 주문일로부터 10일후 매출을 확정한다 각 주문의 확정일자를 구하시오
select 
orderid, orderdate, orderdate+10
from
orders;

-- 2020년 7월 05이후에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 출력
-- 단 주문일은 yyyy-mm-dd 요일 형태로 출력
-- TO_DATE : 문자형으로 저장된 날짜를 날짜형으로 변환
-- TO_CHAR : 날짜형을 문자형으로 변환
SELECT orderid, to_char(orderdate,'yyyy-mm-dd dy'), custid,bookid
from orders
where orderdate >= to_date('20200705','yyyymmdd')
;

-- 현재 날짜를 반환하는 함수  sysdate
select to_char(sysdate ,'yyyy-mm-dd dy hh24:mi:ss')
from dual;

-- NULL 값 처리 0, ''(빈문자) ' '(공백)과 다른 개념
-- 집계함수에서 계산시 null이 포함된 행은 빠짐
-- 해당되는 행이 하나도 없을때
select sum(saleprice) from orders where orderid = -1;   -- null
select avg(saleprice) from orders where orderid = -1;  -- null
select count(saleprice) from orders where orderid = -1;  -- 0

-- null을 확인할때는 is null( = x), is not null (<> x)

-- NVL(속성,값)   속성값이 null이면 값으로 출력
select nvl(phone,'000-0000-000') from customer;

-- rownum  조회결과의 순번을 나타냄
select 
rownum "순번",
custid,name,phone
from customer where custid > 2 ;

-- 도서중에 가장 비싼 책 3권만 출력
-- 1. 책을 가격의 오름차순으로 정렬
-- 2. 가격 top3  출력

    select
    bookid, bookname,publisher,price
    from (
        select 
        bookid, bookname,publisher,price
        from book
        order by price DESC
    )
    where rownum <=3
    ;

-- 평균 주문 금액 이하의 주문에 대해서 주문번호와 금액을 출력
select * from orders where saleprice <= (
    select avg(saleprice) from orders
)    ;
-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.
select orderid, custid, saleprice 
from orders o1
where saleprice > 
(
    select avg(saleprice) 
    from orders o2
    where o2.custid = o1.custid
)    ;

-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오
select 
sum(saleprice)
from orders o
where o.custid in (
    select custid from customer where address like '%대한민국%'
)
;

-- ALL 모두만족 
--SOME(ANY) 하나이상 만족
-- 쿼리  where 비교연산자 {all/some/any}
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액

select * from orders where saleprice > 
    All(select saleprice from orders where custid = 3)
;
-- EXIST, NOT EXIST
-- 주질의에서 부속질의로 제공된 속성의 값을 가지고 부속질의에 조건을 만족하여 값이 존재하면 참이 되고, 
-- 주질의는 해당 행의 데이터를 출력함.

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오
select
*
    from orders o
where exists (
    select *
        from customer c
    where c.address like '%대한민국%' and c.custid = o.custid
)
;
-- scalar subquery 
select
(select name from customer c where c.custid = o.custid) name,
sum(o.saleprice) saleprice
from orders o
group by o.custid
;

alter table orders add bookname varchar2(40);

update orders o
set bookname = (
    select
        b.bookname
    from book b
    where b.bookid = o.bookid
)
;
select * from orders;

alter table orders add custname varchar2(40);

update orders o
set o.custname = (
    select c.name
    from customer c
    where c.custid = o.custid
);




