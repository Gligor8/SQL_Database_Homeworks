USE SEDCHome

/*
Calculate the count of all grades in the system
Calculate the count of all grades per Teacher in the system
Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
Find the Maximal Grade, and the Average Grade per Student on all grades in the system
*/

SELECT SUM(Grade) as Total	
from dbo.[Grade]
GO

SELECT b.ID, SUM(Grade) as Total
FROM dbo.[Grade] o
join dbo.Teacher b on o.ID = b.ID
GROUP BY b.ID
GO

SELECT b.ID, SUM(Grade) as Total
FROM dbo.[Grade] o
join dbo.Teacher b on o.ID = b.ID
WHERE StudentID < 100  
GROUP BY b.ID
Order by SUM(Grade) desc
GO

SELECT b.FirstName, b.LastName as StudentName
,Max(Grade) as Total, AVG(Grade) as AverageAndMaxGrade
FROM dbo.[Grade] o
join dbo.Student b on o.ID = b.ID
GROUP BY b.ID, b.id
GO
