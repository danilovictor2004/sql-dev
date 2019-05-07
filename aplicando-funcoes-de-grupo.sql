--Faça uma query que retorne salário máximo, o salário mínimo, a soma dos salários e o salário médio de todos os funcionários. Atribua os nomes às colunas Máximo, Mínimo, Soma e Média, 
--respectivamente, às colunas. Arredonde os resultados para o número inteiro mais próximo

SELECT ROUND(MAX(salary)) AS "Máximo",
       ROUND(MIN(salary)) AS "Mínimo",
       ROUND(SUM(salary)) AS "Soma",
       ROUND(AVG(salary)) AS "Média"
  FROM employees;

-- Agora faça a mesma query, porém ela deve ser agrupado pelo job_id dos funcionários.
SELECT job_id, 
       ROUND(MAX(salary)) AS "Máximo",
       ROUND(MIN(salary)) AS "Mínimo",
       ROUND(SUM(salary)) AS "Soma",
       ROUND(AVG(salary)) AS "Média"
  FROM employees
GROUP BY job_id;

--Crie uma query para retornar o número de funcionários, agrupados pelo job_id. Onde quem for executar a consulta poderá escolher o cargo que será utilizado nela.
SELECT COUNT(employee_id) AS "Número de Funcionários", 
       job_id
  FROM employees
WHERE job_id = :cod_job
GROUP BY job_id;

--Determine o número de gerentes que atuam nesta empresa, para fazer isso use a coluna MANAGER_ID da tabela employees.
SELECT COUNT(DISTINCT(manager_id)) AS "Total de Gerentes"
  FROM employees;

--Faça uma query que retorne a diferença entre o salário mais alto e o mais baixo dos empregados desta empresa.
SELECT MAX(salary) - MIN(salary) AS "Diferença Salarial"
  FROM employees;

--Crie uma consulta que exiba o número total de funcionários e, desse total, mostre o número de funcionários admitidos em 2005, 2006, 2007 e 2008. 
--Para cada coluna você deve usar como alias o ano em que esses funcionários foram admitidos.
SELECT COUNT(DISTINCT(employee_id)) AS "Total de Funcionários",
       SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), '2005', 1, 0)) AS "2005",
       SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), '2005', 1, 0)) AS "2006",
       SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), '2005', 1, 0)) AS "2007",
       SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), '2005', 1, 0)) AS "2008"
  FROM employees;