select
*
from book
where price = (
select max(price) 
from book
)
;

-- 가장 많이 주문한 고객의 이름
-- distinct

select
*
from customer
where custid in ( 
            select 
                custid    
                from orders
                group  by custid
                HAVING count(custid) = (
                    select
                    max(cnt) maxcnt
                    from(
                        select 
                        custid,count(custid) as cnt 
                        from orders
                        group  by custid
                    )
            )
        )
;

--SELECT c.*
--FROM customer c
--JOIN orders o ON c.custid = o.custid
--WHERE EXISTS (
--SELECT 1
--FROM orders o2
--GROUP BY o2.custid
--HAVING COUNT(*) > COUNT(o.custid)
--)
--;

-- 도서를 구매한 적이 있는 고객의 이름( sub query)
select
*
from customer
where custid in (
    select
    custid
    from orders
)
;
-- 도서를 구매한 적이 있는 고객의 이름( table join- inner join)

select 
c.*
from customer c join 
    (select
        distinct custid
        from orders) o
    on c.custid = o.custid
;


-- 평균도서 가격
select
avg(price) 
from book;

-- 평균 도서 가격보다 비싼 책
select
*
from
book
where price > (select
                avg(price) 
                    from book);
-- 출판사별로 출판사의 평균도서 가격보다 비싼 도서
select
b1.* 
from
book b1
where price > (select
                avg(price)
                    from book b2
                    where b1.publisher = b2.publisher
                    );

--- 고객 정보 조회
select 
*
from customer
;
-- 주문이력이 있는 고객들(중복포함)  중요: 조인을 하면 중복데이터 발생
select distinct c.name, c.address
from orders o join customer c on o.custid = c.custid;

-- exist를 활용한 주문이력이 있는 고객(중복 x)
select
*
from customer c
where EXISTS(select * from orders o where o.custid = c.custid)
;

-- 연습문제
-- 박지성 : customer   출판사 book   구매 orders
select
count(publisher) cnt
from book where bookid in (
    select 
    bookid
    from orders
    where custid = (
        select
        custid
        from customer where name = '박지성'
    )
);

-- 박지성이 구매한 도서의 이름 가격 정가와 판매가격
-- customer      orders     book
select
b.bookname, b.price,   (b.price - o.saleprice) diff
from customer c, orders o, book b
where o.custid = c.custid and b.bookid = o.bookid and c.name='박지성'
;

-- 박지성이 구매하지 않은 도서의 이름
select
b.bookname
from book b 
where not EXISTS (
    select *
    from orders o, customer c 
    where o.bookid = b.bookid and c.custid = o.custid and c.name = '박지성'    
)
;
-- 주문하지 않은 고객의 이름  customer  order
select
c.name
from customer c
where c.custid not in (
    select o.custid from orders o where o.custid = c.custid
);
-- 주문금액의 총액과 주문의 평균 금액
select 
sum( saleprice) total, avg(saleprice) avg
from orders;

--고객의 이름과 고객별 구매액  customer  orders
select
c.name, sum(o.saleprice) total_price
from  customer c, orders o
where c.custid = o.custid
group by c.name;

-- 고객의 이름과 고객이 구매한 도서 목록
select
c.name, b.bookname
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid
;
-- 도서의 가격 과 판매가격의 차이가 가장 많은 주문
-- book  orders
select
*
from 
orders where orderid = (
    select
    o.orderid
    --,max(b.price - o.saleprice)
    from book b,orders o
    where o.bookid = b.bookid
    group by o.orderid
    having max(b.price - o.saleprice) = 
        (
        select
        max(b.price - o.saleprice)
        from book b,orders o
        where o.bookid = b.bookid
        )
)
;
-- 도서의 판매액 평균보다 각 고객의 구매액 평균이 더 높은 고객의 이름
select
    c.custid, 
    (select t.name from customer t where t.custid = c.custid) name,    
    avg(o.saleprice) avgprice
from orders o, customer c
    where o.custid = c.custid
    group by c.custid    
having avg(o.saleprice) > ( select avg(saleprice) from orders)
;

select name from customer where custid = 1;


-- 구매고객의 아이디
select
c.custid, avg(o.saleprice)
--(select t.name from customer t where t.custid = c.custid) name
from orders o, customer c
where o.custid = c.custid
group  by c.custid
having avg(o.saleprice) > (select avg(saleprice) from orders)
;

select avg(saleprice) from orders;  --saleprice


select t.name from customer t where t.custid = 3;

