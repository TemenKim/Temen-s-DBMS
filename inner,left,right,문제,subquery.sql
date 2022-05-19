SELECT 	*
FROM 	EMPLOYEES e 
;

-- 10시 40분 까지, ~ 50분 쉬는시간, 
/*
 * 	1. 사원이름과 그 사원의 관리자 이름을 출력하라.
 */
SELECT 	e.FIRST_NAME AS empName, e.MANAGER_ID  
	, 	e2.FIRST_NAME AS mngName , e2.EMPLOYEE_ID 
FROM 	EMPLOYEES e 
	INNER JOIN EMPLOYEES e2  ON e.MANAGER_ID = e2.EMPLOYEE_ID 
;
SELECT * FROM EMPLOYEES e ;

/*
 *	2. 사원이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력하라
 */
SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	e.SALARY >= 3000
;

/*
 *  3. 급여가 3000에서 5000사이인 사원의 이름과 부서명을 출력하라
 */

SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	e.SALARY BETWEEN 3000 AND 5000
;

/*
 *  4. 급여가 3000이하인 사원의 이름과 급여, 근무지(city)를 출력하라
 */
SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME, l.CITY  
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	LEFT OUTER JOIN LOCATIONS l 	ON d.LOCATION_ID = l.LOCATION_ID 
WHERE 	e.SALARY <= 3000
;

/*
 *  5. Steven King의 부서명을 출력하라
 */
SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	e.FIRST_NAME = 'Steven'
AND 	e.LAST_NAME  = 'King'
;

SELECT * FROM EMPLOYEES e ;

/*
 *  6. IT부서에서 근무하고 있는 사람들의 이름, 부서명을 출력하라 
 */
SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	d.DEPARTMENT_NAME = 'IT'
;

/*
 *  7. 업무가 SA_MAN인 사람의 사원번호, 이름, 급여, 부서명, 근무지(location_id)를 출력하여라
 */
SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME , d.LOCATION_ID  
FROM 	EMPLOYEES e
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	e.JOB_ID = 'SA_MAN'
;

/*
 *  8. Employees 테이블과 Departments 테이블에서,
 *  Departments 테이블 기준으로 사원번호, 이름, 업무(job_id),부서번호, 부서명,근무지를
 *  출력하라 
 */
SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , d.DEPARTMENT_ID , d.DEPARTMENT_NAME , d.LOCATION_ID 
FROM 	EMPLOYEES e
	RIGHT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
;

----------------------------------------------------
-- 평균 급여보다 작은 사람
SELECT 	ROUND(AVG(SALARY))  
FROM 	EMPLOYEES e 
;
-- 6462

SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
	,	(SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES e )
FROM 	EMPLOYEES e 
WHERE 	SALARY < (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES e )
-- WHERE 	SALARY < ROUND(AVG(SALARY))
ORDER BY SALARY 
;

SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY < 6462
ORDER BY SALARY 
;

-- locations 테이블에서 country_id 가 'US'인 location_id를 가진
-- 부서전체를 조회하라
SELECT 	LOCATION_ID 
FROM 	LOCATIONS l 
WHERE 	COUNTRY_ID = 'US'
;
-- 1400, 1500, 1600, 1700

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (SELECT 	LOCATION_ID 
						FROM 	LOCATIONS l 
						WHERE 	COUNTRY_ID = 'US')
;

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (1400, 1500, 1600, 1700)
;

-- 30분까지
-- 월급이 가장 적은 사람의 first_name, last_name 출력
SELECT 	FIRST_NAME , LAST_NAME , SALARY 
FROM 	EMPLOYEES
WHERE 	SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES  )
;

-- 월급이 가장 많은 사람의 first_name, last_name, job_title 출력
SELECT 	e.FIRST_NAME , e.LAST_NAME, j.JOB_TITLE , SALARY 
FROM 	EMPLOYEES e 
	INNER JOIN JOBS j  ON e.JOB_ID = j.JOB_ID 
WHERE 	e.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES e2)
;

SELECT 	*
FROM 	JOBS
;

SELECT 	*
FROM 	EMPLOYEES e 
;
-- 45분까지
/*
 * 1. EMPLOYEES테이블에서 Kochhar 의 급여보다 많은 사원의
 * 정보를 사원번호, 이름, 담당업무(job_id), 급여를 출력하라
 */
SELECT 	e.EMPLOYEE_ID  , e.FIRST_NAME , e.JOB_ID , e.SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY > (	SELECT 	SALARY 
					FROM	EMPLOYEES e2 
					WHERE 	LAST_NAME = 'Kochhar')
;

/*
 * 2. EMPLOYEES테이블에서 급여의 평균보다 적은 사원의 
 * 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라.
 */
SELECT 	EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , e.DEPARTMENT_ID , e.SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY < ( SELECT AVG(SALARY) FROM EMPLOYEES e2)
;















