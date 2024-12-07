use ITI_Examenation

-- relationships Stored procedures 
-----------------------Bransh_contain_Track-----------------------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Branch_Contain_Track]    Script Date: 12/7/2024 9:12:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Branch_Contain_Track](
	[Branch_Id] [int] NOT NULL,
	[Track_Id] [int] NOT NULL,
 CONSTRAINT [c2] PRIMARY KEY CLUSTERED 
(
	[Branch_Id] ASC,
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Branch_Contain_Track]  WITH CHECK ADD  CONSTRAINT [FK__Branch_Co__Branc__440B1D61] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Branch] ([Branch_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Branch_Contain_Track] CHECK CONSTRAINT [FK__Branch_Co__Branc__440B1D61]
GO

ALTER TABLE [dbo].[Branch_Contain_Track]  WITH CHECK ADD  CONSTRAINT [FK__Branch_Co__Track__44FF419A] FOREIGN KEY([Track_Id])
REFERENCES [dbo].[Track] ([Track_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Branch_Contain_Track] CHECK CONSTRAINT [FK__Branch_Co__Track__44FF419A]
GO




----------------------------select--------------------------------------------------

CREATE PROCEDURE GetBranchContainTrack
    @Branch_Id INT
   
AS
BEGIN
    IF EXISTS (SELECT * FROM Branch_Contain_Track WHERE Branch_Id = @Branch_Id )
    BEGIN
        SELECT * FROM Branch_Contain_Track 
        WHERE Branch_Id = @Branch_Id 
    END
    ELSE
    BEGIN
        SELECT 'This Branch-Track does not exist';
    END
END;

exec GetBranchContainTrack 50

----------------------------insert--------------------------------------------------

CREATE PROCEDURE InsertBranchContainTrack
    @Branch_Id INT,
    @Track_Id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Branch_Contain_Track WHERE Branch_Id = @Branch_Id AND Track_Id = @Track_Id)
    BEGIN
        SELECT 'This Branch-Track combination already exists';
    END
    ELSE
    BEGIN
        -- Check for Branch existence
        IF NOT EXISTS (SELECT * FROM Branch WHERE Branch_Id = @Branch_Id)
        BEGIN
            SELECT 'This Branch ID does not exist';
        END
        -- Check for Track existence
        ELSE IF NOT EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_Id)
        BEGIN
            SELECT 'This Track ID does not exist';
        END
        ELSE
        BEGIN
            INSERT INTO Branch_Contain_Track (Branch_Id, Track_Id)
            VALUES (@Branch_Id, @Track_Id);
            SELECT 'Branch-Track combination added successfully';
        END
    END
END;

exec InsertBranchContainTrack 2,2

----------------------------delete--------------------------------------------------
CREATE PROCEDURE DeleteBranchContainTrack
    @Branch_Id INT,
    @Track_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Branch_Contain_Track WHERE Branch_Id = @Branch_Id AND Track_Id = @Track_Id)
    BEGIN
        SELECT 'This Branch-Track combination does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Branch_Contain_Track 
        WHERE Branch_Id = @Branch_Id AND Track_Id = @Track_Id;
        SELECT 'Branch-Track combination deleted successfully';
    END
END;
exec DeleteBranchContainTrack 1,20

----------------------------update--------------------------------------------------

CREATE PROCEDURE UpdateBranchContainTrack
    @Old_Branch_Id INT,
    @Old_Track_Id INT,
    @New_Branch_Id INT,
    @New_Track_Id INT
AS
BEGIN
    -- Check if old Branch-Track combination exists
    IF NOT EXISTS (SELECT * FROM Branch_Contain_Track WHERE Branch_Id = @Old_Branch_Id AND Track_Id = @Old_Track_Id)
    BEGIN
        SELECT 'The Branch-Track combination to update does not exist';
    END
    ELSE
    BEGIN
        -- Check if the new Branch ID exists
        IF NOT EXISTS (SELECT * FROM Branch WHERE Branch_Id = @New_Branch_Id)
        BEGIN
            SELECT 'The new Branch ID does not exist';
        END
        -- Check if the new Track ID exists
        ELSE IF NOT EXISTS (SELECT * FROM Track WHERE Track_Id = @New_Track_Id)
        BEGIN
            SELECT 'The new Track ID does not exist';
        END
        ELSE IF EXISTS (SELECT * FROM Branch_Contain_Track WHERE Branch_Id = @New_Branch_Id AND Track_Id = @New_Track_Id)
        BEGIN
            SELECT 'The new Branch-Track combination already exists';
        END
        ELSE
        BEGIN
         
			UPDATE Branch_Contain_Track
			SET Branch_Id = @New_Branch_Id, Track_Id = @New_Track_Id
			WHERE Branch_Id = @Old_Branch_Id AND Track_Id = @Old_Track_Id;

			
            SELECT 'Branch-Track combination updated successfully';
        END
    END
