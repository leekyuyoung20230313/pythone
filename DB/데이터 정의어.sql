drop table newbook;
-- create table
create table newbook(
bookid NUMBER,
bookname varchar2(20),
publisher varchar2(20),
price NUMBER DEFAULT 1000 check(price>1000),
PRIMARY key (bookid)
);
--������ ���� �Ӽ��� ���� NewCustomer ���̺��� �����Ͻÿ�	
-- 	 custid(����ȣ) 	- NUMBER, �⺻Ű
--	 name(�̸�) 	? VARCHAR2(40)
--	 address(�ּ�) 	? VARCHAR2(40)
--	 phone(��ȭ��ȣ) 	? VARCHAR2(30)
drop table newcustomer;
create table NewCustomer(
    custid NUMBER PRIMARY key,
    custname VARCHAR2(40),
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

create table neworder(
    orderid NUMBER,
    custid NUMBER,
    bookid NUMBER,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY key(orderid),
    FOREIGN KEY( custid) references NewCustomer(custid),
    FOREIGN KEY( bookid) references newbook(bookid)
);

-- alter table  ����
-- newbook2�� ������ ���� ����
--bookid  number
--bookname varchar2(20)
--publisher varchar2(20)
--price number
create table newbook2(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);
-- varchar2(13) �ڷ����� ���� isbn �Ӽ��� �߰�
alter table newbook2 add isbn varchar2(13);
select * from newbook2;

--isbn �Ӽ��� ������ Ÿ���� number������ ����
alter table newbook2 MODIFY isbn number;

--isbn �Ӽ��� ������ Ÿ���� ����
alter table newbook2 drop COLUMN isbn;
select * from newbook2;

--bookid�Ӽ��� not null ���������� ����
alter table newbook2 modify bookid number not null;

-- bookid�� �⺻Ű�� ����
alter table newbook2 add primary key(bookid);

-- book ���̺� �����͸� ����  ������ ����, �Ѽ����м���,90000
-- INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));

