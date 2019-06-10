--Crie um relatório que exiba o número e o sobrenome de todos os funcionários cujo salário é maior que o salário médio. 
--Classifique os resultados em ordem crescente de salário.

SELECT employee_id, last_name, salary
  FROM employees
 WHERE salary > (SELECT ROUND(AVG(salary),2)
                   FROM employees);
				  
--Crie uma consulta que exiba o número e o sobrenome de todos os
--funcionários que trabalham em um departamento com funcionários
--cujos sobrenomes contêm a letra z.

SELECT employee_id, last_name
  FROM employees
 WHERE last_name IN (SELECT last_name 
                         FROM employees 
						WHERE last_name 
						 LIKE '%Z%' 
						   OR last_name 
						 LIKE '%z%');

--Crie uma query que exiba o sobrenome, o número do departamento e o ID do cargo de todos os funcionários cujo ID de
--local do departamento é 1700.

SELECT last_name, job_id, department_id 
  FROM employees
 WHERE department_id IN	(SELECT department_id FROM departments
                          WHERE location_id = 1700)
						  
--Crie um relatório que exiba o número do departamento, o
--sobrenome e o ID do cargo de todos os funcionários no
--departamento executivo.

SELECT department_id, last_name, job_id
  FROM employees
 WHERE department_id = (SELECT department_id 
                          FROM departments 
						 WHERE department_name = 'Executive')

