%sql

--checking headers
SELECT * FROM `workspace`.`default`.`sales` limit 10;

--checking for duplicate rows
SELECT * FROM `workspace`.`default`.`sales`;
SELECT DISTINCT* FROM `workspace`.`default`.`sales`;


--checking for rows containing nulls
select* from `workspace`.`default`.`sales`
where date is null or Sales is null or `Cost Of Sales` is null or `Quantity Sold` is null;

--Date

---Earliest and latest date are 2013-12-30 and 2016-11-16
Select max(Date) as latest, min(Date) as Earliest
from Sales;

--month names and day names
Select date, monthname(date) as MonthName, dayname(date) as DayName, year(date) as Year, date_part('month',date)
from Sales;

--divide by quater
Select date, monthname(date) as MonthName,date_part('month',date) as MonthNo,
Case
When MonthNo in('1','2','3') then 'Q1'
When MonthNo in('4','5','6') then 'Q2'
When MonthNo in('7','8','9') then 'Q3'
When MonthNo in('10','11','12') then 'Q4'
end as Quarter
from Sales;

--Sales
--price and cost per unit sold round to 2 dec
Select Sales,`Cost Of Sales`,`Quantity Sold`, Round(Sales/`Quantity Sold`, 2) as PricePerUnit, Round(`cost of sales`/`Quantity Sold`, 2) As CostPerUnit
from Sales;

--avg unit sales price
Select avg(Round(Sales/`Quantity Sold`, 2)) as avgprice
from Sales;

--daily gp%
select date, round((Sales-`Cost Of Sales`)/Sales,2) as gppercentage
from Sales;

--daily gp per unit
select date, round((sales-`Cost Of Sales`)/`Quantity Sold`, 2) as gpperunit
from Sales;

Select Date, monthname(date) as MonthName, dayname(date) as DayName, year(date) as Year,date_part('month',date) as MonthNo,
Case
When MonthNo in('1','2','3') then 'Q1'
When MonthNo in('4','5','6') then 'Q2'
When MonthNo in('7','8','9') then 'Q3'
When MonthNo in('10','11','12') then 'Q4'
end as Quarter,
Round(Sales, 2) as Sales, Round(`Cost Of Sales`, 2) as CostOfSales,Round(Sales-`Cost Of Sales`, 2) as GrossProfit, `Quantity Sold`, Round(Sales/`Quantity Sold`, 2) as PricePerUnit, Round(`cost of sales`/`Quantity Sold`, 2) As CostPerUnit
from Sales;

