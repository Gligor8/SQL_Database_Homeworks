USE SEDCHome

select c.Name as Course, p.Name as AchievementType
from dbo.Course c
cross join dbo.AchievementType p
GO

select DISTINCT t.FirstName
from dbo.[Teacher] t
inner join dbo.Grade g on g.TeacherID = t.ID
GO

select DISTINCT t.Firstname
from dbo.[Teacher] t
left join dbo.[Grade] g on g.TeacherID = t.ID
where g.Grade is not null
GO

select s.*
from dbo.[Student] s
right join dbo.Grade g on g.Grade = s.ID
where g.Grade is null
