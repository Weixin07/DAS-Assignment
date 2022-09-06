/* 
--Q1 Faithlin
SELECT ShoppingCart.BookID, Book.BookName, Review.Rating
FROM ShoppingCart, Book, Review
WHERE ShoppingCart.BookID = Book.BookID AND ShoppingCart.ShoppingCartID = Review.ShoppingCartID AND Rating = 5;
*/

/*
--Q2 Kayson
SELECT membername, shoppingcart.memberid, shoppingcart.shoppingcartID,  count(review.feedback) as 'Number of feedback per member' 
from shoppingcart left join review on shoppingcart.shoppingcartid = review.shoppingcartID left join member on Shoppingcart.memberid = member.memberid 
group by shoppingcart.shoppingcartID, membername, shoppingcart.Memberid
*/

/*
--Q3 Hanns
SELECT Publisher.PublisherID, Publisher.PublisherName, COUNT(Book.BookID) as 'Number of books published'  
FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID GROUP BY Publisher.PublisherID, Publisher.PublisherName
*/

/*
--Q4 Remy
SELECT SUM(SupplierOrder.OrderQuantity) as 'Total Number Of Books', Publisher.PublisherName FROM SupplierOrder LEFT JOIN Publisher
ON SupplierOrder.PublisherID = Publisher.PublisherID GROUP BY Publisher.PublisherName
*/

/*
--Q5 Faithlin
SELECT MemberID, COUNT(BookID) As Total_Books 
FROM ShoppingCart
GROUP BY MemberID;
*/

/*
--Q6 Kayson
SELECT TOP(1) bookname, SUM(Quantity) AS TotalQuantity
FROM shoppingcart INNER JOIN BOOK ON Shoppingcart.BOOKid = BOOK.BOOKid
GROUP BY bookname
ORDER BY SUM(Quantity) DESC;
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