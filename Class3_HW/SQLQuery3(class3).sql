USE SEDCHome

/*
 Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
 Change the view to show Student First and Last Names instead of StudentID
 List all rows from view ordered by biggest Grade Count
 Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit) 
 */

CREATE VIEW StudentGrades
AS
select StudentID, count(Grade) as GradesPerStudent
from dbo.[Grade] 
group by StudentID
GO

ALTER VIEW vv_StudentGrades
AS
select c.FirstName as StudentFirstName, c.LastName as StudentLastName, COUNT(Grade) as GradesCount
from dbo.[Grade] g
inner join dbo.Student as c on g.StudentID = c.ID
group by c.FirstName, c.LastName
GO

select * from vv_StudentGrades
order by GradeCount desc
go

-----------------------------------

drop view if exists vv_StudentGradeDetails;
GO


CREATE VIEW vv_StudentGradeDetails
AS
SELECT s.FirstName + N' ' + s.LastName as StudentName, COUNT(g.CourseID) as CourseCount
FROM Grade as g
INNER JOIN Student as s ON g.StudentID = s.ID
INNER JOIN GradeDetails as gd ON g.ID = gd.GradeID
INNER JOIN AchievementType as a on gd.AchievementTypeID = a.ID
WHERE a.Name = 'Ispit'
GROUP BY s.FirstName, s.LastName
GO