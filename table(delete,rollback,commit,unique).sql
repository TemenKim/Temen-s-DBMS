SELECT 	* FROM  EMPLOYEES e ;

/*
 *	table 생성, 
 *	테이블 이름 	: sample
 * 	컬럼			: deptNo 	/ NUMBER(20)
 * 				  deptName 	/ varchar2(15)
 * 				  deptLoc 	/ varchar2(15)
 * 				  deptManager / varchar2(10)
 *  데이터 insert : 10, 기획실, 서울, 홍길동
 * 			 	 : 20, 전산실, 부산, 김말똥
 * 				 : 30, 영업부, 광주, null
 *  데이터 전체 select
 *  데이터 update : deptNo가 30인 부서를 50으로 수정  
 * 				 : deptName이 영업부인 deptLoc를 인천으로 수정
 *  데이터 delete : deptName이 영업부인 데이터 삭제
 */
	
-- table 생성
CREATE TABLE sample(
	deptNo		number(20),
	deptName	varchar2(15),
	deptLoc		varchar2(15),
	deptManager	varchar2(10)
);

SELECT 	* FROM SAMPLE s ;

-- 데이터 insert : alt + x
INSERT INTO SAMPLE (deptNo, deptName, deptLoc, deptManager)
 VALUES (10, '기획실', '서울', '홍길동');
INSERT INTO SAMPLE (deptNo, deptName, deptLoc, deptManager)
 VALUES (20, '전산실', '부산', '김말똥');
INSERT INTO SAMPLE (deptNo, deptName, deptLoc)
 VALUES (30, '영업부', '광주');

-- INSERT INTO SAMPLE VALUES (10,'기획실','서울','홍길동');

-- 데이터 update : deptNo가 30인 부서를 50으로 수정
UPDATE 	SAMPLE SET DEPTNO = 50
WHERE 	DEPTNO = 30;

SELECT * FROM SAMPLE s ;

-- 데이터 update : deptName이 영업부인 deptLoc를 인천으로 수정
UPDATE 	SAMPLE SET DEPTLOC = '인천'
WHERE 	DEPTNAME = '영업부'
;

-- 데이터 delete : deptName이 영업부인 데이터 삭제
DELETE	sample	
WHERE	deptName = '전산실'
;

SELECT 	* FROM SAMPLE s ;

DELETE sample;

ROLLBACK;

COMMIT;

-----------------------------------------------------------------
-- not null
CREATE TABLE null_test(
	col1 	varchar2(20) NOT NULL ,
	col2	varchar2(20) NULL ,
	col3	varchar2(30)
);

SELECT * FROM null_test;

INSERT INTO null_test(col1, col2) VALUES ('aa', 'bb');
INSERT INTO null_test(col1) VALUES ('aa2');
-- 오류
-- INSERT INTO null_test(col2) VALUES ('bb2');

-- unique
CREATE TABLE unique_test(
	col1	varchar2(20)	UNIQUE NOT NULL ,
	col2	varchar2(20)	UNIQUE ,
	col3 	varchar2(20)	NOT NULL,
	col4	varchar2(20)	NOT NULL,
	CONSTRAINTS temp_unique  UNIQUE(col3, col4)
);
-- 에러발생
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa6', 'bb6', 'cc', 'dd');
-- 정상 insert
-- UNIQUE(col3, col4) : 컬럼 그들의 조합이 유일해야 한다.
-- 각각 컬럼 데이터의 유일함은 의미가 없고, 조합히 유일해야 한다.
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa6', 'bb6', 'cc1', 'dd');
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa7', 'bb7', 'cc6', 'dd');
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa8', 'bb8', 'cc6', 'dd');



SELECT * FROM unique_test;

INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa', 'bb', 'cc', 'dd');
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa2', 'bb2', 'cc2', 'dd2');
INSERT INTO UNIQUE_TEST (col1, col2, COL3, COL4)
	VALUES ('aa3', 'bb3', 'cc3', 'dd3');
UPDATE UNIQUE_TEST SET COL1 = 'aa' WHERE COL2 = 'bb2';

INSERT INTO UNIQUE_TEST (col1, COL3, COL4)
	VALUES ('aa4', 'cc4', 'dd4');
INSERT INTO UNIQUE_TEST (col1, COL3, COL4)
	VALUES ('aa5', 'cc5', 'dd5');

DELETE	UNIQUE_TEST	

SELECT * FROM UNIQUE_TEST ut 
WHERE	COL1 = 'aa3'
;














