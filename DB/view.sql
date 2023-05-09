-- 인라인 뷰(inline view)
-- from절에서 사용되는 subquery
-- 테이블과 같은 형태로 사용됨
-- 고객번호가 2 이하인 고객의 판매액 (결과는 고객이름과 고객별 판매액 출력)
select 
cs.name, sum(od.saleprice) total
from (
select custid,name
from customer where custid <=2
) cs, orders od
where cs.custid = od.custid
group by cs.name
;

-- 뷰(view)는 하나이상의 테이블을 합쳐서 만든 가상의 테이블
-- 장점 : 편리하다
--        보안성 : 사용자별로 필요한 데이터만 선별해서 보여줌
-- 단점 : insert update delete연산에 많은 제약이 따름 -- select용도로 사용하는 것을 권장
--        인덱스 생성이 어려움
--         원본이 변하면 같이 변함


-- book테이블에서 '축구'라는 문구가 포함된 자료만 보여주는 view
select *
from book where bookname like '%축구%'
;

-- 뷰 생성
create view vm_book
as select *
    from book
    where bookname like '%축구%';
    
select * from vm_book;    

-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회(vm_customer)
create view vm_customer
as select * from customer where address like '%대한민국%';

select * from vm_customer;

-- vm_orders
--Orders 테이블에 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후, 
-- ‘김연아’ 고객이 구입한 도서의 주문번호, 도서이름, 주문액 출력
select * from orders;
alter table orders DROP COLUMN custname;

create or replace view  vm_orders2 as
    select
    c.name name,
    b.bookname bookname
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid
;
select * from vm_orders;

-- 뷰의 수정  create or replace view
-- vm_customer  주소가 영국을 포함한 고객으로 변경

create or replace view vm_customer as
    select "CUSTID","NAME","ADDRESS","PHONE" from customer where address like '%영국%';

select * from vm_customer;


-- 삭제
drop view vm_book;
drop view vm_customer;
drop view vm_orders;

--다음에 해당하는 뷰를 작성하시오. 데이터베이스는 마당서점 데이터베이스를 이용한다.
--
--(1) 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 
--highorders 뷰를 생성하시오.
create view vm_highorders as
select 
b.bookid bookid, b.bookname bookname, c.name name, b.publisher publisher 
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid and o.saleprice>=20000
;
--(2) 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL 문을 작성하시오.
select publisher,name from VM_HIGHORDERS;
--(3) highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오. 
--삭제 후 (2)번 SQL 문을 다시 수행하시오.
create or replace view vm_highorders as
select 
b.bookid bookid, b.bookname bookname, c.name name, b.publisher publisher 
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid
;
select publisher,name from VM_HIGHORDERS;

