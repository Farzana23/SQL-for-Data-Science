/*ER Diagram: https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png*/



/*Using a subquery, find the names of all the tracks for the album "Californication".*/

SELECT Name
FROM Tracks
WHERE AlbumID IN 
        (Select AlbumID
        From Albums
        Where Title = 'Californication');
		
/*Find the total number of invoices for each customer along with the customer's full name, city and email.*/

Select c.Firstname, c.Lastname, c.Email, c.City, Count (i.InvoiceId) AS Totalinvoice
FROM Customers AS c 
INNER JOIN Invoices AS i 
ON c.Customerid = i.Customerid
Group By c.Customerid

/*Retrieve the track name, album, artistID, and trackID for all the albums.*/

SELECT t.name, t.TrackId, a.Title, a.AlbumId, ar.ArtistId
From Albums AS a 
INNER JOIN Artists AS ar ON ar.ArtistId=a.ArtistId
INNER JOIN Tracks AS t ON a.AlbumId=t.AlbumId

/*Retrieve a list with the managers last name, and the last name of the employees who report to him or her.*/

SELECT m.LastName AS Manager, e.LastName AS Employee
FROM Employees AS e INNER JOIN Employees AS m
ON e.ReportsTo=m.EmployeeId


/*Find the name and ID of the artists who do not have albums. */

SELECT ar.Name, ar. ArtistId, a.Title
FROM Artists AS ar 
LEFT JOIN Albums AS a 
ON ar.ArtistId=a.ArtistId
WHERE a.AlbumID IS NULL


/*Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.*/

SELECT FirstName, LastName
FROM Employees 
UNION
SELECT FirstName, LastName
FROM Customers 
ORDER BY LastName Desc

/*See if there are any customers who have a different city listed in their billing city versus their customer city.*/

SELECT c.FirstName, c.LastName, c.City, i.BillingCity
FROM Customers AS c 
INNER JOIN  Invoices AS i 
ON c.CustomerId=i.CustomerId
WHERE c.City != i.BillingCity