END;
exec UpdateBranchContainTrack 2,2,1,20

--==================================================================================
--==================================================================================

-----------------------Exam_Evaluated-----------------------------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Exam_Evaluated]    Script Date: 12/7/2024 9:40:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Exam_Evaluated](
	[St_Id] [int] NOT NULL,
	[Exam_Id] [int] NOT NULL,
	[Q_Id] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[Answer] [varchar](50) NULL,
	[Date] [date] NOT NULL,
	[artificial] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Exam_Evaluated] PRIMARY KEY CLUSTERED 
(
	[St_Id] ASC,
	[Exam_Id] ASC,
	[artificial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exam_Evaluated]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Eval__Exam___5EBF139D] FOREIGN KEY([Exam_Id])
REFERENCES [dbo].[Exam] ([Exam_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Exam_Evaluated] CHECK CONSTRAINT [FK__Exam_Eval__Exam___5EBF139D]
GO

ALTER TABLE [dbo].[Exam_Evaluated]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Eval__St_Id__5DCAEF64] FOREIGN KEY([St_Id])
REFERENCES [dbo].[Student] ([St_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Exam_Evaluated] CHECK CONSTRAINT [FK__Exam_Eval__St_Id__5DCAEF64]
GO

ALTER TABLE [dbo].[Exam_Evaluated]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Evalu__Q_Id__5FB337D6] FOREIGN KEY([Q_Id])
REFERENCES [dbo].[Question] ([Q_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Exam_Evaluated] CHECK CONSTRAINT [FK__Exam_Evalu__Q_Id__5FB337D6]
GO



----------------------------select--------------------------------------------------

CREATE PROCEDURE GetExamEvaluated
    @St_Id INT,
    @Exam_Id INT,
    @Artificial INT
AS
BEGIN
  
    IF EXISTS (SELECT 1 FROM Exam_Evaluated 
               WHERE St_Id = @St_Id AND Exam_Id = @Exam_Id AND artificial = @Artificial)
    BEGIN
        SELECT * 
        FROM Exam_Evaluated
        WHERE St_Id = @St_Id AND Exam_Id = @Exam_Id AND artificial = @Artificial;
    END
    ELSE
    BEGIN
        SELECT 'This evaluation record does not exist';
    END
END;

exec GetExamEvaluated 5,1,1
----------------------------insert--------------------------------------------------
CREATE PROCEDURE InsertExamEvaluated
    @St_Id INT,
    @Exam_Id INT,
    @Q_Id INT,
    @Grade INT,
    @Answer VARCHAR(50),
    @Date DATE 

AS
BEGIN
   
    -- Check if Student exists
    IF NOT EXISTS (SELECT * FROM Student WHERE St_Id = @St_Id)
    BEGIN
        SELECT 'This Student ID does not exist';
        RETURN;
    END

    -- Check if Exam exists
    IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
    BEGIN
        SELECT 'This Exam ID does not exist';
        RETURN;
    END

    -- Check if Question exists
    IF NOT EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
    BEGIN
        SELECT 'This Question ID does not exist';
        RETURN;
    END

    -- Insert the new record
    INSERT INTO Exam_Evaluated (St_Id, Exam_Id, Q_Id, Grade, Answer, Date)
    VALUES (@St_Id, @Exam_Id, @Q_Id, @Grade, @Answer, @Date);

    SELECT 'Exam evaluation added successfully';
END;

exec InsertExamEvaluated 

    @St_Id = 1,         
    @Exam_Id = 1,       
    @Q_Id = 1,          
    @Grade = 85,         
    @Answer = 'Answer A',
    @Date = '2024-06-12' 


----------------------------delete--------------------------------------------------

CREATE PROCEDURE DeleteExamEvaluated
    @St_Id INT,
    @Exam_Id INT,
    @Artificial INT
AS
BEGIN
    -- Check if the record exists
    IF NOT EXISTS (SELECT 1 FROM Exam_Evaluated 
                   WHERE St_Id = @St_Id AND Exam_Id = @Exam_Id AND artificial = @Artificial)
    BEGIN
        SELECT 'This evaluation record does not exist, cannot delete';
        RETURN;
    END

    -- Delete the record
    DELETE FROM Exam_Evaluated
    WHERE St_Id = @St_Id AND Exam_Id = @Exam_Id AND artificial = @Artificial;

    SELECT 'Exam evaluation deleted successfully';
END;

exec DeleteExamEvaluated 1,1,14

----------------------------update--------------------------------------------------

CREATE PROCEDURE UpdateExamEvaluated
    @St_Id INT,
    @Exam_Id INT,
    @Q_Id INT,
    @Grade INT,
    @Answer VARCHAR(50),
    @Date DATE,
    @artificial INT
AS
BEGIN
    -- Check if Student exists
    IF NOT EXISTS (SELECT * FROM Student WHERE St_Id = @St_Id)
    BEGIN
        SELECT 'This Student ID does not exist';
        RETURN;
    END

    -- Check if Exam exists
    IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
    BEGIN
        SELECT 'This Exam ID does not exist';
        RETURN;
    END

    -- Check if Question exists
    IF NOT EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
    BEGIN
        SELECT 'This Question ID does not exist';
        RETURN;
    END

    -- Check if the record to be updated exists
    IF NOT EXISTS (SELECT * FROM Exam_Evaluated WHERE St_Id = @St_Id AND Exam_Id = @Exam_Id AND artificial = @artificial)
    BEGIN
        SELECT 'This record does not exist';
        RETURN;
    END

    -- Perform the update
    UPDATE Exam_Evaluated
    SET 
        Q_Id = @Q_Id,
        Grade = @Grade,
        Answer = @Answer,
        Date = @Date
    WHERE St_Id = @St_Id 
	  and Q_Id = @Q_Id
    and  Exam_Id = @Exam_Id
    and artificial = @artificial;

    SELECT 'Exam evaluation updated successfully';
END;

exec UpdateExamEvaluated 
    @St_Id = 1, 
    @Exam_Id = 1, 
    @Q_Id = 1, 
    @Grade = 90, 
    @Answer = 'Updated Answer', 
    @Date = '2024-06-15',
    @artificial = 14;

--==================================================================================
--==================================================================================

-----------------------Instructor_Teach_Course--------------------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Instructor_Teach_Course]    Script Date: 12/7/2024 10:11:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Instructor_Teach_Course](
	[C_Id] [int] NOT NULL,
	[Ins_Id] [int] NOT NULL,
 CONSTRAINT [c5] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC,
	[Ins_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor_Teach_Course]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__Ins_I__4E88ABD4] FOREIGN KEY([Ins_Id])
