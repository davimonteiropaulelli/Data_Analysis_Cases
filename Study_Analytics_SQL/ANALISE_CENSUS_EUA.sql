-- SERAO REALIZADO ALGUNS SELECTs PARA ENTENDER O DATASET E REALIZAR ALGUMAS ANALISES
-- VISUALIZANDO TODOS OS DADOS
SELECT * FROM T_CENSUS_EUA

-- PESSOAS MAIS NOVAS DE CADA FORMACAO
SELECT EDUCATION, MIN(AGE) AS IDADE_MINIMA
FROM T_CENSUS_EUA
GROUP BY EDUCATION

-- ANALISE ESTATISTICA POR FORMACAO ACADEMICA E SALARIO ANUAL
SELECT EDUCATION, INCOME, ROUND(AVG(AGE)) AS MEDIA_IDADE, ROUND(STDDEV(AGE),2) AS DESVIO_PADRAO_IDADE, ROUND(VARIANCE(AGE),2) AS VARIANCIA_IDADE
FROM T_CENSUS_EUA
GROUP BY EDUCATION,INCOME
ORDER BY EDUCATION

-- VISUALIZANDO O NIVEL DE FORMACAO E O SALARIO APENAS
SELECT EDUCATION, INCOME FROM T_CENSUS_EUA

-- REALIZANDO UM CONTAGEM DE PESSOAS POR SALARIO ANUAL E FORMACAO ACADEMICA
SELECT EDUCATION, INCOME, COUNT(INCOME) AS NUMERO_PESSOAS
FROM T_CENSUS_EUA 
GROUP BY EDUCATION, INCOME
ORDER BY EDUCATION, INCOME

-- REALIZANDO UM CONTAGEM DE PESSOAS POR SALARIO ANUAL E SEXO E MEDIA DE IDADE
SELECT SEX, INCOME, COUNT(INCOME) AS NUMERO_PESSOAS, ROUND(AVG(AGE)) AS MEDIA_IDADE
FROM T_CENSUS_EUA 
GROUP BY SEX, INCOME
ORDER BY SEX, INCOME

-- REALIZANDO UM CONTAGEM DE PESSOAS POR SALARIO ANUAL E RACA
SELECT RACE, INCOME, COUNT(INCOME) AS NUMERO_PESSOAS
FROM T_CENSUS_EUA 
GROUP BY RACE, INCOME
ORDER BY RACE, INCOME

-- JUNTANDO AS 3 ULTIMAS ANALISES: REALIZANDO UM CONTAGEM DE PESSOAS POR SALARIO ANUAL, FORMACAO, SEXO E RACA
SELECT EDUCATION, SEX, RACE, INCOME, COUNT(INCOME) AS NUMERO_PESSOAS
FROM T_CENSUS_EUA 
GROUP BY EDUCATION, SEX, RACE, INCOME
ORDER BY EDUCATION, SEX, RACE, INCOME

-- CONTAGEM DE EMPREGADOS NOS ESTADOS UNIDOS AGRUPADO POR SALARIO, (APENAS ESTRANGEIROS)
SELECT NATIVE_COUNTRY, INCOME, COUNT(INCOME) AS NUMERO_PESSOAS
FROM T_CENSUS_EUA
WHERE NATIVE_COUNTRY != ' United-States'
GROUP BY NATIVE_COUNTRY,INCOME
ORDER BY NATIVE_COUNTRY,INCOME

-- ANOS ESTUDADOS POR RACA
SELECT RACE, ROUND(AVG(EDUCATION_NUM),2) AS MEDIA_ESTUDO,
CASE
    WHEN ROUND(AVG(EDUCATION_NUM),2) < 10 THEN 'MENOS QUE A MEDIA'
    ELSE 'MAIS QUE A MEDIA'
END AS DESC_MEDIA_ESTUDO
FROM T_CENSUS_EUA
GROUP BY RACE
ORDER BY RACE

COMMIT