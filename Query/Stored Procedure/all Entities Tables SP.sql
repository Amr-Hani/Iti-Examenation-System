-------------------------------Entities Tables -----------------------------------------
----------------------------------------------------------------------------------------

--Table Student
create proc GetStudent @id int
as 
if exists(select * from Student s where s.St_Id = @id)
select * from Student s where s.St_Id = @id 
else 
select 'this dose not exists'

GetStudent 1

-----------------------------------INSERT------------------------------------------------

create proc InsertNewStudent @st_id int
,@st_fname varchar(20),@st_lname varchar(20),
@st_email varchar(50),@st_pass varchar(20),
@st_gender varchar(1),@st_bd date ,
@st_city varchar(50),@st_stret varchar(50),
@t_id int 
as 
	if exists(select * from Student where St_Id = @st_id)
		select 'student id is exists'
	else 
	begin
		if not exists(select * from Track where Track_Id = @t_id ) 
			select 'track id is not exists'
		else
			insert into Student (St_Id,St_FName,St_LName , St_Email,St_Password,St_Gender,St_Bd,St_City,St_Street,Track_Id)
			values (@st_id,@st_fname,@st_lname,@st_email,@st_pass,@st_gender,@st_bd,@st_city,@st_stret,@t_id)
	end

InsertNewStudent 21,'amr','hani','email','123','m','2000-1-1','zag','3 amr st','1'
---------------------------------DELETE--------------------------------------------------
alter proc DeleteStudent @id int
as 
if not exists(select  * from Student where St_Id = @id)
select 'this id does not exestes'
else
delete from Student where St_Id = @id 

DeleteStudent 1

------------------------------------UPDATE-----------------------------------------------
create PROCEDURE UpdateStudent
    @st_id INT,
    @st_fname VARCHAR(20),
    @st_lname VARCHAR(20),
    @st_email VARCHAR(50),
    @st_pass VARCHAR(20),
    @st_gender VARCHAR(1),
    @st_bd DATE,
    @st_city VARCHAR(50),
    @st_street VARCHAR(50),
    @t_id INT
AS
BEGIN
    -- Check if the student exists
    IF EXISTS (SELECT * FROM Student WHERE St_Id = @st_id)
	BEGIN 
	if Exists (select  * from Track where Track_Id = @t_id)
	begin
        -- Update the student record
        UPDATE Student
        SET 
            St_FName = @st_fname,
            St_LName = @st_lname,
            St_Email = @st_email,
            St_Password = @st_pass,
            St_Gender = @st_gender,
            St_Bd = @st_bd,
            St_City = @st_city,
            St_Street = @st_street,
            Track_Id = @t_id
        WHERE 
            St_Id = @st_id;

        SELECT 'Student record updated successfully';
		end 
		else 
		begin
		select 'track id doest not exixt'
		end 
    END
    ELSE
    BEGIN
        -- If student ID does not exist, return a message
        SELECT 'Student ID does not exist';
    END
END;

EXEC UpdateStudent 
    @st_id = 1, 
    @st_fname = 'alaa', 
    @st_lname = 'Doe', 
    @st_email = 'john.doe@example.com', 
    @st_pass = 'newpass123', 
    @st_gender = 'M', 
    @st_bd = '1995-08-25', 
    @st_city = 'New York', 
    @st_street = '123 Main St', 
    @t_id = 2;

-------------------------Instructor---------------------------

----------------------Select------------------------------
alter PROCEDURE GetInstructor @ins_id INT
AS
if exists(SELECT * FROM Instructor WHERE Ins_Id = @ins_id)
SELECT * FROM Instructor WHERE Ins_Id = @ins_id;
else 
select 'This instructor is not exists'
    

-- Example Call:1

	GetInstructor 21
----------------------Insert--------------------------------
CREATE PROCEDURE InsertInstructor
    @ins_id INT,
    @ins_fname VARCHAR(50),
    @ins_lname VARCHAR(50),
    @ins_salary INT,
    @ins_bd DATE,
    @ins_city VARCHAR(50),
    @ins_street VARCHAR(50),
    @branch_id INT,
    @ins_gender VARCHAR(1)
