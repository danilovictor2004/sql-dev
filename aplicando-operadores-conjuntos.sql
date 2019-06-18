--Crie um relatório com uma lista de países nos quais não há departamentos. 
--Exiba o ID e o nome dos países. 
--Use os operadores de conjunto para criar esse relatório.

SELECT country_id, country_name
  FROM countries
 MINUS
SELECT l.country_id, c.country_name
  FROM locations l
  JOIN countries c
    ON (c.country_id = l.country_id)

--Produza uma lista de cargos dos departamentos 10, 50 e 20, nessa ordem. 
--Exiba o ID de cargo e o ID de departamento usando operadores de conjunto.
SELECT department_id, job_id, 1
  FROM employees
 WHERE department_id = 10
 UNION
SELECT department_id, job_id, 2
  FROM employees
 WHERE department_id = 50
 UNION
SELECT department_id, job_id, 3
  FROM employees
 WHERE department_id = 20
ORDER BY 3

--Crie uma query com as seguintes especificações:
--Sobrenome e ID do departamento de todos os funcionários da tabela EMPLOYEES, mesmo que não pertençam a um departamento
--ID e nome de todos os departamentos da tabela DEPARTMENTS, mesmo que não tenham funcionários

SELECT last_name, department_id, NULL
  FROM employees
UNION
SELECT NULL, department_id, department_name
  FROM departments
