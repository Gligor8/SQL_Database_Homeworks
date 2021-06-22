use SEDCHome

SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

SELECT * 
FROM Student
WHERE DateOfBirth > '01.01.1999'
GO

SELECT * 
FROM Student
WHERE Gender = 'M'
GO

SELECT * 
FROM Student
WHERE LastName like 'T%'
GO

SELECT * 
FROM Student
WHERE EnrolledDate >='1998.01.01' and EnrolledDate < '1998.02.01'
GO

SELECT * 
FROM Student
WHERE EnrolledDate >='1998.01.01' and EnrolledDate < '1998.02.01'
and LastName like 'J%'
GO	