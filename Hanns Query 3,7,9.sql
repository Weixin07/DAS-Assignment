--Q3
/*
SELECT Publisher.PublisherID, Publisher.PublisherName, COUNT(Book.BookID) as 'Number of books published'  
FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID GROUP BY Publisher.PublisherID, Publisher.PublisherName
*/

--Q7
/*
SELECT COUNT(MemberID) as 'Total number of members', 
COUNT(CASE WHEN MemberGender = 'Male' THEN MemberGender ELSE NULL END) as 'Total male member', 
COUNT(CASE WHEN MemberGender = 'Female' THEN MemberGender ELSE NULL END) as 'Total female member' FROM Member
*/

--Q9
/*
SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.TotalMemberBookPrice) as Total 
FROM Member INNER JOIN ShoppingCart ON ShoppingCart.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.MemberName 
HAVING SUM(ShoppingCart.TotalMemberBookPrice) = (SELECT MAX(A.Summ) 
FROM (SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.TotalMemberBookPrice) as Summ 
FROM Member INNER JOIN ShoppingCart ON ShoppingCart.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.MemberName) AS A)
*/
/*
SELECT Member.MemberID, Member.MemberName, SUM(ShoppingCart.TotalMemberBookPrice) as Total 
FROM Member INNER JOIN ShoppingCart ON ShoppingCart.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.MemberName 
*/