AS
BEGIN
    -- Check if Instructor ID already exists
    IF EXISTS (SELECT * FROM Instructor WHERE Ins_Id = @ins_id)
    BEGIN
        SELECT 'Instructor ID already exists';
    END
    ELSE
    BEGIN
        -- Check if Branch ID exists
        IF EXISTS (SELECT * FROM Branch WHERE Branch_Id = @branch_id)
        BEGIN
            INSERT INTO Instructor 
                (Ins_Id, Ins_FName, Ins_LName, Ins_Salary, Ins_Bd, Ins_City, Ins_Street, Branch_Id, Ins_Gender)
            VALUES 
                (@ins_id, @ins_fname, @ins_lname, @ins_salary, @ins_bd, @ins_city, @ins_street, @branch_id, @ins_gender);

            SELECT 'Instructor added successfully';
        END
        ELSE
        BEGIN
            SELECT 'Branch ID does not exist';
        END
    END
END;

-- Example Call:
EXEC InsertInstructor 
    @ins_id = 21, 
    @ins_fname = 'amr', 
    @ins_lname = 'hani', 
    @ins_salary = 5000, 
    @ins_bd = '1985-05-12', 
    @ins_city = 'New York', 
    @ins_street = '456 Elm St', 
    @branch_id = 1, 
    @ins_gender = 'M';

--------------------update----------------------
CREATE PROCEDURE UpdateInstructor
    @ins_id INT,
    @ins_fname VARCHAR(50),
    @ins_lname VARCHAR(50),
    @ins_salary INT,
    @ins_bd DATE,
    @ins_city VARCHAR(50),
    @ins_street VARCHAR(50),
    @branch_id INT,
    @ins_gender VARCHAR(1)
AS
BEGIN
    -- Check if Instructor ID exists
    IF EXISTS (SELECT * FROM Instructor WHERE Ins_Id = @ins_id)
    BEGIN
        -- Check if Branch ID exists
        IF EXISTS (SELECT * FROM Branch WHERE Branch_Id = @branch_id)
        BEGIN
            UPDATE Instructor
            SET 
                Ins_FName = @ins_fname,
                Ins_LName = @ins_lname,
                Ins_Salary = @ins_salary,
                Ins_Bd = @ins_bd,
                Ins_City = @ins_city,
                Ins_Street = @ins_street,
                Branch_Id = @branch_id,
                Ins_Gender = @ins_gender
            WHERE 
                Ins_Id = @ins_id;

            SELECT 'Instructor record updated successfully';
        END
        ELSE
        BEGIN
            SELECT 'Branch ID does not exist';
        END
    END
    ELSE
    BEGIN
        SELECT 'Instructor ID does not exist';
    END
END;

-- Example Call:
EXEC UpdateInstructor 
    @ins_id = 1, 
    @ins_fname = 'alaa', 
    @ins_lname = 'Smith', 
    @ins_salary = 6000, 
    @ins_bd = '1990-03-20', 
    @ins_city = 'Boston', 
    @ins_street = '789 Pine St', 
    @branch_id = 2, 
    @ins_gender = 'F';

-------------------------Delete-----------------------------
alter proc DeleteInstructor @id int
as 
if not exists
(select * from Instructor where Ins_Id = @id)
select 'this id does not exists'
else 
delete from Instructor where Ins_Id = @id 

DeleteInstructor 22
--------------------------------------------------------------
----------------------------Branch----------------------------
----------------------------Select----------------------------
create PROCEDURE GetBranch @b_id INT
AS
if exists(SELECT * FROM Branch WHERE Branch_Id = @b_id)
SELECT * FROM Branch WHERE Branch_Id = @b_id;
else 
select 'This Branch is not exists'
    

-- Example Call:1

	GetBranch 1

----------------------------Insert----------------------------
CREATE PROCEDURE InsertNewBranch
    @branch_id INT,
    @branch_name VARCHAR(50),
    @branch_city VARCHAR(50),
    @branch_street VARCHAR(50)
