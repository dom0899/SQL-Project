-- Sada SQL Dotazů
-- Výzkumné otázky


-- Rostou v průběhu let mzdy ve všech odvětvích,
-- nebo v některých klesají?



SELECT 
	cpib.name AS "odvětví",
	cpay.value AS "mzdy",
	cpay.payroll_year "průběžné roky"
FROM czechia_payroll cpay
JOIN czechia_payroll_industry_branch cpib
	ON cpay.industry_branch_code = cpib.code
WHERE cpay.value_type_code = 5958;


-- Odpověď na výzkumnou otázku -> Například v oboru Zemědělství, lesnictví, rybářství
-- se mzdy pomalu zvedají, ale v roce 2019 byla mzda na 31 269 kč a v roce 2021 klesla mzda na 26 284

-- Podle sledování kvartálů to vypadá,
-- že ve 4. kvartálu se mzda vždy liší a to tím rozdílem, 
-- že je vyšší než ty ostatní první tři. 








































