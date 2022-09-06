/*CREATE DATABASE eBookstore

CREATE TABLE Publisher(
PublisherID nvarchar(10) NOT NULL PRIMARY KEY,
PublisherName nvarchar(100) NOT NULL,
PublisherContact int NOT NULL)

CREATE TABLE Manager(
ManagerID nvarchar(10) NOT NULL PRIMARY KEY,
ManagerName nvarchar(100) NOT NULL,
ManagerContact int NOT NULL)

CREATE TABLE Category(
CategoryCode nvarchar(5) NOT NULL PRIMARY KEY,
BookCategory nvarchar(50) NOT NULL)

CREATE TABLE Member(
MemberID nvarchar(8) NOT NULL PRIMARY KEY,
MemberName nvarchar(100) NOT NULL,
MemberAddress nvarchar(150) NOT NULL,
MemberGender nvarchar(6) NOT NULL,
MemberContact int NOT NULL)

CREATE TABLE Delivery(
DeliveryID nvarchar(10) NOT NULL PRIMARY KEY,
Status nvarchar(50) NOT NULL)

CREATE TABLE Book(
BookID nvarchar(10) NOT NULL PRIMARY KEY,
BookName nvarchar(100) NOT NULL,
PublisherID nvarchar(10) FOREIGN KEY REFERENCES Publisher(PublisherID),
CategoryCode nvarchar(5) FOREIGN KEY REFERENCES Category(CategoryCode),
PublisherBookPrice int NOT NULL,
MemberBookPrice int NOT NULL)

CREATE TABLE SupplierOrder(
SupplierOrderID nvarchar(10) NOT NULL PRIMARY KEY,
ManagerID nvarchar(10) FOREIGN KEY REFERENCES Manager(ManagerID),
PublisherID nvarchar(10) FOREIGN KEY REFERENCES Publisher(PublisherID),
BookID nvarchar(10) FOREIGN KEY REFERENCES Book(BookID),
OrderQuantity int NOT NULL)

CREATE TABLE ShoppingCart(
ShoppingCartID nvarchar(10) NOT NULL PRIMARY KEY,
MemberID nvarchar(8) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar(10) FOREIGN KEY REFERENCES Book(BookID),
Quantity int NOT NULL,
TotalMemberBookPrice int NOT NULL,
DeliveryID nvarchar(10) FOREIGN KEY REFERENCES Delivery(DeliveryID),
DateOfOrder date NOT NULL)

CREATE TABLE Review(
ReviewID nvarchar(10) NOT NULL PRIMARY KEY,
ShoppingCartID nvarchar(10) FOREIGN KEY REFERENCES ShoppingCart(ShoppingCartID),
Rating int NOT NULL,
Feedback nvarchar(200))

Alter Authorization on Database::eBookstore To [sa];

INSERT INTO Publisher VALUES
('P001', 'John Wick', '01234567890'),
('P002', 'Nicki Minaj', '01122334455'),
('P003', 'Snoop Dog', '01876543210'),
('P004', 'Elison Monyet', '01234543210'),
('P005', 'Elon Musk', '01110909090'),
('P006', 'Bill Gates', '01233645282'),
('P007', 'Jack Ma', '01428792378'),
('P008', 'Mark Zuckerberg', '01280812783'),
('P009', 'Tony Stark', '01458736892'),
('P010', 'Bruce Wayne', '01967391873') 

INSERT INTO Manager VALUES
('M001', 'Dwayne Johnson', '0174827847'),
('M002', 'Jason Statham', '0164726499'),
('M003', 'Brian Oconnor', '0174927964'),
('M004', 'Vin Diesel', '01646394833'),
('M005', 'Paul Walker', '01664323655'),
('M006', 'Alexandra Daddario', '01565567890'),
('M007', 'Scarlette J.', '01234322650'),
('M008', 'Mia Khalifa', '01234626590'),
('M009', 'Lexi Lore', '01258462310'),
('M010', 'Milo Moire', '01234456990')

INSERT INTO Category VALUES
('C001', 'Horror'),
('C002', 'Thriller'),
('C003', 'Mystery'),
('C004', 'Engineering'),
('C005', 'Finance'),
('C006', 'Romance'),
('C007', 'Famillyt'),
('C008', 'Adventure'),
('C009', 'Comedy'),
('C010', 'Sci-Fi')

INSERT INTO Member VALUES
('TP012345', 'Siew Chong','Kuala Lumpur', 'Female', '0132648594'),
('TP035649', 'Daniella Parkinson','Puchong', 'Female', '0125486252'),
('TP045891', 'Haidar Hibbert','Cheras', 'Female', '0199584465'),
('TP065842', 'Khalid Mckinney','Kampar', 'Female', '0144563215'),
('TP041548', 'Patryk Singleton','Johor Bharu', 'Male', '0177885544'),
('TP016548', 'Clive Ford','Batu Pahat', 'Female', '0199665522'),
('TP098546', 'Tyreese Sanchez','Klang', 'Male', '0133665548'),
('TP015546', 'Yousef Barajas','Kemaman', 'Male', '0112563255'),
('TP046589', 'Indiana Gates','Bandar Puteri', 'Female', '0145889655'),
('TP099654', 'Cassidy Gilliam','Seremban', 'Female', '0115668599')

INSERT INTO Delivery VALUES
('1', 'Delivering'),
('2', 'Delivered'),
('3', 'Waiting Pickup'),
('4', 'Delayed'),
('5', 'Preparing')

INSERT INTO Book VALUES
('03256', 'Secret of the Vanishing Lodger', 'P003', 'C002','36','45'),
('06565', '2105: Reformation', 'P002', 'C003','48','55'),
('09855', 'Wet Wild Winter', 'P002', 'C005','42','50'),
('04562', 'The Last Pickle', 'P005', 'C006','33','40'),
('05859', 'Made for Evil', 'P007', 'C008','66','69'),
('04856', 'Zenith of Hyperion', 'P009', 'C004','74','80'),
('04221', 'Binary Light', 'P008', 'C009','14','20'),
('04859', 'The Woman in the Window', 'P008', 'C007','25','30'),
('04454', 'Touch of Wyverns', 'P004', 'C003','26','30'),
('04456', 'Clue of the Crooked Staircase', 'P001', 'C002','17','20')


INSERT INTO SupplierOrder VALUES
('1','M003', 'P003', '03256','20'),
('2','M003', 'P002', '06565','30'),
('3','M007', 'P009', '04856','40'),
('4','M007', 'P002', '09855','30'),
('5','M009', 'P005', '04562','60'),
('6','M002', 'P008', '04859','50'),
('7','M006', 'P004', '04454','20'),
('8','M006', 'P003', '03256','30'),
('9','M003', 'P007', '05859','40'),
('10','M010', 'P005', '04562','20') 

INSERT INTO ShoppingCart VALUES
('1','TP015546','09855','1','50','2','27 April 2020'),
('2','TP045891','04562','1','40','1','28 April 2020'),
('3','TP065842','06565','2','110','3','29 April 2020'),
('4','TP098546','04856','1','80','5','29 April 2020'),
('5','TP099654','09855','3','150','2','30 April 2020'),
('6','TP035649','04859','1','30','2','2 May 2020'),
('7','TP015546','04454','2','60','4','2 May 2020'),
('8','TP012345','03256','1','45','2','5 May 2020'),
('9','TP045891','09855','3','150','1','10 May 2020'),
('10','TP041548','03256','2','90','2','25 May 2020')

INSERT INTO Review VALUES
('001','1','5','Very good!'),
('002','2','0','N/A'),
('003','3','0','N/A'),
('004','4','0','N/A'),
('005','5','3','The size of the words too small'),
('006','6','4','Need more pictures'),
('007','7','0','N/A'),
('008','8','3','OK'),
('009','9','0','N/A'),
('010','10','4','Interesting!')*/

