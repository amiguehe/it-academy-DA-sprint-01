#ex2
Select company_name, email, country FROM company
Order by company_name ASC;


#ex 3
select country 
from company
inner join transaction on company_id=company.id
group by country 
order by country asc;


#ex 4
SELECT sum(count(distinct country)) over() as total_countries_ordering
from company
JOIN transaction ON company_id = company.id;
	#15 países han hecho compras

#ex 5
select country, company_name from company where (company.id= 'b-2354');
	#La empresa es Ac Libero Inc. de United Kingdom (Reino Unido)

#ex 6
select company_name, avg(amount)
from company
inner join transaction 
where company_id = company.id
group by company_name
order by avg(amount) desc limit 1;
	#La empresa con mayor gasto medio es Eget Ipsum Ltd con 473.0750000

#ex 2.1
SELECT company.id, count(*) FROM company GROUP BY company.id;
	#No se han encontrado empresas con identificadores duplicados.

#ex 2.2
SELECT SUM(amount) as total_amount, date(timestamp)
FROM transaction
GROUP BY date(timestamp)
order by total_amount desc limit 5;
	#los días con mas ventas fueron: el 29 de marzo de 2021 con un total de 1564,87, 20 de diciembre de 2021 con 1532,36 el 15 de junio de 2021 con 1469,90, 9 de mayo con 1463,73 y el 21 de junio de 2021 con 1443,11

#ex 2.3
SELECT SUM(amount), date(timestamp)
FROM transaction
GROUP BY date(timestamp)
order by sum(amount) asc limit 5;
	#los dias con menos ventas fueron: el 4 de enero de 2022 con 15,05, 27 de abril con 18,08, el 24 de enero de 2022 con 23,86, 27 de febrero de 2022 con 30,76 y el 14 de enero de 2022 con 37,55.

#ex 2.4
select country, avg(amount)
from company
inner join transaction 
where company_id = company.id
group by country
order by avg(amount) desc;

#ex 3.1

select country, company_name, phone, amount
from company
join transaction
where company.id = company_id
and amount between 100 and 200
group by country, company_name, phone, amount
order by amount desc;

#ex 3.2
select  date(timestamp) as date, company_name as name
from company
join transaction
where company.id = company_id
and date(timestamp) in ("2022-03-16", "2022-02-28", "2022-02-13")
order by date(timestamp) asc;
