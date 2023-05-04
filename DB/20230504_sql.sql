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

