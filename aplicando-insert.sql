--INSERT BÁSICO
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations 2', 100, 1700);

--INSERT VALORES NULOS
INSERT INTO departments (department_id, department_name)
VALUES (300, 'Purchasing Insert');

INSERT INTO departments
VALUES (290, 'Finance', NULL, NULL);

-- USANDO FUNÇÕES
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (600, 'Louis', 'Popp', 'LP0PP3', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 100);

--VALOR DE DATA ESPECÍFICO
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (602, 'Louis', 'Popp', 'LP0PP2', '515.124.4567', TO_DATE('01/01/2015', 'DD/MM/RRRR'), 'AC_ACCOUNT', 6900, NULL, 205, 100);

--VALORES DINÂMICOS
INSERT INTO departments (department_id, department_name, location_id)
VALUES (:department_id, :department_name, :location);

--INSERINDO VÁRIOS REGISTROS
CREATE TABLE representantes_venda(
	id			NUMBER(10) PRIMARY KEY NOT NULL,
	nome		VARCHAR(50) NOT NULL,
	salario		NUMBER(10,2) NOT NULL,
	comissao	NUMBER(10,2));
	
INSERT INTO representantes_venda(id, nome, salario, comissao)
	SELECT employee_id, last_name, salary, commission_pct
	  FROM employees
	 WHERE job_id 
	  LIKE '%REP%';
