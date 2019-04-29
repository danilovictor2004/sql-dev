--- O departamento de recursos humanos precisa de um relatório para exibir o número do funcionário, o sobrenome, 
--- o salário e o salário com 15,5% de aumento (especificado como um número inteiro) de cada funcionário. 
--- Atribua o nome Novo Salário à coluna.
SELECT employee_id AS "Número", 
       CONCAT(CONCAT(first_name, ' '), last_name) AS "Funcionario",
       salary AS "Salário",
       TRUNC(salary + (salary * (15.5/100))) AS "Novo Salário"
 FROM employees
---------------------------------------------------------------------------------------------------------------------------------------
--- Crie uma consulta que exiba o sobrenome (com a primeira letra maiúscula e todas as outras minúsculas) e o tamanho do sobrenome de 
--- todos os funcionários cujos nomes comecem com a letra J, A ou M. 
--- Atribua um nome apropriado a cada coluna. Ordene os resultados pelos sobrenomes dos funcionários.
SELECT INITCAP(last_name) AS "Funcionário", 
       LENGTH(last_name) AS "Total de letras" 
  FROM employees
 WHERE last_name LIKE 'J%' 
    OR last_name LIKE 'A%' 
    OR last_name LIKE 'M%'
 ORDER BY last_name;
---------------------------------------------------------------------------------------------------------------------------------------
---Crie um relatório com o tempo de emprego de cada funcionário. Para cada funcionário, exiba o sobrenome e calcule o número de meses 
---entre hoje e a data de admissão do funcionário. Atribua o nome MESES_TRABALHADOS à coluna. 
---Ordene os resultados pelo número de meses em que o funcionário está empregado. 
---Arredonde o número de meses para o número inteiro mais próximo.
SELECT last_name AS "Funcionário",
       ROUND(MONTHS_BETWEEN(sysdate, hire_date)) AS "Meses trabalhadados" 
  FROM employees
ORDER BY "Meses trabalhadados";
---------------------------------------------------------------------------------------------------------------------------------------
---Crie um relatório que produza estas informações para cada funcionário:
---recebe mensalmente, mas deseja receber <3 vezes o salário>. Atribua o nome Salários dos Sonhos à coluna.
SELECT salary AS "Recebe mensalmente", 
       salary*3 AS "Salários dos Sonhos"
  FROM employees;
---------------------------------------------------------------------------------------------------------------------------------------
---Crie uma consulta que exiba o sobrenome e o salário de todos os funcionários. Formate o salário para defini-lo com um tamanho de 15 
---caracteres e preenchê-lo à esquerda com o símbolo $. Atribua o nome SALARIO à coluna.
SELECT last_name AS "Sobrenome", 
       LPAD(salary, 15,'$') AS "Salário" 
  FROM employees;
---------------------------------------------------------------------------------------------------------------------------------------
---Exiba o sobrenome, a data de admissão e a data de revisão de salário de cada funcionário, que é a primeira segunda-feira após 
---seis meses de serviço. Atribua o nome REVISÃO à coluna. 
---Formate as datas para que sejam exibidas no formato semelhante a Dia/Mês/Ano
SELECT last_name AS "Funcionário", 
       TO_CHAR(hire_date, 'DD/MM/YYYY') AS "Data de Admissão", 
       TO_CHAR(NEXT_DAY(TO_DATE(ADD_MONTHS(hire_date, 6)), 'MONDAY'), 'DD/MM/YYYY') AS "Revisão" 
  FROM employees
ORDER BY hire_date;
---------------------------------------------------------------------------------------------------------------------------------------
---Crie uma consulta que exiba os sobrenomes e as comissões dos funcionários. Se um funcionário não ganhar comissão, a informação 
---"Sem Comissão" deverá ser exibida. Atribua o nome Comissão à coluna.
SELECT last_name,
       CASE
          WHEN commission_pct is null THEN 'Sem_comissão'
          ELSE 'Comissão'
       END "Comissão"
FROM employees;
--------------------------------------------------------------------------------------------------------------------------------------------------------
--Com a function DECODE, crie uma consulta que exiba o nível de todos os funcionários com base no valor da coluna JOB_ID. 
--Use estes dados:
--Cargo Nível
--AD_PRES A
--ST_MAN B
--IT_PROG C
--SA_REP D
--ST_CLERK E
--Nenhuma das opções anteriores 0.
SELECT job_id AS "ID",
DECODE (job_id, 'AD_PRES', 'A',
                'ST_MAN', 'B',
                'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
                job_id, 0) AS "Cargo Nível" 
FROM employees;
--------------------------------------------------------------------------------------------------------------------------------------------------------
--Com a function CASE, crie uma consulta que exiba o nível de todos os funcionários com base no valor da coluna JOB_ID. 
--Use estes dados:
--Cargo Nível
--AD_PRES A
--ST_MAN B
--IT_PROG C
--SA_REP D
--ST_CLERK E
--Nenhuma das opções anteriores 0.
SELECT job_id AS "ID",
       CASE job_id WHEN 'AD_PRES' THEN 'A'
                   WHEN 'ST_MAN' THEN 'B'
                   WHEN 'IT_PROG' THEN 'C'
                   WHEN 'SA_REP' THEN 'D'
                   WHEN 'ST_CLERK' THEN 'E'
       ELSE '0'
       END "Nível Salarial"
  FROM employees;
<<<<<<< HEAD
=======

>>>>>>> ed8f4f5d4327337035ffcc359a978a90595cfeab
