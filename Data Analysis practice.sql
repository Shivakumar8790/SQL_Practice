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

select * from sales;
select * from people;

select s.*, p.* from sales s
join people p on s.SPID = p.SPID;

select * from products;

select s.*, p.* from sales s 
left join products p on s.PID = p.PID;

select s.*, p.*, po.* from sales s
join people p on s.SPID = p.SPID
left join products po on s.PID = po.PID;

select s.*, p.*, po.* from sales s
join people p on s.SPID = p.SPID
left join products po on s.PID = po.PID
where s.Amount < 500 and p.Team = "Delish"
order by s.Amount DESc;

select s.*, p.*, pr.* from sales s
join people p on s.SPID = p.SPID
left join products pr on s.PID = pr.PID
where s.Amount < 111500 and p.Team = ""
order by s.Amount DESc;

select s.*, p.*, pr.* ,g.* from sales s
join people p on s.SPID = p.SPID
left join products pr on s.PID = pr.PID
join geo g on s.GeoID = g.GeoID
where s.Amount < 111500 and p.Team = ""
order by s.Amount DESc;

select s.*, p.*, pr.* ,g.* from sales s
join people p on s.SPID = p.SPID
left join products pr on s.PID = pr.PID
join geo g on s.GeoID = g.GeoID
where s.Amount < 111500 and p.Team = ""
and g.Geo in ("UK", "New Zeland")
order by s.Amount DESc;

select g.geo , s.GeoID, sum(s.Amount) as Toal_amount , avg(s.Amount) as avg_amount,
sum(s.Boxes) as "No.ofboxes"
from sales s join geo g on s.GeoID = g.GeoID
group by s.GeoID;

select pr.Category, p.Team, sum(Boxes), sum(Amount) 
from sales s 
join people p on s.spid = p.spid
join products pr on pr.pid  = s.pid
where p.team <> ""
group by pr.Category, p.Team
order by pr.Category, p.Team;

select pr.Category, p.Team, sum(Boxes) as totalboxes, sum(Amount) 
from sales s 
join people p on s.spid = p.spid
join products pr on pr.pid  = s.pid
where p.team <> ""
group by pr.Category, p.Team
order by pr.Category, p.Team desc
limit 15;

select pr.Category, p.Team, sum(Boxes) as totalboxes, sum(Amount) 
from sales s 
join people p on s.spid = p.spid
join products pr on pr.pid  = s.pid
where p.team <> ""
group by pr.Category, p.Team
having totalboxes > 200000
order by pr.Category, p.Team desc;


-- Find the total amount of chocolate sold
select Customers, (Amount) as Total_amount from sales;

-- Find the most popular chocolate (by total boxes sold):
select PID, sum(Boxes) as Totalboxessold 
from sales
group by PID
order by sum(Boxes) DESC
limit 1;

-- Find the average amount spent per customer:
select avg(Amount/Customers) as AverageSpentPerCustomer from sales;

-- Find the top 3 salespeople by total sales:
select p.Salesperson, sum(s.Amount) as Total_Amount 
from sales s
join people p on s.SPID = p.SPID
group by p.Salesperson
order by Total_Amount Desc
limit 3;

-- Find the chocolates that have never been sold:
select p.PID, p.Product,s.PID from products p
left join sales s on p.PID = s.PID
where s.PID is null;

select Customers, sum(Amount) as TotalSpent
from sales
group by Customers
Having TotalSpent > 50000;

select month(SaleDate) as Salemonth, sum(Amount) as TotalSales
from sales
group by month(SaleDate)
order by Salemonth ;

select s.PID, p.Product, s.Amount -(p.Cost_per_box * s.Boxes) as profit
from sales s 
join products p on p.PID = s.PID;

drop view if exists SalesPersonPerformance;
create view SalesPersonPerformance as
	select p.Salesperson, sum(s.Amount) as TotalSales, Avg(s.Amount) as AverageSales
    from people p 
    join sales s on s.SPID = p.SPID
    GROUP BY Salesperson;
SHOW CREATE VIEW SalesPersonPerformance;

SELECT * FROM SalesPersonPerformance;

select p.SPID, p.salesperson, sum(s.Amount) as total_amount
 from people p
 join sales s on s.SPID = p.SPID
 join products pr on pr.PID = s.PID
 where pr.product = "Milk Bars"
 group by p.SPID, p.salesperson
 order by total_amount desc;
