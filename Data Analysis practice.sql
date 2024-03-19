show Tables;
desc sales;

select * from sales;

select SaleDate, Amount,  Customers, Boxes from sales; 
select  Amount,Customers, GeoID from sales;

select SaleDate, Amount,Boxes, Amount/Boxes from sales;

select SaleDate, Amount,Boxes, Amount/Boxes as amtperbox from sales;

select * from sales
where Amount > 10000;

select * from sales
where Amount > 10000
order by Amount Desc;

select * from sales
where GeoID = "G1"
order by pid , Amount Desc;

select * from sales
where Amount > 10000 and SaleDate >= "2022-01-01";

select * from sales
where Amount > 10000 and year (SaleDate) = 2022;

select * from sales
where Boxes >0 and Boxes <= 50;

select * from sales 
where Boxes between 0 and 50
order by Boxes;

select *, weekday(SaleDate) as "Date of week" from sales
where weekday(SaleDate) = 4;

select * from people;

select * from people
where Team = "Delish" or team = "Jucies";

select * from people 
where team in ("Delish", "Jucies");

select * from people 
where Salesperson like "b%";

select * from people 
where Salesperson like "%b%";

select * from sales;

select SaleDate, Amount,
		case when Amount < 1000 then "under 1k"
			when Amount < 5000 then "under 5k"
            when Amount < 10000 then "under 10k"
		else "10k or more" end as "Amount Category"
from sales ;