REFERENCES [dbo].[Instructor] ([Ins_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Instructor_Teach_Course] CHECK CONSTRAINT [FK__Instructo__Ins_I__4E88ABD4]
GO

ALTER TABLE [dbo].[Instructor_Teach_Course]  WITH CHECK ADD  CONSTRAINT [FK__Instructor__C_Id__4D94879B] FOREIGN KEY([C_Id])
REFERENCES [dbo].[Course] ([C_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Instructor_Teach_Course] CHECK CONSTRAINT [FK__Instructor__C_Id__4D94879B]
GO



----------------------------select--------------------------------------------------

CREATE PROCEDURE GetInstructorTeachCourse
    @C_Id INT,
    @Ins_Id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Instructor_Teach_Course WHERE C_Id = @C_Id AND Ins_Id = @Ins_Id)
    BEGIN
        SELECT * FROM Instructor_Teach_Course WHERE C_Id = @C_Id AND Ins_Id = @Ins_Id;
    END
    ELSE
    BEGIN
        SELECT 'This Instructor-Course combination does not exist';
    END
END;
exec GetInstructorTeachCourse 1,20

----------------------------insert--------------------------------------------------
CREATE PROCEDURE InsertInstructorTeachCourse
    @C_Id INT,
    @Ins_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Instructor WHERE Ins_Id = @Ins_Id)
    BEGIN
        SELECT 'Instructor ID does not exist';
    END
    ELSE IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'Course ID does not exist';
    END
    ELSE IF EXISTS (SELECT * FROM Instructor_Teach_Course WHERE C_Id = @C_Id AND Ins_Id = @Ins_Id)
    BEGIN
        SELECT 'This Instructor is already teaching this course';
    END
    ELSE
    BEGIN
        INSERT INTO Instructor_Teach_Course (C_Id, Ins_Id)
        VALUES (@C_Id, @Ins_Id);
        SELECT 'Instructor assigned to course successfully';
    END
