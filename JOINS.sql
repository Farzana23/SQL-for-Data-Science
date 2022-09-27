/*How many albums does the artist Led Zeppelin have?*/

select artists.name,Count(albums. albumID) As totalalbums
from artists 
inner join albums 
ON artists.artistID=albums.artistID
where artists.name='Led Zeppelin'

/*Create a list of album titles and the unit prices for the artist "Audioslave"*?

SELECT ar.Name, al.Title, t.UnitPrice
FROM albums AS al 
INNER JOIN artists AS ar ON al.ArtistID=ar.ArtistID
INNER JOIN tracks AS t ON al.Albumid=t.Albumid
Where ar.Name='Audioslave' 

/*Find the first and last name of any customer who does not have an invoice.*/

SELECT c.FirstName, c.LastName, i.Invoiceid
FROM Customers AS c 
LEFT JOIN Invoices AS i 
ON c.Customerid=i.Customerid
Where i.Invoiceid IS NULL

/*Find the total price for each album. What is the total price for the album “Big Ones”?*/

select a.Title, SUM(t.UnitPrice)
From albums AS a 
LEFT JOIN tracks AS t ON a.AlbumID=t.AlbumID
Where a.Title='Big Ones'
Group By a.Title

/*How many records are created when you apply a Cartesian join to the invoice and invoice items table?*/

SELECT invoices.invoiceId
FROM invoices CROSS JOIN invoice_items




