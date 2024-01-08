
select * from Credit_card

--Limiting Rows 
select top 10 * from credit_card

--Sorting the data by transaction date - [2013-10-04] asc and [2015-05-26] desc
select * from credit_card order by transaction_date desc

--Sorting and finding the highest amount - (998077/-)
select * from credit_card order by transaction_date,amount,city,gender

--all the Transactions where city has "a" as second character and "d" as fourth character
select city from Credit_card where city like '_a%' and city like '____d%'

--all the transactions placed in the month of dec 2014
select * from Credit_card where month(transaction_date)=12 and year(transaction_date) = 2014

--all the transaction where type is neither in 'Gold' nor in 'Silver' and transaction_date is after nov 2013
select * from Credit_card where card_type not in ('Gold', 'silver') 
and year(transaction_date) > 2013 and month(transaction_date) >11

--write a query to find top 5 cities with highest number of transactions in Platinum category
select distinct top 5 city,count(transaction_date) as "Number of Transactions" from Credit_card 
where card_type = 'Platinum' 
group by transaction_date,city
order by "Number of Transactions" desc, city asc

select cast(transaction_date as date) from Credit_card

--Adding a new column
select *, amount/10 as mutliple from Credit_card

--Like operator
select city from Credit_card where city like 'A[^ho]%' 
select distinct city from Credit_card where city  like 'A[nr]%' order by city asc
select distinct city from credit_card where city not like 'A[a-e]%' order by city 
select distinct city from credit_card where city not like 'A%' and city not like '_o%' order by city
select distinct city from credit_card where city not like 'A%o'order by city

--Aggregation
-- total no of records
select count(*) from credit_card
select count(1) from credit_card

select * from credit_card  where card_type is null
update credit_card set card_type = null where city = 'Surat'

--Total amount of cities Bangalore, Delhi, Anakapalle, Hyderabada and Ahmedabad greater than 1100000 
select sum(amount) as total_amount,city from credit_card 
where city in ('Bengaluru', 'Delhi','Anakapalle','Hyderabad','Ahmedabad') 
group by city
having sum(amount) > 559000

--cte(Common table expression)
with total_amount(total_amount_per_cardtype) as 
(select sum(amount) as total_amount_per_cardtype from credit_card group by card_type),
average_amount (avg_total_amount) as
(select avg(total_amount_per_cardtype) as avg_total_amount from total_amount )
select *  from average_amount av join total_amount ta on ta.total_amount_per_cardtype > av.avg_total_amount



