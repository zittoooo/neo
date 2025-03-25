-- USER SQL
CREATE USER "SHOP" IDENTIFIED BY "1234"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER "SHOP" QUOTA 10M ON "USERS";

-- ROLES
GRANT "CONNECT" TO "SHOP" ;
GRANT "RESOURCE" TO "SHOP" ;

-- SYSTEM PRIVILEGES

 CREATE TABLE "SHOP"."MEMBERTBL" 
   (	"MEMBERID" CHAR(8) NOT NULL ENABLE, 
	"MEMBERNAME" NCHAR(5) NOT NULL ENABLE, 
	"MEMBERADDRESS" NVARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);

INSERT INTO "SHOP"."MEMBERTBL" (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('Dang', N'당탕이', N'경기 부천시 중동');
INSERT INTO "SHOP"."MEMBERTBL" (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('Jee', N'지운이', N'서울 은평구 중산동');
INSERT INTO "SHOP"."MEMBERTBL" (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('Han', N'한지연', N'인천 남구 주안동');
INSERT INTO "SHOP"."MEMBERTBL" (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('Sang', N'상길이', N'경기 성남시 분당구');




  CREATE TABLE "SHOP"."PRODUCTTBL" 
   (	"PRODUCTNAME" NCHAR(4) NOT NULL ENABLE, 
	"COST" NUMBER(7,0) NOT NULL ENABLE, 
	"MAKEDATE" DATE, 
	"COMPANY" NCHAR(5), 
	"AMOUNT" NUMBER(3,0) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);

INSERT INTO "SHOP"."PRODUCTTBL" (PRODUCTNAME, COST, MAKEDATE, COMPANY, AMOUNT) VALUES (N'컴퓨터', '10', TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'삼성', '17');
INSERT INTO "SHOP"."PRODUCTTBL" (PRODUCTNAME, COST, MAKEDATE, COMPANY, AMOUNT) VALUES (N'세탁기', '20', TO_DATE('2018-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'LG', '3');
INSERT INTO "SHOP"."PRODUCTTBL" (PRODUCTNAME, COST, MAKEDATE, COMPANY, AMOUNT) VALUES (N'냉장고', '5', TO_DATE('2019-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'대우', '22');



CREATE TABLE shop.indextbl
AS
	SELECT first_name, last_name, hire_date
	FROM hr.employees;




SELECT * FROM hr.EMPLOYEES e  WHERE e.FIRST_NAME = 'Jack';
SELECT * FROM shop.indextbl WHERE first_name = 'Jack';
CREATE INDEX idx_indextbl_firstname ON shop.indextbl(first_name);




CREATE VIEW shop.membertbl_view
AS
	SELECT membername, memberaddress
	FROM shop.membertbl;


SELECT * FROM shop.membertbl_view


INSERT INTO shop.membertbl values('Figure', '연아', '경기도 군포시 당정');
SELECT * FROM shop.membertbl;
DELETE FROM shop.membertbl WHERE membername='연';



CREATE TABLE deletedmembertbl (
	memberid char(8),
	membername nchar(5),
	memberaddress nvarchar2(20),
	deleteDate DATE -- deleted DATE...
);


## create trigger..

CREATE TRIGGER trg_deletedmembertbl
	AFTER DELETE
	ON membertbl
	FOR EACH ROW
BEGIN
	INSERT INTO deletedmembertbl
	VALUES
		(:OLD.memberid, :OLD.membername, :OLD.memberaddress, SYSDATE());
END;




CREATE TABLE user1tbl (
	userid char(8) NOT NULL,
	username nvarchar2(20) NOT NULL,
	birthyear number(4) NOT NULL,
	addr nchar(2) NOT NULL,
	mobile1 char(3),
	mobile2 char(8),
	height number(3),
	mdate	date
);


insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-7-7');
insert into usertbl values('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-9-9');
insert into usertbl values('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');

SELECT * FROM usertbl;
SELECT count(*) FROM usertbl;


CREATE TABLE buy1tbl (
	idnum number(8) NOT NULL,
	userid char(8) NOT NULL,
	prodname nchar(8) NOT NULL,
	groupname nchar(4),
	price NUMBER(8) NOT NULL,
	amount number(3) NOT NULL,
	usertbl_userid char(8) NOT NULL
);

CREATE SEQUENCE idseq;

insert into buytbl values(idseq.nextval, 'KBS', '운동화', NULL, 30, 2);
insert into buytbl values(idseq.nextval, 'KBS', '노트', '전자', 1000, 1);
insert into buytbl values(idseq.nextval, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(idseq.nextval, 'BBK', '모니터', '전자', 200, 5);
insert into buytbl values(idseq.nextval, 'KBS', '청바지', '의류', 50, 3);
insert into buytbl values(idseq.nextval, 'BBK', '메모리', '전자', 80, 10);
insert into buytbl values(idseq.nextval, 'SSK', '책', '서적', 15, 5);
insert into buytbl values(idseq.nextval, 'EJW', '책', '서적', 15, 2);
insert into buytbl values(idseq.nextval, 'EJW', '청바지', '의류', 50, 1);
insert into buytbl values(idseq.nextval, 'BBK', '운동화', NULL, 30, 2);
insert into buytbl values(idseq.nextval, 'EJW', '책', '서적', 15, 1);
insert into buytbl values(idseq.nextval, 'BBK', '운동화', NULL, 30, 2);




SELECT * FROM buytbl;
SELECT count(*) FROM buytbl;
SELECT * FROM usertbl WHERE username='김경호';
SELECT userid, username from usertbl WHERE birthyear >= 1970 AND height >= 182;
SELECT userid, username from usertbl WHERE height BETWEEN 178 AND 182;
SELECT userid, username from usertbl WHERE addr='경남' OR addr='전남' OR addr='경북';
SELECT userid, username from usertbl WHERE addr IN ('경남', '전남', '경북');

SELECT username, height FROM usertbl WHERE 





SELECT * FROM usertbl;
CREATE TABLE buytbl2 AS (SELECT * FROM buytbl);
SELECT * FROM buytbl2;
CREATE TABLE buytbl3 AS (SELECT userid, prodname FROM buytbl);
SELECT * FROM buytbl3;

SELECT userid AS "사용자명", sum(amount * price) AS "총구매액"
FROM buytbl
GROUP BY userid;



SELECT cast(avg(amount) AS NUMBER(5,3)) AS "평균 구매 수량"
FROM buytbl;


SELECT userid, cast(avg(amount) AS number(5,3)) AS "평균 구매 수량"
FROM buytbl
GROUP BY userid;

SELECT username, max(height), min(height)
FROM usertbl GROUP BY username;


SELECT username, height FROM USERTBL
WHERE height = (SELECT max(height) FROM usertbl)
OR height = (SELECT min(height) FROM usertbl)



SELECT count(*) FROM usertbl;


SELECT count(mobile1) AS "휴대폰 소유자" FROM USERTBL;



SELECT userid AS "사용자명", sum(amount * price) AS "총구매액"
FROM buytbl
GROUP BY userid
HAVING sum(amount * price) > 1000
ORDER BY sum(amount * price);


SELECT groupname, sum(price * amount) AS "비용"
FROM buytbl
GROUP BY  rollup(groupname)


SELECT idnum, groupname, sum(price * amount) AS "비용"
FROM buytbl
GROUP BY  rollup(groupname, idnum)





CREATE TABLE cubetbl(prodname nchar(3), color nchar(2), amount int);

INSERT INTO cubetbl values('컴퓨터', '검정', 11);
INSERT INTO cubetbl values('컴퓨터', '파랑', 22);
INSERT INTO cubetbl values('컴퓨터', '검정', 33);
INSERT INTO cubetbl values('컴퓨터', '파랑', 44);



SELECT prodname, color, sum(amount) AS "수량 합계"
FROM CUBETBL
GROUP BY prodname, color;



CREATE TABLE emptbl (emp nchar(3), manager nchar(3), department nchar(3));
INSERT INTO emptbl VALUES ('나사장', '없음', '없음');
INSERT INTO emptbl VALUES ('김재무', '나사장', '재무부');
INSERT INTO emptbl VALUES ('김부장', '김재무', '재무부');
INSERT INTO emptbl VALUES ('이부장', '김재무', '재무부');
INSERT INTO emptbl VALUES ('우대리', '이부장', '재무부');
INSERT INTO emptbl VALUES ('지사원', '이부장', '재무부');
INSERT INTO emptbl VALUES ('이영업', '나사장', '영업부');
INSERT INTO emptbl VALUES ('한과장', '이영업', '영업부');
INSERT INTO emptbl VALUES ('최정보', '나사장', '정보부');
INSERT INTO emptbl values ('윤차장', '최정보', '정보부');
INSERT INTO emptbl values ('이주임', '윤차장', '정보부');





WITH empcte(empname, mgrname, dept, emplevel)
AS
(
	(SELECT emp, manager, department, 0
	FROM emptbl
	WHERE manager='없음')
	UNION ALL
	(SELECT emptbl.emp, emptbl.manager, 
	emptbl.department, empcte.emplevel+1
	FROM emptbl INNER JOIN empcte
	ON emptbl.manager = empcte.empname)
)
SELECT * FROM empcte ORDER BY dept, emplevel;


## cte2

WITH empcte(empname, mgrname, dept, emplevel)
AS
(
	(SELECT emp, manager, department, 0
	FROM emptbl
	WHERE manager='없음')
	UNION ALL
	(SELECT emptbl.emp, emptbl.manager, 
	emptbl.department, empcte.emplevel+1
	FROM emptbl INNER JOIN empcte
	ON emptbl.manager = empcte.empname)
)
SELECT concat(rpad('ㄴ', emplevel * 2 + 1 , 'ㄴ'), 
empname) AS "직원이름",
dept AS "직원부서"
FROM empcte ORDER BY dept, emplevel; 


## cte3

WITH empcte(empname, mgrname, dept, emplevel)
AS
(
	(SELECT emp, manager, department, 0
	FROM emptbl
	WHERE manager='없음')
	UNION ALL
	(SELECT emptbl.emp, emptbl.manager, 
	emptbl.department, empcte.emplevel+1
	FROM emptbl INNER JOIN empcte
	ON emptbl.manager = empcte.empname
	WHERE emplevel < 2)
)
SELECT concat(rpad('ㄴ', emplevel * 2 + 1 , 'ㄴ'), 
empname) AS "직원이름",
dept AS "직원부서"
FROM empcte ORDER BY dept, emplevel; 




CREATE TABLE testtbl1 (id NUMBER(4), username nchar(3), age number(2));
INSERT INTO testtbl1 values(1, '홍길동', 25);

SELECT * FROM testtbl1;
INSERT INTO testtbl1(id, username) values(2, '설현');
INSERT INTO testtbl1(username, id, age) values('지민', 3, 26);

-- error
INSERT INTO testtbl1 values(4, 36, '공유');

--
CREATE TABLE testtbl2 (
	id NUMBER(4),
	username nchar(3),
	age NUMBER(2),
	nation nchar(4) DEFAULT '대한민국'
);

CREATE SEQUENCE idseq2
START WITH 1
INCREMENT BY 1;


INSERT INTO testtbl2 VALUES (idseq2.nextval, '유나',25, default);
SELECT * FROM testtbl2;
INSERT INTO testtbl2 VALUES (11, '쯔위', 18, '대만');

ALTER SEQUENCE idseq2
INCREMENT BY 10;

INSERT INTO testtbl2 VALUES (idseq2.nextval, '미나', 21, '일본');

ALTER SEQUENCE idseq2
INCREMENT BY 1;

INSERT INTO testtbl2 VALUES (idseq2.nextval, '사나', 21, '일본');


ALTER SEQUENCE idseq2
INCREMENT BY 5;
INSERT INTO testtbl2 VALUES (idseq2.nextval, '채영', 23, default);




SELECT idseq2.currval FROM testtbl2;





CREATE TABLE testtbl3 (id NUMBER(3));
CREATE SEQUENCE cycleseq
START WITH 100
INCREMENT BY 100
MINVALUE 100
MAXVALUE 300
CYCLE
nocache;


INSERT INTO testtbl3 VALUES(cycleseq.nextval);
INSERT INTO testtbl3 VALUES(cycleseq.nextval);
INSERT INTO testtbl3 VALUES(cycleseq.nextval);
INSERT INTO testtbl3 VALUES(cycleseq.nextval);


SELECT * FROM testtbl3;


CREATE TABLE testtbl4 (
	empid number(6),
	firstname varchar2(20),
	lastname varchar2(25),
	phone varchar2(20)
);


INSERT INTO testtbl4
	SELECT employee_id, first_name, last_name, phone_number
	FROM employees;

SELECT * FROM testtbl4;

---- Update Query

UPDATE testtbl4
	SET firstname='David'
	WHERE empid=100

SELECT * FROM testtbl4 WHERE empid=100;


--- Delete Query

SELECT * FROM testtbl4 WHERE lastname='King';

-- commit
COMMIT;


DELETE FROM testtbl4 WHERE firstname='David' AND lastname='King';

-- rollback
ROLLBACK;



CREATE TABLE bigtbl1
AS
	SELECT LEVEL AS bigid,
	round(dbms_random.value(1,500000), 0)
AS numdata
	FROM dual
	CONNECT BY LEVEL <= 500000;



CREATE TABLE bigtbl2
AS
	SELECT LEVEL AS bigid,
	round(dbms_random.value(1,500000), 0)
AS numdata
	FROM dual
	CONNECT BY LEVEL <= 500000;



CREATE TABLE bigtbl3
AS
	SELECT LEVEL AS bigid,
	round(dbms_random.value(1,500000), 0)
AS numdata
	FROM dual
	CONNECT BY LEVEL <= 500000;


delete from bigtbl1;
Commit;

drop table bigtbl2;

truncate table bigtbl3;

DROP TABLE bigtbl1;
DROP TABLE bigtbl3;




create table member1
AS (select userid, username, addr FROM usertbl);

select * from member1;


CREATE TABLE changetbl (
	userid char(8),
	username nvarchar2(10),
	addr nchar(2),
	changetype nchar(4)
);

INSERT INTO changetbl values('TKV', '태권브이','한국','신규가입');
INSERT INTO changetbl values('LGG', NULL,'제주','주소변경');
INSERT INTO changetbl values('LJB', NULL,'한국','주소변경');
INSERT INTO changetbl values('BBK', NULL,'탈퇴','회원탈퇴');
INSERT INTO changetbl values('SSK', NULL,'탈퇴','회원탈퇴');


SELECT * FROM member1;



MERGE INTO member1 M
USING (SELECT changetype, userid, username, addr FROM changetbl) C
ON (M.userid = C.userid)
WHEN MATCHED THEN
	UPDATE SET M.addr = C.addr
	DELETE WHERE C.changetype = '회원탈퇴'
WHEN NOT MATCHED THEN
	INSERT (userid, username, addr) VALUES (C.userid, C.username, C.addr);


SELECT * FROM changetbl;



select LENGTH('한글'), length('AB'), lengthb('한글'), lengthb('AB') FROM dual;
SELECT concat('이것이', 'oracle이다'), '이것이' || 'oracle이다' FROM dual;

SELECT instr('이것이 oracle이다. 이것도 oracle이다', '이것') FROM dual;
SELECT instr('이것이 oracle이다. 이것도 oracle이다', '이것', 2) FROM dual;

SELECT lower('abcdEFGH'), upper('abcdEFG'), initcap('this is oracle') FROM dual;

SELECT replace('이것이 ORACLE이다', '이것이', 'this is') FROM dual;
SELECT translate('이것이 ORACLE이다', '이것이','AB') FROM dual;

SELECT substr('대한민국만세', 3, 2) FROM dual;

SELECT reverse('Oracle') FROM dual;

SELECT lpad('이것이', 10, '##'), rpad('이것이', 10, '##') FROM dual; 

SELECT ltrim(' 이것이', ' '), rtrim('이것$$$$', '$') FROM dual;

SELECT trim(' 이것이 '), trim(BOTH 'ㅋ' FROM 'ㅋㅋㅋㅋ재밌어요.ㅋㅋㅋㅋㅋㅋ') FROM dual;

SELECT regexp_count('이것이 오라클이다', '이') FROM dual;


-- math

SELECT abs(-100) FROM dual;

SELECT ceil(4.4), floor(4.4), round(4,4) FROM dual;  -- 올림 내림 반올림
SELECT mod(13, 4) FROM dual;
SELECT power(2,3) FROM dual;
SELECT sign(100), sign(0), sign(-100.123) FROM dual;
SELECT trunc(12345.12345, 2), trunc(12345.12345, -2) FROM dual;
SELECT add_months('2025-01-01', 5), add_months(sysdate, -5) FROM dual;
SELECT to_date('2025-01-01') + 5, sysdate - 5 FROM dual;
SELECT extract(YEAR FROM DATE '2025-01-01'), extract(DAY from sysdate) from dual; -- 중요!
SELECT last_day('2025-02-01') FROM dual;
SELECT next_day('2025-03-16', '금요일'), next_day(sysdate, '토요일') FROM dual;
SELECT months_between(sysdate, '1997-06-17') from dual;

--- 형변환
SELECT bin_to_num(1, 0), bin_to_num(1,1,1,1) FROM dual;ALTER 

SELECT bin_to_num(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1) FROM dual;

SELECT NUMTODSINTERVAL(48, 'HOUR'), NUMTODSINTERVAL(360000, 'SECOND') FROM dual;

SELECT NUMTOYMINTERVAL(37, 'MONTH'), NUMTOYMINTERVAL(1.5, 'YEAR') FROM dual;


-- ETC

SELECT row_number() OVER (ORDER BY height DESC) "키 큰 순위", username, addr, height
FROM usertbl;

SELECT row_number()
OVER (ORDER BY height ASC) "키 큰 순위", username, addr, height
FROM usertbl;


SELECT addr, row_number()
OVER (PARTITION BY addr ORDER BY height DESC, username ASC)
"키 큰 순위", username, addr, height
FROM usertbl;


SELECT dense_rank()
OVER (ORDER BY height DESC)
"키 큰 순위", username, addr, height
FROM usertbl;


SELECT rank()
OVER (ORDER BY height DESC)
"키 큰 순위", username, addr, height
FROM usertbl;


-- 라운드 로빈