END;

EXEC InsertInstructorTeachCourse 
    @C_Id = 5, 
    @Ins_Id = 5;

----------------------------delete--------------------------------------------------

CREATE PROCEDURE DeleteInstructorTeachCourse
    @C_Id INT,
    @Ins_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Instructor WHERE Ins_Id = @Ins_Id)
    BEGIN
        SELECT 'Instructor ID does not exist';
    END
    ELSE IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'Course ID does not exist';
    END
    ELSE IF NOT EXISTS (SELECT * FROM Instructor_Teach_Course WHERE C_Id = @C_Id AND Ins_Id = @Ins_Id)
    BEGIN
        SELECT 'This assignment does not exist';
    END
    ELSE
    BEGIN
        DELETE FROM Instructor_Teach_Course
        WHERE C_Id = @C_Id AND Ins_Id = @Ins_Id;
        SELECT 'Instructor-Course assignment deleted successfully';
    END
END;

EXEC DeleteInstructorTeachCourse 
    @C_Id = 1, 
    @Ins_Id = 1;
----------------------------update--------------------------------------------------

alter PROCEDURE UpdateInstructorTeachCourse
    @Old_C_Id INT,
    @Old_Ins_Id INT,
    @New_C_Id INT,
    @New_Ins_Id INT
AS
BEGIN
    -- Check if the old Course-Instructor combination exists
    IF NOT EXISTS (SELECT * FROM Instructor_Teach_Course WHERE C_Id = @Old_C_Id AND Ins_Id = @Old_Ins_Id)
    BEGIN
        SELECT 'The Course-Instructor combination to update does not exist';
    END
    ELSE
    BEGIN
        -- Check if the new Course ID exists
        IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @New_C_Id)
        BEGIN
            SELECT 'The new Course ID does not exist';
        END
        -- Check if the new Instructor ID exists
        ELSE IF NOT EXISTS (SELECT * FROM Instructor WHERE Ins_Id = @New_Ins_Id)
        BEGIN
            SELECT 'The new Instructor ID does not exist';
        END
        -- Check if the new Course-Instructor combination already exists
        ELSE IF EXISTS (SELECT * FROM Instructor_Teach_Course WHERE C_Id = @New_C_Id AND Ins_Id = @New_Ins_Id)
        BEGIN
            SELECT 'The new Course-Instructor combination already exists';
        END
        ELSE
        BEGIN
            -- Update the Course-Instructor combination
            UPDATE Instructor_Teach_Course
            SET C_Id = @New_C_Id, Ins_Id = @New_Ins_Id
            WHERE C_Id = @Old_C_Id AND Ins_Id = @Old_Ins_Id;

            SELECT 'Course-Instructor combination updated successfully';
        END
    END
END;
exec UpdateInstructorTeachCourse 5,5 ,1,1

--==================================================================================
--==================================================================================

