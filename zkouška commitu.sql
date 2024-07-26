-- zkouška commitu

SELECT *, 
	date_from 
FROM czechia_price
ORDER BY date_from DESC ; 






SELECT 
	cp.id,
	cpay.id 
FROM czechia_price cp 
JOIN czechia_payroll cpay
	ON cp.id = cpay.id; 