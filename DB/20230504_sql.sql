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


-- ��յ��� ����
select
avg(price) 
from book;

-- ��� ���� ���ݺ��� ��� å
select
*
from
book
where price > (select
                avg(price) 
                    from book);
-- ���ǻ纰�� ���ǻ��� ��յ��� ���ݺ��� ��� ����
select
b1.* 
from
book b1
where price > (select
                avg(price)
                    from book b2
                    where b1.publisher = b2.publisher
                    );

--- �� ���� ��ȸ
select 
*
from customer
;
-- �ֹ��̷��� �ִ� ����(�ߺ�����)  �߿�: ������ �ϸ� �ߺ������� �߻�
select distinct c.name, c.address
from orders o join customer c on o.custid = c.custid;

-- exist�� Ȱ���� �ֹ��̷��� �ִ� ��(�ߺ� x)
select
*
from customer c
where EXISTS(select * from orders o where o.custid = c.custid)
;

-- ��������
-- ������ : customer   ���ǻ� book   ���� orders
select
count(publisher) cnt
from book where bookid in (
    select 
    bookid
    from orders
    where custid = (
        select
        custid
        from customer where name = '������'
    )
);

-- �������� ������ ������ �̸� ���� ������ �ǸŰ���
-- customer      orders     book
select
b.bookname, b.price,   (b.price - o.saleprice) diff
from customer c, orders o, book b
where o.custid = c.custid and b.bookid = o.bookid and c.name='������'
;

-- �������� �������� ���� ������ �̸�
select
b.bookname
from book b 
where not EXISTS (
    select *
    from orders o, customer c 
    where o.bookid = b.bookid and c.custid = o.custid and c.name = '������'    
)
;
-- �ֹ����� ���� ���� �̸�  customer  order
select
c.name
from customer c
where c.custid not in (
    select o.custid from orders o where o.custid = c.custid
);
-- �ֹ��ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select 
sum( saleprice) total, avg(saleprice) avg
from orders;

--���� �̸��� ���� ���ž�  customer  orders
select
c.name, sum(o.saleprice) total_price
from  customer c, orders o
where c.custid = o.custid
group by c.name;

-- ���� �̸��� ���� ������ ���� ���
select
c.name, b.bookname
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid
;
-- ������ ���� �� �ǸŰ����� ���̰� ���� ���� �ֹ�
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
-- ������ �Ǹž� ��պ��� �� ���� ���ž� ����� �� ���� ���� �̸�
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


-- ���Ű��� ���̵�
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

