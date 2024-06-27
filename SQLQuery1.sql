CREATE DATABASE LibraryDb

USE LibraryDb

CREATE TABLE Authors
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(100) NOT NULL,
Surname VARCHAR(100) NOT NULL
)

 
CREATE TABLE Books
(
Id INT PRIMARY KEY IDENTITY,
FullName VARCHAR(150) NOT NULL,
PageCount INT CHECK(PageCount > 0),
CostPrice DECIMAL(18,2),
SalePrice DECIMAL(18,2),
AuthorId INT FOREIGN KEY REFERENCES Authors(Id)
)


CREATE TABLE Tags
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(100) NOT NULL,
)


CREATE TABLE BookTags
(
Id INT PRIMARY KEY IDENTITY,
BookId INT FOREIGN KEY REFERENCES Books(Id),
TagId INT FOREIGN KEY REFERENCES Tags(Id)
)

INSERT INTO Authors
VALUES
('Khaled', 'Hosseini'),
('Sabahattin','Ali'),
('Victor','Hugo'),
('George','Orwell'),
('John','Steinbeck')
 
INSERT INTO Books
VALUES
('Hayvan Ciftligi', 152, 7, 12, 4),
('1984', 352, 11.50, 19.99, 4),
('Uçurtma Avcısı', 375, 10, 18, 1),
('Bin Muhteşem Güneş', 430, 12, 16.99, 1),
('İçimizdeki Şeytan', 256, 7.25, 21.55, 2),
('Bir İdam Mahkûmunun Son Günü', 120, 5.99, 11.99, 3),
('Notre Dameın Kamburu', 559, 20.99, 29.99, 3),
('Fareler ve Insanlar', 112, 9.50, 15.99, 5),
('inci', 102, 7, 10.85, 5)


INSERT INTO Tags
VALUES
('BestSeller'),
('MostRead'),
('Featured'),
('New')

INSERT INTO BookTags
VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(2,4),
(3,1),
(3,2),
(4,3),
(5,3),
(6,1),
(6,2),
(6,4),
(8,1),
(8,2),
(8,3),
(8,4)

SELECT B.Id, CONCAT(A.Name, ' ', A.Surname) AS AuthorFullName, B.FullName AS BookName, B.SalePrice AS BookPrice, B.PageCount AS PageCount, T.Name  FROM Authors as A
INNER JOIN Books as B
ON B.AuthorId = A.Id
INNER JOIN BookTags as BT
ON BT.BookId = B.Id
INNER JOIN Tags as T
ON T.Id = BT.TagId



SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM Tags
SELECT * FROM BookTags
