-- ContosoUniversityData.mdf  (localdb)\ProjectsV12)
/*
	For Tutorial
	"Getting Started with Entity Framework 6 Database First using MVC 5"

	See Also:
	System.ComponentModel.DataAnnotations
*/

/* Tables */
CREATE TABLE [Student] (
    [StudentID]      INT           IDENTITY (1, 1) NOT NULL,
    [LastName]       NVARCHAR (50) NULL,
    [FirstName]      NVARCHAR (50) NULL,
    [EnrollmentDate] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
)
CREATE TABLE [Course] (
        [CourseID] INT           IDENTITY (1, 1) NOT NULL,
        [Title]    NVARCHAR (50) NULL,
        [Credits]  INT           NULL,
        PRIMARY KEY CLUSTERED ([CourseID] ASC)
)
CREATE TABLE [Enrollment] (
    [EnrollmentID] INT IDENTITY (1, 1) NOT NULL,
    [Grade]        DECIMAL(3, 2) NULL,
    [CourseID]     INT NOT NULL,
    [StudentID]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC),
    CONSTRAINT [FK_l2a.Enrollment_l2a.Course_CourseID] FOREIGN KEY ([CourseID]) 
        REFERENCES [Course] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_l2a.Enrollment_l2a.Student_StudentID] FOREIGN KEY ([StudentID]) 
        REFERENCES [Student] ([StudentID]) ON DELETE CASCADE
)

/* Post Deployment Script */
MERGE INTO Course AS Target 
USING (VALUES 
        (1, 'Economics', 3), 
        (2, 'Literature', 3), 
        (3, 'Chemistry', 4)
) 
AS Source (CourseID, Title, Credits) 
ON Target.CourseID = Source.CourseID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Title, Credits) 
VALUES (Title, Credits);

MERGE INTO Student AS Target
USING (VALUES 
        (1, 'Tibbetts', 'Donnie', '2013-09-01'), 
        (2, 'Guzman', 'Liza', '2012-01-13'), 
(3, 'Catlett', 'Phil', '2011-09-03')
)
AS Source (StudentID, LastName, FirstName, EnrollmentDate)
ON Target.StudentID = Source.StudentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (LastName, FirstName, EnrollmentDate)
VALUES (LastName, FirstName, EnrollmentDate);

MERGE INTO Enrollment AS Target
USING (VALUES 
(1, 2.00, 1, 1),
(2, 3.50, 1, 2),
(3, 4.00, 2, 3),
(4, 1.80, 2, 1),
(5, 3.20, 3, 1),
(6, 4.00, 3, 2)
)
AS Source (EnrollmentID, Grade, CourseID, StudentID)
ON Target.EnrollmentID = Source.EnrollmentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Grade, CourseID, StudentID)
VALUES (Grade, CourseID, StudentID);
