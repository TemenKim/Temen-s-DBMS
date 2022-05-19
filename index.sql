SELECT * FROM EMPLOYEES e ;

-- index
CREATE TABLE EMPLOYEES3 AS SELECT * FROM EMPLOYEES e ;

SELECT  rowid, EMPLOYEE_ID 
FROM 	EMPLOYEES3
WHERE 	EMPLOYEE_ID = 200
;

SELECT 	*
FROM 	EMPLOYEES3
WHERE 	EMPLOYEE_ID = 100
;


INSERT INTO EMPLOYEES3 (employee_id, FIRST_NAME, LAST_NAME)
VALUES (100, 'User', 'Name');

-- unique index ����
CREATE UNIQUE INDEX idx_employees3_id
ON employees3(employee_id)
;

-- DELETE 
--DELETE FROM EMPLOYEES3 e
SELECT * FROM EMPLOYEES3 e 
WHERE 	FIRST_NAME = 'User'
AND 	LAST_NAME = 'Name'
;

SELECT * FROM EMPLOYEES3 e; WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMPLOYEES3 e WHERE FIRST_NAME = 'Michael';
INSERT INTO EMPLOYEES3 (employee_id, FIRST_NAME, LAST_NAME)
	VALUES (500, 'Michael', 'Hartstein');
INSERT INTO EMPLOYEES3 (employee_id, FIRST_NAME, LAST_NAME)
	VALUES (501, 'Michael', 'Hartstein');

-- index
CREATE INDEX idx_employee3_first ON EMPLOYEES3(first_name); 















