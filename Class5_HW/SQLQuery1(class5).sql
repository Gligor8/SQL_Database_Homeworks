--Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) who passed the exam, together with Grade and CreatedDate
use SEDCHome

DROP FUNCTION IF EXISTS dbo.fn_PassedExamByTeachersStud;
GO

CREATE FUNCTION dbo.fn_PassedExamByTeachersStud (@TeacherID int, @CourseID int)
RETURNS @output TABLE (FirstName nvarchar(100), LastName nvarchar(100), Grade int, CreatedDate date, AchievementPoints tinyint)
as
begin


		insert into @output

		select s.FirstName as FirstName, s.LastName as LastName, g.Grade as Grade, g.CreatedDate as CreatedDate, d.AchievementPoints as Achievementpoints
		from dbo.[Teacher] t
		inner join dbo.Student s on t.ID = s.ID
		inner join dbo.Course c on t.ID = c.ID
		inner join dbo.Grade g on s.ID = g.ID
		inner join dbo.GradeDetails d on g.ID = d.ID
		where t.ID = @TeacherID
		and c.ID = @CourseID
		group by s.FirstName, s.LastName

	
return
end
go

--calling

declare @TeacherID int = 4
declare @CourseID int = 5

select * from  dbo.fn_PassedExamByTeachersStud (@TeacherID, @CourseID)
