-- Crie uma consulta para o departamento de recursos humanos a fim de gerar os endereços de todos os departamentos. Use as tabelas LOCATIONS e COUNTRIES. 
-- Mostre o ID do local, o endereço, a cidade, o estado e o país na saída.
SELECT l.location_id,
       l.street_address,
       l.city, 
       c.country_name
  FROM locations l
  JOIN countries c
    ON (c.country_id = l.country_id)

-- O departamento de recursos humanos precisa de um relatório de todos os funcionários. 
-- Crie uma consulta para exibir o sobrenome, o número do departamento e o nome do departamento de todos os funcionários.
SELECT e.last_name AS "Sobrenome",
       e.department_id AS "Código do Departamento",
       d.department_name AS "Departamento"
  FROM employees e
  JOIN departments d
    ON (e.department_id = d.department_id)

-- O departamento de recursos humanos precisa de um relatório dos funcionários em Toronto. 
-- Exiba o sobrenome, o cargo, o número do departamento e o nome do departamento de todos os funcionários que trabalham em Toronto.
SELECT e.last_name AS "Sobrenome", 
       j.job_title AS "Cargo",
       d.department_id AS "Número do Departamento",
       d.department_name AS "Departamento"
  FROM employees e
  JOIN jobs j
    ON (e.job_id = j.job_id)
  JOIN departments d
    ON (e.department_id = d.department_id)
  JOIN locations l
    ON (d.location_id = l.location_id)
 WHERE l.city = 'Toronto'

--Crie um relatório para exibir o sobrenome e o número dos funcionários, bem como o sobrenome e o número dos respectivos gerentes. 
--Atribua às colunas os labels Employee, Emp#, Manager e Mgr#, respectivamente. DÚVIDA
SELECT w.last_name AS "Employees",
       w.employee_id AS "Emp#",
	   m.last_name AS "Manager",
	   m.employee_id AS "Mgr#"
  FROM employees w
  JOIN employees m
    ON (w.manager_id = m.employee_id)

--Crie um relatório para o departamento de recursos humanos que exiba os sobrenomes e os números de departamento dos funcionários, 
--bem como todos os funcionários que trabalham no mesmo departamento como um funcionário específico.
SELECT e.department_id,
       e.last_name AS "employees",
	   e.last_name AS "colega"
  FROM employees e
  JOIN employees c
    ON (e.department_id = c.department_id)
 WHERE e.employee_id <> c.employee_id
 ORDER BY e.department_id, e.last_name, c.last_name;

