SELECT 	*
FROM 	EMPLOYEES e 
;

-- substr(문자열, 시작위치, 길이)
SELECT 	SUBSTR('good morning john',1,4)
FROM	dual
;

SELECT 	SUBSTR('good morning john',8,4)
FROM	dual
;

SELECT 	SUBSTR('good morning john',8)
FROM	dual
;

SELECT 	SUBSTR('good morning john',-4)
FROM	dual
;

-- replace
SELECT 	REPLACE('good morning tom', 'morning', 'evenning')
FROM	dual
;

-- sysdate
SELECT 	SYSDATE 
FROM	dual
;

-- add_months : 7개월을 더한다.
SELECT 	ADD_MONTHS(SYSDATE, 7), SYSDATE 
FROM	dual
;

-- 현재 달의 마지막 날짜 : last_day
SELECT 	LAST_DAY(SYSDATE)
FROM	dual
;

-- 날짜 interval
SELECT 	SYSDATE + (INTERVAL '1' YEAR)
	,	SYSDATE + (INTERVAL '1' MONTH)
	,	SYSDATE + (INTERVAL '1' DAY)
	,	SYSDATE + (INTERVAL '1' HOUR)
	,	SYSDATE + (INTERVAL '1' MINUTE)
	,	SYSDATE + (INTERVAL '1' SECOND)
	,	SYSDATE 
FROM 	dual
;

-- to_char() : 문자열 변환
SELECT 	SYSDATE 
	,	TO_CHAR(sysdate, 'yyyy/mm/dd')
FROM	dual
;

SELECT 	SYSDATE 
	, 	TO_CHAR(sysdate, 'yyyymmdd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd HH24:mi:ss')
FROM	dual
;

SELECT 	*
FROM 	EMPLOYEES e 
;

-- to_date()
SELECT 	TO_DATE('2022/04/11') 
	,	'2022/04/11'
FROM	dual
;

-- nvl() : 널값을 다른 데이터로 변경하는 함수
SELECT 	*
FROM 	EMPLOYEES e 
;

SELECT 	FIRST_NAME , LAST_NAME 
	, 	NVL(COMMISSION_PCT,0) 
	-- ,	NVL(test, 'user') 
FROM 	EMPLOYEES e 
;

-- decode() : switch 문의 역할을 하는 함수
-- department_id가 20이면 Marketing -> MA / 60이면 IT -> IT / 
-- 90이면 Executive -> EX / ETC
SELECT 	DEPARTMENT_ID 
	,	DECODE(DEPARTMENT_ID, 20, 'MA', 60, 'IT', 90, 'EX', 'ETC') 
FROM 	DEPARTMENTS d 
;


SELECT 	*
FROM 	DEPARTMENTS d 
;

SELECT * FROM EMPLOYEES e ;

-- case() : else if 문과 같은 역할 함수
SELECT 	FIRST_NAME "fName" , LAST_NAME , DEPARTMENT_ID 
	,	CASE WHEN DEPARTMENT_ID = 20 THEN 'MA'
			 WHEN DEPARTMENT_ID = 60 THEN 'IT'
			 WHEN DEPARTMENT_ID = 90 THEN 'EX'
			 ELSE ''
		END "deptvalue"
FROM 	EMPLOYEES e 
;

-- 문제
/*
 * 1. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고(검색조건),
 * 사원번호, 성명, 담당업무(소문자 출력), 부서번호를 출력
 * -- where last_name = king
 */
SELECT 	EMPLOYEE_ID , LAST_NAME ,FIRST_NAME 
	, 	DEPARTMENT_ID , LOWER(JOB_ID)   
FROM 	EMPLOYEES e 
WHERE 	LOWER(LAST_NAME) = 'king'	-- king
;

/*
 * 2. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고(검색조건),
 * 사원번호, 성명, 담당업무(대문자 출력), 부서번호로 출력
 * -- where last_name = KING
 */