AS
BEGIN
    -- Check if the branch already exists
    IF EXISTS (SELECT * FROM Branch WHERE Branch_Id = @branch_id)
    BEGIN
        SELECT 'Branch ID already exists';
    END
    ELSE
    BEGIN
        -- Insert the branch
        INSERT INTO Branch (Branch_Id, Branch_Name, Branch_City, Branch_Street)
        VALUES (@branch_id, @branch_name, @branch_city, @branch_street);

        SELECT 'Branch added successfully';
    END
END;

EXEC InsertNewBranch 150, 'Main Branch', 'New York', '123 Main St';

----------------------------Delete----------------------------
alter proc DeleteBranch @id int
AS
BEGIN
    -- Delete rows from the Branch table where there's a match in Instructor table
    if not exists(select * FROM Branch where Branch_Id = @id)
	SELECT 'This brance have Instructor .. not deleted';
	else
	begin
		delete from Branch where Branch_Id = @id
	end
END;

DeleteBranch 1
---------------------------Update------------------------------
CREATE PROCEDURE UpdateBranch
    @branch_id INT,
    @branch_name VARCHAR(50),
    @branch_city VARCHAR(50),
    @branch_street VARCHAR(50)
AS
BEGIN
    -- Check if the branch exists
    IF EXISTS (SELECT * FROM Branch WHERE Branch_Id = @branch_id)
    BEGIN
        -- Update the branch record
        UPDATE Branch
        SET 
            Branch_Name = @branch_name,
            Branch_City = @branch_city,
            Branch_Street = @branch_street
        WHERE 
            Branch_Id = @branch_id;

        SELECT 'Branch record updated successfully';
    END
    ELSE
    BEGIN
        SELECT 'Branch ID does not exist';
    END
END;

EXEC UpdateBranch 1, 'Updated Branch', 'Los Angeles', '456 Elm St';
------------------------Track-------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Track]    Script Date: 12/6/2024 3:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track](
	[Track_Id] [int] NOT NULL,
	[Track_Name] [varchar](50) NULL,
	[Track_Desc] [varchar](50) NULL,
	[Track_Manager] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------select------------------------
CREATE PROCEDURE GetTrack 
    @Track_id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_id)
  SELECT * FROM Track WHERE Track_Id = @Track_id
    ELSE
        SELECT 'This Track does not exist';
END;


 EXEC GetTrack 50;

   ------------------------insert------------------------
 create PROCEDURE InsertNewTrack
	@Track_Id int ,
	@Track_Name varchar(50),
	@Track_Desc varchar(50) ,
	
	@Track_Manager varchar(50) 
AS
BEGIN
   
    IF EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_Id)
    BEGIN
        SELECT 'Track ID already exists';
    END
    ELSE
    BEGIN
          
            INSERT INTO Track(Track_Id,Track_Name,Track_Desc,Track_Manager)
            VALUES (@Track_Id, @Track_Name,@Track_Desc,@Track_Manager);
            SELECT 'Track added successfully';
        END
    END


exec InsertNewTrack 50 , 'asdasd' ,'sdfsdf','sdfsdf'
 ------------------------delete------------------------
   CREATE PROCEDURE DeleteTrack
   @Track_Id int 
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_Id)
    BEGIN
        SELECT 'This Track does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Track WHERE Track_Id = @Track_Id;
        SELECT 'Track deleted successfully';
    END
END;



exec DeleteTrack 1

  ------------------------update------------------------

 Alter PROCEDURE UpdateTrack
   @Track_Id int ,
	@Track_Name varchar(50),
	@Track_Desc varchar(50) ,
	
	@Track_Manager varchar(50) 
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Track WHERE Track_Id = @Track_Id)
    BEGIN	
	  update Track 
	  set 
	  Track_Name = @Track_Name ,
	  Track_Desc =@Track_Desc ,
	  Track_Manager = @Track_Manager
	  where Track_Id = @Track_Id
	  end 
	  else 
	  begin
	  select 'this Track doesnt exist'
	  end 
	  end 
	  
	


exec UpdateTrack 500 , '55' ,'',''

