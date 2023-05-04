drop table newbook;
-- create table
create table newbook(
bookid NUMBER,
bookname varchar2(20),
publisher varchar2(20),
price NUMBER DEFAULT 1000 check(price>1000),
PRIMARY key (bookid)
);
--다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오	
-- 	 custid(고객번호) 	- NUMBER, 기본키
--	 name(이름) 	? VARCHAR2(40)
--	 address(주소) 	? VARCHAR2(40)
--	 phone(전화번호) 	? VARCHAR2(30)
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

-- alter table  수정
-- newbook2를 다음과 같이 생성
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
-- varchar2(13) 자료형을 가진 isbn 속성을 추가
alter table newbook2 add isbn varchar2(13);
select * from newbook2;

--isbn 속성의 데이터 타입을 number형으로 변경
alter table newbook2 MODIFY isbn number;

--isbn 속성의 데이터 타입을 삭제
alter table newbook2 drop COLUMN isbn;
select * from newbook2;

--bookid속성에 not null 제약조건을 적용
alter table newbook2 modify bookid number not null;

-- bookid를 기본키로 변경
alter table newbook2 add primary key(bookid);

-- book 테이블에 데이터를 삽입  스포츠 의학, 한솔의학서적,90000
-- INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));

