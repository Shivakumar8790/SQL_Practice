-- Find the most common city among customers. 
select city , count(*) as city_count
FROM customer
JOIN address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
group by city
order by city_count desc
limit 9;

-- Update all customer email addresses to lowercase.
update customer
set email = lower(email);
select * from customer;

-- How can you efficiently update the email addresses for all customers in sasebo to lowercase?
update customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
set customer.email = lower(customer.email)
where city = "Sasebo";

select * from customer;


USE world;

select Name, char_length(Name) as Name_length from city;
select Name, character_length(Name) as Name_length from city;

select concat(ID ," # ", Name, " # ", CountryCode) as full_details from city;

select reverse(concat(ID ," # ", Name, " # ", CountryCode)) as full_details from city;

select replace("GFA # rahadnaQ # 2"," ","#");

select length("        Shiva      ");
select ltrim("        Shiva      ");
select length(ltrim("        Shiva      "));
select rtrim("        Shiva      ");
select length(rtrim("        Shiva      "));
select trim("        Shiva      ");
select length(trim("        Shiva      "));

select position("fruit" in "Orange is a fruit") as position;

#American Standard Code for Information Interchange
select ascii("a"); 
select ascii("4");

show Tables;
select * from city;

select Name, round(avg(Population),1) as Avg_population from city
group by Name;

select count(District), Name from city
group by Name 
order by count(District) desc;


select * from city;

use sys;

select * from sys_config;
Create database sales;

create table C_product (product_id int, cost int);
insert into C_product values(1, 155.3);
select * from C_product;

use world;

select s.Continent, sum(c.Population) as Total_population from city as c inner join Country as s
where s.Name = c.Name
group by s.Continent;

select s.Continent, sum(c.Population) as Total_population from city as c inner join Country as s
where s.Name = c.Name
group by s.Continent;

select Name, Avg(Population) as Total_population from city 
group by Name 
having avg(Population)> 1900000;

select Name, Avg(Population) as Total_population from city 
where ID between 100 and 200
group by Name 
having avg(Population)> 1900000;

select Continent, count(*) as No_of_countries from country
group by Continent
having count(*) > 14;

select Continent, count(*) as No_of_countries from country
where Continent != "Asia"
group by Continent
having count(*) > 14;

use sakila;

select * from customer;



select * from customer
where store_id = 2;

SELECT * FROM customer
ORDER BY first_name, last_name;

select * from customer
where email is not null;

select * from customer
where email is null;

select * from customer
limit 22;

use world;

select * from country;

SELECT Name, ROW_NUMBER() OVER (PARTITION BY Continent ORDER BY Name)
FROM country;

Select Name, Region, Population, lead(Population) over (partition by Continent order by Region) as Next_country_population
from country;

Select Name, Region, Population, lag(Population) over (partition by Continent order by Region) as Next_country_population
from country;

select Continent, Region, count(*) over(partition by Continent, Region)
from country;

select min(population), max(population), avg(population), sum(population), count(population)
from country;

select * from country
where Name like "%dia%";

select * from country
where GNP between 1000 and 4000;

select * from city
inner join countrylanguage
on city.CountryCode = countrylanguage.CountryCode;

select * from city
inner join country
on city.Name = country.Name;

select * from city
left join country
on city.Name = country.Name;

select * from countrylanguage
left join city
on city.CountryCode = countrylanguage.CountryCode;

select * from countrylanguage
left join city on city.CountryCode = countrylanguage.CountryCode;

SELECT Region, sum(Population) FROM country
GROUP BY Region
HAVING sum(Population)> 1000000000;

select Name from country
union
select Name from city;

select Continent, count(*), sum(Population)
from country
group by Continent;

select Continent, count(*), sum(Population)
from country
group by Continent
having count(*) > 20;

use sakila;

select * from customer;
select concat(first_name,"#",last_name) from customer;


select first_name, Lead(email) over(partition by store_id order by last_name) from customer;

SELECT first_name, ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY create_date)
FROM customer;


use world;
select * from country;

select Region, avg(GNP) as Avg_GNP from country
group by Region;

select Region, avg(GNP) as Avg_GNP from country
group by Region
order by Avg_GNP DESC
limit 15;

# Joints

select country.Continent, sum(city.Population) as Total_population from city inner join country
where country.Name = city.Name
group by country.Continent;

select country.Continent, city.Population as Total_population from city inner join country
where country.Name = city.Name;

select country.Continent, city.Population as Total_population from city inner join country
on country.Name = city.Name;

select country.Continent, avg(city.Population) as Avg_population from city inner join country
using (Name)
group by country.Continent;

select distinct(Continent) from country;

select * from countrylanguage;

select CountryCode, sum(Percentage) as Total from countrylanguage
group by CountryCode;

select co.Region, avg(cc.Percentage) from countrylanguage as cc inner join city as ci
using(CountryCode) inner join country as co using (Name)
group by co.Region;

select country.Continent, avg(city.Population) as Avg_population from city right join country
using (Name)
group by country.Continent;

select country.Continent, avg(city.Population) as Avg_population from city right join country
using (Name)
group by country.Continent
having Avg_population is null;

select cl.Language, sum(ci.Population * cl.Percentage) from countrylanguage as cl inner join city as ci
using(CountryCode) inner join country as co using (Name)
where cl.IsOfficial = "T"
group by cl.Language;

SHOW databases;

USE world;
Show Tables;
describe city;

select * from city;

select distinct Continent from country;

select count(Name) as No_of_Countries from country ;

select sum(Population) as Total_population from city ;

select avg(Population) as Avg_population from city ;

select * from city where Population > 350468;

select * from city where Name = "Kabul";
select * from city where Name in ( "Kabul", "Haag");

select * from city where Population between 350468 and 800000;

select CountryCode, sum(Population) as Total_population from city
group by CountryCode ;

Select * from City order by Population desc;

select (20+30) as sum;

# String Functions;

select length("Shiva") as len;

show databases;
use world;

select * from city where
Population = (select max(Population) from city);

select * from city where
Population > (select avg(Population)from city);

2:32
