USE SEDCHome

SELECT FirstName
FROM Teacher
UNION ALL
SELECT FirstName 
FROM Student
GO

SELECT LastName
FROM Teacher
UNION
SELECT LastName
FROM Student
GO

SELECT FirstName
FROM Student
INTERSECT
SELECT FirstName
FROM Teacher
GO