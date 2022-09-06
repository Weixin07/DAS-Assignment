 /*
--Q1 Faithlin
SELECT Book.BookID, Book.BookName, AVG(Review.Rating) AS 'Rating'
FROM Book LEFT JOIN ShoppingCart ON Book.BookID=ShoppingCart.BookID 
LEFT JOIN Review ON ShoppingCart.ShoppingCartID=Review.ShoppingCartID
GROUP BY Book.BookID, Book.BookName
HAVING AVG(Review.Rating) = (SELECT MAX(R.Average)
FROM (SELECT Book.BookID, Book.BookName, AVG(Review.Rating) AS Average
FROM Book LEFT JOIN ShoppingCart ON Book.BookID=ShoppingCart.BookID 
LEFT JOIN Review ON ShoppingCart.ShoppingCartID=Review.ShoppingCartID
GROUP BY Book.BookID, Book.BookName) AS R)
*/

/*
--Q2 Kayson
SELECT MemberName, ShoppingCart.MemberID,  COUNT(Review.Feedback) as 'Number of feedback per member' 
FROM ShoppingCart LEFT JOIN Review ON ShoppingCart.ShoppingCartID = Review.ShoppingCartID LEFT JOIN Member on ShoppingCart.MemberID = Member.MemberID 
WHERE Review.Rating <> 0 GROUP BY MemberName, ShoppingCart.MemberID 
*/

/*
--Q3 Hanns
SELECT Publisher.PublisherID, Publisher.PublisherName, COUNT(Book.BookID) as 'Number of books published'  
FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID 
GROUP BY Publisher.PublisherID, Publisher.PublisherName
*/

/*
--Q4 Remy
SELECT Publisher.PublisherName, SUM(SupplierOrder.OrderQuantity) as 'Total Number Of Books Ordered' 
FROM Publisher LEFT JOIN SupplierOrder ON SupplierOrder.PublisherID = Publisher.PublisherID 
GROUP BY Publisher.PublisherName
*/

/*
--Q5 Faithlin
SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.Quantity) As 'Total Books Ordered'
FROM Member LEFT JOIN ShoppingCart ON Member.MemberID = ShoppingCart.MemberID
GROUP BY Member.MemberID, Member.MemberName;
*/

/*
--Q6 Kayson
SELECT Book.BookName, SUM(ShoppingCart.Quantity) as 'Total Sold Quantity'
FROM Book INNER JOIN ShoppingCart ON ShoppingCart.BookID = Book.BookID GROUP BY Book.BookName 
HAVING SUM(ShoppingCart.Quantity) = (SELECT MAX(Quant.SumQuant) 
FROM (SELECT Book.BookName, SUM(ShoppingCart.Quantity) as SumQuant 
FROM Book INNER JOIN ShoppingCart ON ShoppingCart.BookID = Book.BookID GROUP BY Book.BookName) AS Quant)
*/

/*
--Q7 Hanns
SELECT COUNT(MemberID) as 'Total number of members', 
COUNT(CASE WHEN MemberGender = 'Male' THEN MemberGender ELSE NULL END) as 'Total male member', 
COUNT(CASE WHEN MemberGender = 'Female' THEN MemberGender ELSE NULL END) as 'Total female member' FROM Member
*/

/*
--Q8 Remy
SELECT ShoppingCart.MemberID AS 'Member Identification Number', Member.MemberAddress AS 'Member Address', Member.MemberContact AS 'Member Contact Number', ShoppingCart.BookID AS 'Book Serial Number', Book.BookName AS 'Book Name', ShoppingCart.Quantity AS 'Quantity', ShoppingCart.DateOfOrder as 'Date of Order', Delivery.Status as 'Delivery Status'
FROM ShoppingCart
INNER JOIN Member ON ShoppingCart.MemberID=Member.MemberID 
INNER JOIN Delivery ON ShoppingCart.DeliveryID=Delivery.DeliveryID
INNER JOIN Book ON ShoppingCart.BookID=Book.BookID
WHERE Delivery.Status <> 'Delivered'
*/

/*
--Q9 Hanns
SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.TotalMemberBookPrice) as Total 
FROM Member INNER JOIN ShoppingCart ON ShoppingCart.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.MemberName 
HAVING SUM(ShoppingCart.TotalMemberBookPrice) = (SELECT MAX(A.Summ) 
FROM (SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.TotalMemberBookPrice) as Summ 
FROM Member INNER JOIN ShoppingCart ON ShoppingCart.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.MemberName) AS A)
*/

/*
--Q10 Remy
SELECT Member.MemberID AS 'Member Identification Number', SUM(ShoppingCart.Quantity) AS 'Total Books Added into Shopping Cart'
FROM ShoppingCart
RIGHT JOIN Member ON ShoppingCart.MemberID=Member.MemberID
GROUP BY Member.MemberID
*/

/*
SELECT Book.BookID, Book.BookName, AVG(Review.Rating) AS 'Rating'
FROM Book LEFT JOIN ShoppingCart ON Book.BookID=ShoppingCart.BookID 
LEFT JOIN Review ON ShoppingCart.ShoppingCartID=Review.ShoppingCartID
GROUP BY Book.BookID, Book.BookName
HAVING AVG(Review.Rating) = (SELECT MAX(R.Average)
FROM (SELECT Book.BookID, Book.BookName, AVG(Review.Rating) AS Average
FROM Book LEFT JOIN ShoppingCart ON Book.BookID=ShoppingCart.BookID 
LEFT JOIN Review ON ShoppingCart.ShoppingCartID=Review.ShoppingCartID
GROUP BY Book.BookID, Book.BookName) AS R)
*/

--Additional Question
SELECT Book.BookID, SUM(ShoppingCart.Quantity) As 'Total Quantity Sold'
From ShoppingCart
Right Join Book ON ShoppingCart.BookID = Book.BookID
GROUP BY Book.BookID
HAVING SUM(ShoppingCart.Quantity) > 3