/* All analysis done for the Chinook Database Schema https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png*/

/*Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)*/

select 
    customerid
    ,firstname ||" "|| lastname AS FullName
    , address
    , UPPER (city ||" "|| country) AS CityCountry
from customers

/*Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.*/

select 
    firstname
    ,lastname
    ,LOWER (SUBSTR (firstname,1,4)) || LOWER (SUBSTR (lastname,1,2)) AS Newid
from Employees

/*Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.*/

SELECT FirstName
       ,LastName
       ,HireDate
       ,(STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) 
          - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) 
          AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC

/*Profiling the Customers table to find if there any column with NULL value*/

select Count(*)
from customers 
where [columne_name] IS NULL

/*column_name= address, phone, fax, postalcode, company, firstname*/

/*Find the cities with the most customers and rank in descending order.*/

select 
  city
  ,count(customerid)
from customers
group by city
order by count(customerid) desc

/*Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.*/

SELECT       
    c.firstname
    ,c.lastname
    ,i.invoiceid
    ,c.firstname||c.lastname||i.invoiceid AS NewID
FROM customers c INNER JOIN invoices i 
    ON c.customerId=i.customerId
Order By 
    c.firstname
    ,c.lastname
    ,i.invoiceid













