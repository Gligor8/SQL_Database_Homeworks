USE SEDCHome

/*
Calculate the count of all grades in the system
Calculate the count of all grades per Teacher in the system
Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
Find the Maximal Grade, and the Average Grade per Student on all grades in the system
*/

SELECT Count(Grade) as Total	
from dbo.[Grade]
GO

SELECT TeacherID, count(Grade) as GradeCount
FROM dbo.Grade
GROUP BY TeacherID
order by TeacherID
GO

SELECT TeacherID, count(Grade) as GradeCount
FROM dbo.Grade, dbo.Student s
where StudentID < 100
GROUP BY TeacherID
order by TeacherID
GO

SELECT StudentId, Max(Grade) as MaxGrade, AVG(Cast(Grade as decimal(4,2))) as AverageGrade
FROM dbo.Grade
GROUP BY StudentId
ORDER BY StudentID
GO
