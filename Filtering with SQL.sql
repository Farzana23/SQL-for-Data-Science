/*Answers to questions using ER diagram https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png*/

/*Find all the tracks that have a length of 5,000,000 milliseconds or more*/

select trackId
,Milliseconds
from Tracks
where Milliseconds >= 5000000

/*Find all the invoices whose total is between $5 and $15 dollars*/

select InvoiceId
,Count (InvoiceId) As Count
From Invoices
Where Total Between 5 and 15

/*Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY*/

Select FirstName, LastName, Company, State
From Customers 
Where State In ('RJ','DF','AB','BC','CA','WA','NY')

/*Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00*/

select customerID, total, InvoiceDate, InvoiceID
From Invoices
where customerID IN (56,58) and Total Between 1 and 5

/*Find all the tracks whose name starts with 'All'*/

select trackID, Name,
Count (trackID) As TotalTrack
From Tracks
Where Name Like 'All%'

/*Find all the customer emails that start with "J" and are from gmail.com*/

select *
From customers 
where email Like 'j%@gmail.com'

/*Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID*/

select InvoiceID, BillingCity, Total
from invoices 
where BillingCity In ('Brasília', 'Edmonton', 'Vancouver')
order by InvoiceID desc

/*Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order*/

select customerID, 
count (Distinct InvoiceID) As No_of_Orders
From Invoices
group by customerID
Order By No_of_Orders desc

/*Find the albums with 12 or more tracks*/

select *, 
count (distinct TrackID) As No_of_tracks
from Tracks
Group by AlbumID
Having No_of_tracks >=12




