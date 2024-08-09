# SQL-Project 
<small>*ENGETO - DATA ACADEMY*</small> 

-------------------------------------------------------------------------------------------
*V projektu se zabývám životní úrovní občanů. Odpovídám tu na 5 výzkumných otázek, které se týkají dostupností základních potravin široké veřejnosti a průměrných příjmů za určité časové období.* 


-------------------------------------------------------------------------------------------


*    První částí projektu je primární tabulka: ***t_dominik_drazan_project_sql_primary_final*** , kterou jsem vytvořil za účelem zjištění dostupností základních potravin. Poté k tomu byl vydefinován podklad průměrných příjmů k danému časovému období.

Pro získání vhodného datového podkladu jsem využil <u>*primární tabulky*</u>:
<mark>**czechia_payroll**</mark> a <mark>**czechia_price**</mark>


*   Následně mnou byla vytvořena tabulka: ***t_dominik_drazan_project_SQL_secondary_final*** k určení HDP, GINI koeficientu a populací evropských států.

Po nahrání dat do nově vytvořené tabulky jsem použil data z <u>dodatečné tabulky</u>: <mark>economies</mark>

**--------->** Při analyzování dat chyběli hodnoty a data v německém státě.
Když jsem přidal ke klauzuli WHERE, že v sloupci GINI nesmí být nula, tak  německý stát zmizel z tabulky  **<---------**


<u>**Výzkumné Otázky**</u>

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------


<u>**Výstupní odpovědi na výzkumné otázky**</u>

1. Trend zvyšování mezd od roku 2000 do roku 2020 platí pro všechna odvětví. Nejrychleji vzrostly mzdy ve zdravotní a sociální péči, nejpomaleji v peněžnictví a pojišťovnictví. U ojedinělých případech se kolísavým způsobem snižuje. Platy mezi kraji jsou rozdílné. V Praze jsou výrázně vyšší než u jiných krajů. 
* [ ] U této otázky jsem přistupoval tak, že jsem spojil dvě tabulky <mark>czechia_payroll</mark> a <mark>czechia_payroll_industry_branch</mark> přes klauzuli **JOIN**. 

* [ ] Poté jsem vypsal do klauzule **SELECT** sloupce *odvětví*, *mzdy*, *průběžné roky* a *kvartál*.

* [ ] Nakonec jsem dotaz omezil tak, aby mi vyhledal pouze průměrné mzdy a jen poslední kvartál v roce, který po mém přezkoumání byl vyhodnocen jako ten s nejvyšším platem.


-------------------------------------------------------------------------------------------

2. Dle mé analýzi si občané v průměru za rok 2006 kupovali 3061,3 litrů mléka a 2,741,2 kg chleba. Za rok 2018 si kupovali 2,969,1 litrů mléka a 2,427,5 kg chleba.
* [ ] Postup k této otázce byl následující. Do mé vytvořené sekundární tabulky přes klauzule **JOIN** jsem si nahrál tabulky <mark>czechia_payroll</mark> a <mark>czechia_price_category</mark>.

* [ ] Pomocí klauzule **YEAR**,  sloupce *date_from*, primární tabulky a sloupce *category_code*.

* [ ] Do **SELECTU** jsem si vložil sloupce s názvy druhu potravin, množství (získáno vydělením průměrné mzdy a průměrné ceny potravin) a rok.

* [ ] Ve **WHERE** klauzuli jsem dotaz omezil přes klauzuli **LIKE** a do něho přidal název potraviny k tomu omezení na daný rok. Pro změnu potraviny a roku stačilo prohodit mezi jednoduchými uvozovkami a procenty název. Pro změnu roku jen prohození daného roku

* [ ] Celé jsem to seskupil pomocí **GROUP BY**

* [ ] Při spouštění docházelo k pomalému rozjetí dotazu. Tento problém jsem odstranil díky indexů. Ty byly vytvořeny v mé primární tabulce. 

-------------------------------------------------------------------------------------------

3. Nejnižší percentuální meziroční narůst proběhl u papriky. U této potraviny se cena pohybovala nejpomaleji. 

* [ ] Tabulky, které jsem použil:
    <mark>czechia_price</mark>, <mark>czechia_price_category</mark>

* [ ] K odpovědi na otázku pomocí SQL dotazu jsem přistoupil takto.

* [ ] Nejdříve jsem si zjistil průměrný meziroční nárust cen potravin pomocí fuknce **AVG**.

* [ ] Použil jsem klauzuli **JOIN** na spojení kategorií potravin s cenami a jeho názvu.

* [ ] Seskupil jsem kategorie potravin díky **GROUP BY**.

* [ ] Omezil jsem přes podmínku HAVING na propojení s agregačními funkcemi.    

**--->** Za to jsem vnořeným dotazem vložil průměrnou cenu potravin.

* [ ] Nakonec jsem to celé seřadil dle průměrné ceny a limitoval na první řádek potravinu, která zdražovala nejpomaleji.

-------------------------------------------------------------------------------------------