-----------------------Student_Take_Course------------------------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Student_Take_Course]    Script Date: 12/7/2024 10:37:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student_Take_Course](
	[C_Id] [int] NOT NULL,
	[St_Id] [int] NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [c6] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC,
	[St_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




----------------------------select--------------------------------------------------

CREATE PROCEDURE GetStudentTakeCourse
    @C_Id INT,
    @St_Id INT
AS
BEGIN
    -- Check if the Course-Student combination exists
    IF EXISTS (SELECT * FROM Student_Take_Course WHERE C_Id = @C_Id AND St_Id = @St_Id)
    BEGIN
        SELECT * FROM Student_Take_Course WHERE C_Id = @C_Id AND St_Id = @St_Id;
    END
    ELSE
    BEGIN
        SELECT 'The Course-Student combination does not exist';
    END
END;

exec GetStudentTakeCourse 1,500
----------------------------insert--------------------------------------------------

CREATE PROCEDURE InsertStudentTakeCourse
    @C_Id INT,
    @St_Id INT,
    @Grade INT
AS
BEGIN
    -- Check if the Course ID exists
    IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'The Course ID does not exist';
    END
    -- Check if the Student ID exists
    ELSE IF NOT EXISTS (SELECT * FROM Student WHERE St_Id = @St_Id)
    BEGIN
        SELECT 'The Student ID does not exist';
    END
    -- Check if the Course-Student combination already exists
    ELSE IF EXISTS (SELECT * FROM Student_Take_Course WHERE C_Id = @C_Id AND St_Id = @St_Id)
    BEGIN
        SELECT 'The Course-Student combination already exists';
    END
    ELSE
    BEGIN
        -- Insert the new Course-Student combination
        INSERT INTO Student_Take_Course (C_Id, St_Id, Grade)
        VALUES (@C_Id, @St_Id, @Grade);

        SELECT 'Course-Student combination added successfully';
    END
END;

exec InsertStudentTakeCourse 1,2,20
----------------------------delete--------------------------------------------------
CREATE PROCEDURE DeleteStudentTakeCourse
    @C_Id INT,
    @St_Id INT
AS
BEGIN
    -- Check if the Course-Student combination exists
    IF NOT EXISTS (SELECT * FROM Student_Take_Course WHERE C_Id = @C_Id AND St_Id = @St_Id)
    BEGIN
        SELECT 'The Course-Student combination to delete does not exist';
    END
    ELSE
    BEGIN
        -- Delete the Course-Student combination
        DELETE FROM Student_Take_Course WHERE C_Id = @C_Id AND St_Id = @St_Id;

        SELECT 'Course-Student combination deleted successfully';
    END
END;

exec DeleteStudentTakeCourse 1,2

----------------------------update--------------------------------------------------

CREATE PROCEDURE UpdateStudentTakeCourse
    @Old_C_Id INT,
    @Old_St_Id INT,
    @New_C_Id INT,
    @New_St_Id INT,
    @New_Grade INT
AS
BEGIN
    -- Check if the old Course-Student combination exists
    IF NOT EXISTS (SELECT * FROM Student_Take_Course WHERE C_Id = @Old_C_Id AND St_Id = @Old_St_Id)
    BEGIN
        SELECT 'The Course-Student combination to update does not exist';
    END
    ELSE
    BEGIN
        -- Check if the new Course ID exists
        IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @New_C_Id)
        BEGIN
            SELECT 'The new Course ID does not exist';
        END
        -- Check if the new Student ID exists
        ELSE IF NOT EXISTS (SELECT * FROM Student WHERE St_Id = @New_St_Id)
        BEGIN
            SELECT 'The new Student ID does not exist';
        END
        -- Check if the new Course-Student combination already exists
        ELSE IF EXISTS (SELECT * FROM Student_Take_Course WHERE C_Id = @New_C_Id AND St_Id = @New_St_Id)
        BEGIN
            SELECT 'The new Course-Student combination already exists';
        END
        ELSE
        BEGIN
            -- Update the Course-Student combination and Grade
            UPDATE Student_Take_Course
            SET C_Id = @New_C_Id, St_Id = @New_St_Id, Grade = @New_Grade
            WHERE C_Id = @Old_C_Id AND St_Id = @Old_St_Id;

            SELECT 'Course-Student combination updated successfully';
        END
    END
END;
EXEC UpdateStudentTakeCourse  1, 1,  200,  10,  95;

--==================================================================================
--==================================================================================

-----------------------Track_Include_Course-----------------------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Track_Include_Course]    Script Date: 12/7/2024 10:47:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track_Include_Course](
	[C_Id] [int] NOT NULL,
	[Track_Id] [int] NOT NULL,
 CONSTRAINT [c4] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC,
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Track_Include_Course]  WITH CHECK ADD  CONSTRAINT [FK__Track_Inc__Track__4AB81AF0] FOREIGN KEY([Track_Id])
REFERENCES [dbo].[Track] ([Track_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Track_Include_Course] CHECK CONSTRAINT [FK__Track_Inc__Track__4AB81AF0]
GO

ALTER TABLE [dbo].[Track_Include_Course]  WITH CHECK ADD  CONSTRAINT [FK__Track_Incl__C_Id__49C3F6B7] FOREIGN KEY([C_Id])
REFERENCES [dbo].[Course] ([C_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Track_Include_Course] CHECK CONSTRAINT [FK__Track_Incl__C_Id__49C3F6B7]
GO



----------------------------select--------------------------------------------------
CREATE PROCEDURE GetTrackIncludeCourse
    @C_Id INT,
    @Track_Id INT
AS
BEGIN
    -- Check if the Course-Track combination exists
    IF EXISTS (SELECT * FROM Track_Include_Course WHERE C_Id = @C_Id AND Track_Id = @Track_Id)
    BEGIN
        SELECT * FROM Track_Include_Course WHERE C_Id = @C_Id AND Track_Id = @Track_Id;
    END
    ELSE
    BEGIN
        SELECT 'The Course-Track combination does not exist';
    END
END;
exec GetTrackIncludeCourse 1,3

----------------------------insert--------------------------------------------------
CREATE PROCEDURE InsertTrackIncludeCourse
    @C_Id INT,
    @Track_Id INT
AS
BEGIN
    -- Check if the Course ID exists
    IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'The Course ID does not exist';
    END
    -- Check if the Track ID exists
    ELSE IF NOT EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_Id)
    BEGIN
        SELECT 'The Track ID does not exist';
    END
    -- Check if the Course-Track combination already exists
    ELSE IF EXISTS (SELECT * FROM Track_Include_Course WHERE C_Id = @C_Id AND Track_Id = @Track_Id)
    BEGIN
        SELECT 'The Course-Track combination already exists';
    END
    ELSE
    BEGIN
        -- Insert the new Course-Track combination
        INSERT INTO Track_Include_Course (C_Id, Track_Id)
        VALUES (@C_Id, @Track_Id);

        SELECT 'Course-Track combination added successfully';
    END
END;
exec InsertTrackIncludeCourse 1,2

----------------------------delete--------------------------------------------------

CREATE PROCEDURE DeleteTrackIncludeCourse
    @C_Id INT,
    @Track_Id INT
AS
BEGIN
    -- Check if the Course-Track combination exists
    IF NOT EXISTS (SELECT * FROM Track_Include_Course WHERE C_Id = @C_Id AND Track_Id = @Track_Id)
    BEGIN
        SELECT 'The Course-Track combination to delete does not exist';
    END
    ELSE
    BEGIN
        -- Delete the Course-Track combination
        DELETE FROM Track_Include_Course WHERE C_Id = @C_Id AND Track_Id = @Track_Id;

        SELECT 'Course-Track combination deleted successfully';
    END
END;

exec DeleteTrackIncludeCourse 1,2

----------------------------update--------------------------------------------------
CREATE PROCEDURE UpdateTrackIncludeCourse
    @Old_C_Id INT,
    @Old_Track_Id INT,
    @New_C_Id INT,
    @New_Track_Id INT
AS
BEGIN
    -- Check if the old Course-Track combination exists
    IF NOT EXISTS (SELECT * FROM Track_Include_Course WHERE C_Id = @Old_C_Id AND Track_Id = @Old_Track_Id)
    BEGIN
        SELECT 'The Course-Track combination to update does not exist';
    END
    ELSE
    BEGIN
        -- Check if the new Course ID exists
        IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @New_C_Id)
        BEGIN
            SELECT 'The new Course ID does not exist';
        END
        -- Check if the new Track ID exists
        ELSE IF NOT EXISTS (SELECT * FROM Track WHERE Track_Id = @New_Track_Id)
        BEGIN
            SELECT 'The new Track ID does not exist';
        END
        -- Check if the new Course-Track combination already exists
        ELSE IF EXISTS (SELECT * FROM Track_Include_Course WHERE C_Id = @New_C_Id AND Track_Id = @New_Track_Id)
        BEGIN
            SELECT 'The new Course-Track combination already exists';
        END
        ELSE
        BEGIN
            -- Update the Course-Track combination
            UPDATE Track_Include_Course
            SET C_Id = @New_C_Id, Track_Id = @New_Track_Id
            WHERE C_Id = @Old_C_Id AND Track_Id = @Old_Track_Id;

            SELECT 'Course-Track combination updated successfully';
        END
    END
END;

--==================================================================================
--==================================================================================

backup database ITI_Examenation
to disk = 'D:\ thirdBackUp.bak'