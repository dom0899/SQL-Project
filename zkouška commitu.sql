-- zkouška commitu


-- zjištění průměrné mzdy za určité období 

SELECT *
FROM czechia_payroll cp
WHERE value_type_code = 5958
ORDER BY id DESC;


-- zjištění cen potravin za určité období



SELECT *
FROM czechia_price cp
WHERE region_code IS NOT NULL
ORDER BY id DESC; 























