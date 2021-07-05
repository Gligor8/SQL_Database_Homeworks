/*
Create new procedure called CreateGrade
Procedure should create only Grade header info (not Grade Details) 
Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
*/

use SEDCHome	

create or alter procedure dbo.CreateGrade (@ID int, @StudentID int, @CourseID int, @TeacherID int, @Grade tinyint, @Comment nvarchar(100), @CreateDate date)
as
begin
     insert into [dbo].[Grade](ID, StudentID, CourseID)
	 values (@ID, @StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreateDate)

	 select
			count(*) as TotalGradesPerStudent
	 from 
			[dbo].[Grade]
	where
			StudentID = @StudentID

	select 
			sum(TotalGrade)

	set
			@TotalGrade = TotalGrade
	from
			[dbo].[Grade]
	Where 
			StudentID = @StudentID
	and CourseID = @CourseID

end
go

-- execution

EXEC dbo.CreateGrade @ID = 55, @StudentID = 3, @StudentID = 23, @CourseID = 535, @TeacherID = 4423, @Grade = 10, @Comment = 'Exellence!', @CreateDate = '2021-05-15'
GO

select
	top (10) * 
from
	[dbo].[Grade]
order by
	ID desc
GO

-- Second Part

/*
Create new procedure called CreateGradeDetail
Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
Output from this procedure should be resultset with SUM of GradePoints calculated with 
formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
*/

create or alter procedure dbo.CreateGradeDetail (@AchievementTypeID int, @Points int, @MaxPoints int, @GradeRewardDate date)
as
begin

	declare 
	@Grade int
,	@TotalGrade int

	

	select
	@Points = sum((AchievementPoints / AchievementMaxPoints) * ParticipationRate)

	from
	dbo.GradeDetails, dbo.AchievementType

	-- adding details

	INSERT INTO [dbo].[GradeDetails] ([AchievementTypeID], [Points], [MaxPoints], [GradeRewardDate])
	VALUES (@[AchievementTypeID, @Points, @MaxPoints, @GradeRewardDate)

end
go


	-- executing

	exec dbo.CreateGradeDetail @AchievementTypeID = 4462, @Points = 33, @MaxPoints = 100, @GradeRewardDate = '2021-05-24'