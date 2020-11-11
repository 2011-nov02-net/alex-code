select * from Customer
Where Country != 'USA';

select * from Customer
Where Country = 'Brazil';

select * from Employee
where Title = 'Sales Support Agent';

select BillingCountry from Invoice
group by BillingCountry;

select count(*) as count, sum(Total) as Total from Invoice 
where InvoiceDate like '%2009%'

select count(*) as count from Invoice
where CustomerId = 37

select BillingCountry,count(*) as count from Invoice
group by BillingCountry

select BillingCountry,count(*) as NumSales, sum(Total) as Total from Invoice
group by BillingCountry 
order by sum(Total) DESC;