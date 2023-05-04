select
*
from book
where price = (
select max(price) 
from book
)
;

-- ���� ���� �ֹ��� ���� �̸�
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

-- ������ ������ ���� �ִ� ���� �̸�( sub query)
select
*
from customer
where custid in (
    select
    custid
    from orders
)
;
-- ������ ������ ���� �ִ� ���� �̸�( table join- inner join)

select 
c.*
from customer c join 
    (select
        distinct custid
        from orders) o
    on c.custid = o.custid
;

