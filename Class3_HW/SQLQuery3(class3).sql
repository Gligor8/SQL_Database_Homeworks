USE SEDCHome

/*
 Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
 Change the view to show Student First and Last Names instead of StudentID
 List all rows from view ordered by biggest Grade Count
 Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit) 
 */

CREATE VIEW StudentGrades
AS
select StudentID,SUM(Grade) as GradesPerStudent
from dbo.[Grade] o
group by StudentID
GO

ALTER VIEW vv_CustomerOrders
AS
select c.FirstName as StudentFirstName, c.LastName as StudentLastName, SUM(Grade) as GradesPerStudent
from dbo.[Grade] o
inner join dbo.Student c on o.StudentId = c.ID
group by c.FirstName
order by SUM(Grade) desc
GO

CREATE OR ALTER VIEW vv_StudentGradeDetails
AS 
select e.FirstName + ' ' + e.LastName as Student, p.ID as ProductName,
sum(AchievementPoints) as ExamsPassed

from dbo.[Grade] o
inner join dbo.Student e on o.StudentID = e.ID
inner join dbo.GradeDetails od on o.ID = od.GradeID
inner join dbo.Grade p on od.ID = p.ID
inner join dbo.AchievementType be on o.CourseID = be.ID
where be.Description = 'Испит'
group by e.FirstName + ' ' + e.LastName, p.ID
GO -- ova baranje bese malku tesko za snaogjanje