-- Atualizando um registro
UPDATE employees
   SET department_id = 70
 WHERE employee_id = 113;
 
-- Atualizando mais de um registro
UPDATE employees
   SET department_id = 70
 WHERE department_id = 110;
 
-- Atualizando dados com uma subquery
UPDATE employees
   SET job_id = (SELECT job_id
				   FROM employees
				  WHERE employee_id = 205),
		salary = (SELECT salary
					FROM employees
				   WHERE employee_id = 205)
 WHERE employee_id = 114;