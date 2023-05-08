/**********************************************************
*  Department 테이블 견본 데이터
***********************************************************/
INSERT INTO Department VALUES ('대학','대학본부',      '765-4000');
INSERT INTO Department VALUES ('컴공','컴퓨터공학과',  '765-4100');
INSERT INTO Department VALUES ('정통','정보통신공학과','765-4200');
INSERT INTO Department VALUES ('경영','경영학과',      '765-4400');
INSERT INTO Department VALUES ('행정','세무행정학과',  '765-4500');

/**********************************************************
*  Student 테이블 견본 데이터
***********************************************************/
INSERT INTO Student  VALUES ('컴공','3','C1601','한영삼','000708-3******','부산시 동래구',  '010-7999-0101', 'c1601@cyber.ac.kr', Null,'2016/02/26');
INSERT INTO Student  VALUES ('컴공','3','C1602','서희경','990205-2******','서울시 영등포구','010-4333-0707', 'c1602@cyber.ac.kr', Null,'2016/02/26');
INSERT INTO Student  VALUES ('컴공','2','C1701','이정민','011109-4******','대구시 수성구',  Null,            'c1701@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('컴공','2','C1702','박주영','020917-3******','경남 진해시',   '010-8555-1616',  'c1702@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('정통','2','T1702','이정필','001117-3******','충남 천안시',    Null,            't1702@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('경영','2','B1701','배상문','961225-1******','대전시 동구읍',  Null,            'b1701@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('행정','1','A1701','이미나','001217-4******','전남 광양시',    '010-3888-5050',  Null,               Null,'2017/03/02');
INSERT INTO Student  VALUES ('컴공','1','C1801','김대현','020121-3******','서울시 송파구',  '010-3932-9999', 'c1801@cyber.ac.kr', Null,'2018/02/28');
INSERT INTO Student  VALUES ('컴공','1','C1802','신지애','020521-4******','대전시 대덕구',  '010-6343-8838', 'c1802cyber.ac.kr',  'H', '2018/02/28');
INSERT INTO Student  VALUES ('정통','1','T1801','김병호','991124-1******','대구시 달서구',  '011-1222-0303',  Null,               Null,'2018/02/28');
INSERT INTO Student  VALUES ('경영','1','B1801','김빛나','030422-4******','서울시 은평구',  Null,             Null,               Null,'2018/02/28');

/**********************************************************
*  Professor 테이블 견본 데이터
***********************************************************/
INSERT INTO Professor VALUES ('P00', '서한식', '총장',   '대학','765-4000','hsseo@cyber.ac.kr', '총장',    NULL);
INSERT INTO Professor VALUES ('P11', '신기술', '교수',   '컴공','765-4111','ksshin@cyber.ac.kr','학과장', 'P00');
INSERT INTO Professor VALUES ('P12', '이대호', '부교수', '컴공','765-4112','dhlee@cyber.ac.kr',  Null,    'P11');
INSERT INTO Professor VALUES ('P13', '유소연', '조교수', '컴공','765-4113','syyoo@cyber.ac.kr',  Null,    'P11');
INSERT INTO Professor VALUES ('P21', '박지성', '부교수', '정통','765-4211','jspark@cyber.ac.kr','학과장', 'P00');
INSERT INTO Professor VALUES ('P22', '김하늘', '부교수', '정통','765-4212','hnkim@cyber.ac.kr',  Null,    'P21');
INSERT INTO Professor VALUES ('P23', '이상혁', '조교수', '정통','765-4213','shlee@cyber.ac.kr',  Null,    'P21');
INSERT INTO Professor VALUES ('P24', '최경주', '조교수', '정통','765-4214','kjchoi@cyber.ac.kr', Null,    'P21');
INSERT INTO Professor VALUES ('P41', '안연홍', '부교수', '경영','765-4411','yhahn@cyber.ac.kr', '학과장', 'P00');
INSERT INTO Professor VALUES ('P51', '함영애', '부교수', '행정','765-4511','yaham@cyber.ac.kr', '학과장', 'P00');

/**********************************************************
*  Course 테이블 견본 데이터
***********************************************************/
INSERT INTO Course VALUES ('L0011','TOEIC연구',     2, Null,Null);
INSERT INTO Course VALUES ('L0012','문학과 여행',   2, Null,Null);
INSERT INTO Course VALUES ('L0013','문학개론',      2, Null,Null);
INSERT INTO Course VALUES ('L1011','컴퓨터구조',    2,'P11',Null);
INSERT INTO Course VALUES ('L1012','웹디자인',      2, Null,20000);
INSERT INTO Course VALUES ('L1021','데이터베이스',  2,'P12',Null);
INSERT INTO Course VALUES ('L1022','정보통신개론',  2,'P21',Null);
INSERT INTO Course VALUES ('L1031','SQL',           3,'P12',30000);
INSERT INTO Course VALUES ('L1032','자바프로그래밍',3,'P13',Null);
INSERT INTO Course VALUES ('L1041','컴퓨터네트워크',2,'P21',Null);
INSERT INTO Course VALUES ('L1042','Delphi',        3,'P13',50000);
INSERT INTO Course VALUES ('L1051','웹서버관리',    2,'P11',Null);
INSERT INTO Course VALUES ('L1052','전자상거래',    3,'P22',30000);
INSERT INTO Course VALUES ('L2031','게임이론',      3,'P23',50000);
INSERT INTO Course VALUES ('L2061','스프링프레임워크',3, Null,50000);

/**********************************************************
*  SG_Scores 테이블 견본 데이터
***********************************************************/
INSERT INTO SG_Scores VALUES ('C1601','L1011',  93, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L1021', 105, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L0011',  68, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L1031',  82, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1601','L1032',  78, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1601','L1041',  87, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1601','L1051',  87, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1602','L0011',  98, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1011',  87, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1021',  98, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1031',  94, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1602','L1041',  77, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1602','L1051',  77, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1701','L1011',  97, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1701','L1021',  96, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1701','L1031',  96, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1022',  97, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1042',  83, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1032',  93, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1701','L1051',  89, Null, '2018/06/29'); 
INSERT INTO SG_Scores VALUES ('C1702','L1011',  89, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1702','L1021',  96, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1702','L1031',  86, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1022',  87, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1042',  98, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1032',  97, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1702','L1051',  84, Null, '2018/06/29'); 
INSERT INTO SG_Scores VALUES ('C1801','L1031',  85, Null, '2018/06/27');
INSERT INTO SG_Scores VALUES ('C1802','L1031',  77, Null, '2018/06/27');
INSERT INTO SG_Scores VALUES ('C1701','L2061',Null, Null, '2018/08/26');
INSERT INTO SG_Scores VALUES ('C1702','L2061',Null, Null, '2018/08/26');
INSERT INTO SG_Scores VALUES ('C1601','L2061',Null, Null, '2018/08/26'); 
INSERT INTO SG_Scores VALUES ('C1602','L2061',Null, Null, '2018/08/26'); 

/**********************************************************
*  T_Course 테이블 견본 데이터
***********************************************************/
INSERT INTO T_Course VALUES ('L1031','SQL응용',       3,'P12',50000);
INSERT INTO T_Course VALUES ('L1032','JAVA',          3,'P13',30000);
INSERT INTO T_Course VALUES ('L1043','JSP프로그래밍', 3, NULL,50000);
INSERT INTO T_Course VALUES ('L2033','게임프로그래밍',3,'P24',40000);
INSERT INTO T_Course VALUES ('L4011','경영정보시스템',3,'P41',30000);
INSERT INTO T_Course VALUES ('L4012','세무행정학',    3,'P51',50000);

/**********************************************************
*  Course_Grade 테이블 견본 데이터
***********************************************************/
INSERT INTO SCORE_GRADE VALUES (95,100,'A+');
INSERT INTO SCORE_GRADE VALUES (90, 94,'A ');
INSERT INTO SCORE_GRADE VALUES (85, 89,'B+');
INSERT INTO SCORE_GRADE VALUES (80, 84,'B ');
INSERT INTO SCORE_GRADE VALUES (75, 79,'C+');
INSERT INTO SCORE_GRADE VALUES (70, 74,'C ');
INSERT INTO SCORE_GRADE VALUES (65, 69,'D+');
INSERT INTO SCORE_GRADE VALUES (60, 64,'D ');
INSERT INTO SCORE_GRADE VALUES ( 0, 59,'F ');

COMMIT;

/**********************************************************
*  학과(Department) 테이블 검색
***********************************************************/
SELECT * FROM Department;
/