--==================================================================
--==================================================================
------------------------Course------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 12/6/2024 3:05:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Course](
	[C_Id] [int] NOT NULL,
	[C_Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------select------------------------
CREATE PROCEDURE GetCourse  
    @Course_id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Course WHERE C_Id = @Course_id)
  SELECT * FROM Course WHERE C_Id = @Course_id
    ELSE
        SELECT 'This Cousrse does not exist';
END;


 EXEC GetCourse 1;
  ------------------------insert------------------------
 create PROCEDURE InsertNewCourse
 @C_Id int ,
	@C_Name varchar(20)
AS
BEGIN
 
    IF EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'Course ID already exists';
    END
    ELSE
    BEGIN
        
            INSERT INTO Course(C_Id,C_Name)
            VALUES (@C_Id, @C_Name);
            SELECT 'Course added successfully';
        END
    END


exec InsertNewCourse 50 , 'asdasd' 

 ------------------------delete------------------------
   CREATE PROCEDURE DeleteCourse
    @C_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN
        SELECT 'This Course does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Course WHERE C_Id = @C_Id;
        SELECT 'Course deleted successfully';
    END
END;



exec DeleteCourse 50
  ------------------------update------------------------

 Alter PROCEDURE UpdateCourse
    @C_Id int ,
	@C_Name varchar(20)
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
    BEGIN	
	  update Course 
	  set 
	  C_Name = @C_Name 	 
	  where C_Id = @C_Id
	  end 
	  else 
	  begin
	  select 'this course doesnt exist'
	  end 
	  end 
	  
	


exec UpdateCourse 500 , '55' 


--==================================================================
--==================================================================
------------------------Topic-------------------------
USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Topic]    Script Date: 12/6/2024 2:47:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Topic](
	[Topic_Id] [int] NOT NULL,
	[Topic_Desc] [varchar](50) NULL,
	[C_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Topic_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [c7] FOREIGN KEY([C_Id])
REFERENCES [dbo].[Course] ([C_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [c7]
GO
------------------------select------------------------
CREATE PROCEDURE GetTopic 
    @Topic_id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Topic WHERE Topic_id = @Topic_id)
      SELECT * FROM Topic WHERE Topic_id = @Topic_id
    ELSE
        SELECT 'This topic does not exist';
END;


 EXEC GetTopic 555;
 ------------------------insert------------------------
 create PROCEDURE InsertNewTopic
   @Topic_Id int ,
	@Topic_Desc varchar(50),
	@C_Id int 
AS
BEGIN
   
    IF EXISTS (SELECT * FROM Topic WHERE Topic_Id = @Topic_Id)
    BEGIN
        SELECT 'Topic ID already exists';
    END
    ELSE
    BEGIN
       
        IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
        BEGIN
            SELECT 'This course ID does not exist';
        END
        ELSE
        BEGIN
          
            INSERT INTO Topic (Topic_Id, Topic_Desc, C_Id)
            VALUES (@Topic_Id, @Topic_Desc, @C_Id);
            SELECT 'Topic added successfully';
        END
    END
END

exec InsertNewTopic 50 , 'asdasd' , 1
 ------------------------delete------------------------
   CREATE PROCEDURE DeleteTopic
    @Topic_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Topic WHERE Topic_Id = @Topic_Id)
    BEGIN
        SELECT 'This Topic does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Topic WHERE Topic_Id = @Topic_Id;
        SELECT 'Topic deleted successfully';
    END
END;



exec DeleteTopic 51
  ------------------------update------------------------

 alter PROCEDURE UpdateTopic
    @Topic_Id int ,
	@Topic_Desc varchar(50),
	@C_Id int 
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Topic  WHERE Topic_Id = @Topic_Id)
    BEGIN
      if EXISTS (select * from Course where C_Id = @C_Id)
	  begin
	  update Topic 
	  set 
	  Topic_Desc = @Topic_Desc , 
	  C_Id = @C_Id
	  where Topic_Id = @Topic_Id

	  end 
	  else 
	  begin
	  select 'this course id desn not exist '
	  end 
       
    END
    ELSE
    BEGIN
        SELECT 'Topic ID does not exist';
    END
END;


exec UpdateTopic 500 , '55' , 1

--==================================================================
--==================================================================
------------------------Exam--------------------------

USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Exam]    Script Date: 12/6/2024 2:16:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Exam](
	[Exam_Id] [int] NOT NULL,
	[Exam_Duration] [varchar](50) NULL,
	[C_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([C_Id])
REFERENCES [dbo].[Course] ([C_Id])
GO

------------------------select------------------------
CREATE PROCEDURE GetExam
    @Exam_Id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
        SELECT * FROM Exam WHERE Exam_Id = @Exam_Id;
    ELSE
        SELECT 'This exam does not exist';
END;


 EXEC GetExam 1;

  ------------------------insert------------------------
create PROCEDURE InsertNewExam
    @Exam_Id INT,
    @Exam_Duration VARCHAR(50),
    @C_Id INT
AS
BEGIN
   
    IF EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
    BEGIN
        SELECT 'Exam ID already exists';
    END
    ELSE
    BEGIN
       
        IF NOT EXISTS (SELECT * FROM Course WHERE C_Id = @C_Id)
        BEGIN
            SELECT 'This course ID does not exist';
        END
        ELSE
        BEGIN
           
            INSERT INTO Exam (Exam_Id, Exam_Duration, C_Id)
            VALUES (@Exam_Id, @Exam_Duration, @C_Id);
            SELECT 'Exam added successfully';
        END
    END
END


 EXEC InsertNewExam 53,'51',25

 ------------------------delete------------------------
   CREATE PROCEDURE DeleteExam
    @Exam_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
    BEGIN
        SELECT 'This exam does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Exam WHERE Exam_Id = @Exam_Id;
        SELECT 'Exam deleted successfully';
    END
END;


 EXEC DeleteExam 53;
  ------------------------update------------------------

 CREATE PROCEDURE UpdateExam
    @Exam_Id INT,
    @Exam_Duration VARCHAR(50),
    @C_Id INT
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Exam WHERE Exam_Id = @Exam_Id)
    BEGIN
      if EXISTS (select * from Course where C_Id = @C_Id)
	  begin
	  update Exam 
	  set
	  Exam_Duration = @Exam_Duration , 
	  C_Id = @C_Id
	  where Exam_Id = @Exam_Id

	  end 
	  else 
	  begin
	  select 'this course id desn not exist '
	  end 
       
    END
    ELSE
    BEGIN
        SELECT 'Exam ID does not exist';
    END
END;


exec UpdateExam 1 , '55' , 55

--==================================================================
--==================================================================
------------------------Question----------------------
------------------------select------------------------
CREATE PROCEDURE GetQuestion
    @Q_Id INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
        SELECT * FROM Question WHERE Q_Id = @Q_Id;
    ELSE
        SELECT 'This Question does not exist';
END;


 EXEC GetQuestion 50;

 ------------------------insert------------------------
ALTER PROCEDURE InsertNewQuestion
    @Q_Id INT,
    @Q_Type VARCHAR(3),
    @Q_Desc VARCHAR(150),
    @Q_Grade INT,
    @Q_ModelAnswer VARCHAR(150),
    @ChoiceA VARCHAR(50),
    @ChoiceB VARCHAR(50),
    @ChoiceC VARCHAR(50),
    @ChoiceD VARCHAR(50),
    @C_Id INT
AS
BEGIN
  
    IF EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
    BEGIN
        SELECT 'Question ID already exists';
    END
    ELSE
    BEGIN
      
        IF (@Q_Type = 'MCQ')
        BEGIN
          
			 DECLARE @Dummy INT;
            SET @Dummy = 1;
        END
        ELSE IF (@Q_Type = 'T-F')
        BEGIN
            SET @ChoiceA = NULL;
            SET @ChoiceB = NULL;
            SET @ChoiceC = NULL;
            SET @ChoiceD = NULL;
        END
        ELSE
        BEGIN
            SELECT 'Wrong question type';
            RETURN; -- Exit the procedure if type is invalid
        END

      
        INSERT INTO Question (Q_Id, Q_Type, Q_Desc, Q_Grade, Q_ModelAnswer, ChoiceA, ChoiceB, ChoiceC, ChoiceD, C_Id)
        VALUES (@Q_Id, @Q_Type, @Q_Desc, @Q_Grade, @Q_ModelAnswer, @ChoiceA, @ChoiceB, @ChoiceC, @ChoiceD, @C_Id);

        SELECT 'Question added successfully';
    END
END;



 EXEC InsertNewQuestion 101, 'MCQ', 'What is SQL?', 5, 'Structured Query Language', 'Answer A', 'Answer B', 'Answer C', 'Answer D', 1;

  ------------------------delete------------------------
  CREATE PROCEDURE DeleteQuestion
    @Q_Id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
    BEGIN
        SELECT 'This Question does not exist, cannot delete';
    END
    ELSE
    BEGIN
        DELETE FROM Question WHERE Q_Id = @Q_Id;
        SELECT 'Question deleted successfully';
    END
END;


 EXEC DeleteQuestion 101;
 ------------------------update------------------------

 CREATE PROCEDURE UpdateQuestion
    @Q_Id INT,
    @Q_Type VARCHAR(3),
    @Q_Desc VARCHAR(150),
    @Q_Grade INT,
    @Q_ModelAnswer VARCHAR(150),
    @ChoiceA VARCHAR(50),
    @ChoiceB VARCHAR(50),
    @ChoiceC VARCHAR(50),
    @ChoiceD VARCHAR(50),
    @C_Id INT
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Question WHERE Q_Id = @Q_Id)
    BEGIN
      
        UPDATE Question
        SET 
            Q_Type = @Q_Type,
            Q_Desc = @Q_Desc,
            Q_Grade = @Q_Grade,
            Q_ModelAnswer = @Q_ModelAnswer,
            ChoiceA = @ChoiceA,
            ChoiceB = @ChoiceB,
            ChoiceC = @ChoiceC,
            ChoiceD = @ChoiceD,
            C_Id = @C_Id
        WHERE 
            Q_Id = @Q_Id;

        SELECT 'Question updated successfully';
    END
    ELSE
    BEGIN
        SELECT 'Question ID does not exist';
    END