--Q4
--SELECT SUM(SupplierOrder.OrderQuantity) as 'Total Number Of Books', Publisher.PublisherName FROM SupplierOrder LEFT JOIN Publisher
--ON SupplierOrder.PublisherID = Publisher.PublisherID GROUP BY Publisher.PublisherName

--Q8
/*SELECT ShoppingCart.MemberID AS 'Member Identification Number', Member.MemberAddress AS 'Member Address', Member.MemberContact AS 'Member Contact Number', ShoppingCart.BookID AS 'Book Serial Number', Book.BookName AS 'Book Name', ShoppingCart.Quantity AS 'Quantity', ShoppingCart.DateOfOrder as 'Date of Order', Delivery.Status as 'Delivery Status'
FROM ShoppingCart
INNER JOIN Member ON ShoppingCart.MemberID=Member.MemberID 
INNER JOIN Delivery ON ShoppingCart.DeliveryID=Delivery.DeliveryID
INNER JOIN Book ON ShoppingCart.BookID=Book.BookID
WHERE Delivery.Status <> 'Delivered'
*/

--Q10
/*SELECT Member.MemberID AS 'Member Identification Number', SUM(ShoppingCart.Quantity) AS 'Total Books Added into Shopping Cart'
FROM ShoppingCart
RIGHT JOIN Member ON ShoppingCart.MemberID=Member.MemberID
GROUP BY Member.MemberID
*/


