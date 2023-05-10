-- 판매된 도서에 대한 이익을 계산  15000 이상이면 10%  미만이면 5%
select 
b.bookname, o.saleprice,
case
    when o.saleprice>=15000 then o.saleprice*0.1
    else o.saleprice*0.05
end interest
from orders o, book b
where o.bookid = b.bookid
;


select 
b.bookname, o.saleprice,
fnc_interest(o.saleprice) interest
from orders o, book b
where o.bookid = b.bookid
;

-- 프로시져 생성 : insertbook을 참고해서 새로 고객을등록하는 프로시져를만들고 
select DISTINCT column_name from all_tab_columns where table_name = 'CUSTOMER';
-- 고객이 등록되면 자동으로 히스토리를 쌓기위해서 트리거를 하나 등록 customer_log 테이블 생성
-- 함수를 이용해서 고객테이블에 주소에 영국이 포함되면 국가를 영국으로 표시하고.. 대한민국이면 한국으로...표시하는
-- 함수를 작성


-- 오라클에서 테이블을 복사하는방법
-- 1. 테이블구조와 데이터 - 찾아서 구현
create TABLE customer_log2 as
select * from customer
;
select * from customer_log2;
-- 2. 테이블 구조만 복사 - 찾아서 구현
create TABLE customer_log as
select * from customer where 1=0;
select * from customer_log;

-- customer 데이터를 삽입
exec ps_insertcustomer('홍길동','영국 멘체스터','000-1111-2222');
select * from customer;
select * from customer_log;

-- 함수
select 
custid,
name,
address,
phone,
FNC_SHORTADDRESS(address) national
--case
--    when address like '%영국%' then '영국'
--    when address like '%대한민국%' then '한국'
--    when address like '%미국%' then '미국'
--    else address    
--end national
from customer
;