END;


 EXEC UpdateQuestion 101, 'T-F', 'Updated description?', 6, 'Updated Answer', 'Choice A', 'Choice B', 'Choice C', 'Choice D', 2;

USE [ITI_Examenation]
GO

/****** Object:  Table [dbo].[Question]    Script Date: 12/2/2024 7:15:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Question](
	[Q_Id] [int] NOT NULL,
	[Q_Type] [varchar](3) NULL,
	[Q_Desc] [varchar](150) NULL,
	[Q_Grade] [int] NULL,
	[Q_ModelAnswer] [varchar](150) NULL,
	[ChoiceA] [varchar](50) NULL,
	[ChoiceB] [varchar](50) NULL,
	[ChoiceC] [varchar](50) NULL,
	[ChoiceD] [varchar](50) NULL,
	[C_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Q_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([C_Id])
REFERENCES [dbo].[Course] ([C_Id])
GO

ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [c8] CHECK  (([Q_Type]='MCQ' OR [Q_Type]='T-F'))
GO

ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [c8]
GO






















/*
alter PROCEDURE GetStudent
    @id INT
AS
BEGIN
    -- Declare a table variable with new column names
    DECLARE @t TABLE (
        StudentID INT,
        FullName NVARCHAR(255),
        BirthDate DATE
    );

    -- Insert data into the table variable with mapped columns
    INSERT INTO @t (StudentID, FullName, BirthDate)
    SELECT 
        s.St_Id,       -- Map to StudentID
        s.Name,        -- Map to FullName
        s.DOB          -- Map to BirthDate
    FROM 
        Student s
    WHERE 
        s.St_Id = @id;

    -- Return the data from the table variable
    SELECT * FROM @t;
END;













drop proc GetInstructor @id int
as 
select * from Instructor i where i.Ins_Id = @id

*/
delete from Instructor
where Ins_Id = 19