-- Deletando várias linhas
DELETE FROM employees
 WHERE department_id = 280;
 
 -- Deletando uma linha
DELETE FROM departments
 WHERE department_id = 280;

-- Deletando com subquery
DELETE FROM employees
 WHERE department_id =
						(SELECT department_id
						   FROM departments
						  WHERE department_name
						   LIKE '%TESTE%');
						   
