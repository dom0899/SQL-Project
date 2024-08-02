-- SQL Project 


-- zjištění průměrné mzdy za určité období 

SELECT *
FROM czechia_payroll cp
WHERE value_type_code = 5958
AND payroll_year = '2018'
ORDER BY id DESC;


-- zjištění cen potravin za určité období



SELECT *
FROM czechia_price cp
WHERE region_code IS NOT NULL
ORDER BY id DESC; 




-- sjednocení cen a mzdy za určité období 


SELECT 
	cpc.name AS category_name,
	cpay.value AS value_average_salary,
	cpay.payroll_year,
	cp.value AS price,
	cp.region_code AS data_from_all_regions_of_Czechia,
	date_format(cp.date_from, '%d, %m, %Y' ) AS date_from,
	date_format(cp.date_to, '%e. %M %Y', 'cs_CZ' )   AS date_to
FROM czechia_price cp 
JOIN czechia_payroll cpay
	ON cpay.payroll_year = year(cp.date_from) 
LEFT JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code 
WHERE cpay.value_type_code = 5958
AND cpay.payroll_year = '2018';