SELECT 	EMPLOYEE_ID , LAST_NAME ,FIRST_NAME 
	, 	DEPARTMENT_ID , UPPER(JOB_ID)   
FROM 	EMPLOYEES e 
WHERE 	UPPER(LAST_NAME) = 'KING'	-- king
;

/*
 * 3. DEPARTMENTS 테블에서 부서번호와 부서이름 위치번호(LOCATION_ID)를 
 * 합하여 출력하도록 하라
 */
SELECT 	DEPARTMENT_ID  || DEPARTMENT_NAME || LOCATION_ID 
FROM 	DEPARTMENTS d 
;

SELECT 	CONCAT(DEPARTMENT_ID ,CONCAT(DEPARTMENT_NAME, LOCATION_ID))     
FROM 	DEPARTMENTS d 
;

/*
 * 4. EMPLOYEES 테이블에서 30번 부서 중 사원번호 이름과 담당 아이디를
 * 연결하여 출력하여라
 */
SELECT 	CONCAT(CONCAT(EMPLOYEE_ID, LAST_NAME), MANAGER_ID)   
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID = 30
;

/*
 * 5. EMPLOYEES 테이블에서 SALARY + SALARY*COMMISSION_PCT이 10000이상이면, 'good',
 *  													 5000이상이면, 'average',
 * 														 1이상 5000미만이면 'bad'
 * 														 0이면 'no good'
 * 														 -> 알리아스 grade
 *  으로 평가를 출력하고, employee_id, first_name, salary, commission_pct,
 *  SALARY + SALARY*COMMISSION_PCT 출력
 */
SELECT 	EMPLOYEE_ID , FIRST_NAME , SALARY , COMMISSION_PCT 
	,	SALARY + SALARY * nvl(COMMISSION_PCT, 0) sal
	,	CASE WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 10000 THEN 'good'
			 WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 5000 	THEN 'average'
			 WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 1 	THEN 'bad'
			  -- AND SALARY + SALARY * nvl(COMMISSION_PCT, 0) < 5000	
			 WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) = 0	 	THEN 'no good'
		END  AS grade
FROM 	EMPLOYEES e 
;

-- distinct, group by
-- distinct : 컬럼의 중복을 제거 조회
SELECT 	DISTINCT DEPARTMENT_ID 
FROM	EMPLOYEES e 
;

-- group by : 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
-- 			  집계 함수와 짝을 이루어 사용할 수 있다. 
SELECT 	DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;
	
SELECT 	DISTINCT DEPARTMENT_ID, SUM(SALARY)  
FROM 	EMPLOYEES e 
;

-- 부서별 급여 합계
SELECT 	SUM(SALARY)  , DEPARTMENT_ID
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

SELECT 	SUM(SALARY)  , DEPARTMENT_ID  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID  
;

SELECT 	* FROM EMPLOYEES e ;

-- 부서별 사원수와 평균 급여를 구해보자
SELECT 	DEPARTMENT_ID 	, SUM(SALARY)
	,	COUNT(SALARY)	, COUNT(EMPLOYEE_ID) 
	,	AVG(SALARY)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;

SELECT 	* FROM EMPLOYEES e ORDER BY DEPARTMENT_ID ;

-- 부서별, 직급별 사원수와 평균 급여를 구해보자
SELECT 	COUNT(EMPLOYEE_ID), AVG(SALARY)
	,	DEPARTMENT_ID ,	JOB_ID 	
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- having 절
-- where 절에서는 집계함수를 사용할 수 없다.
-- HAVING  : 집계함수를 가지고 조건비교를 할 때 사용한다.
-- 			 GROUP  BY 절과 함께 사용한다.
SELECT 	DEPARTMENT_ID , COUNT(*)  
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IS NOT NULL 
GROUP BY DEPARTMENT_ID
HAVING 	COUNT(*) >= 10 
;

SELECT COUNT(*), COUNT(SALARY) , COUNT(EMPLOYEE_ID), COUNT(DEPARTMENT_ID)  
FROM EMPLOYEES e ;






















