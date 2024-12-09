-----

--report 1
--•	Report that returns the students information 
--	according to Department No parameter
create or alter proc Return_Std_Info
as
select  ROW_NUMBER() over (order by t.Track_Name, st_id) as ID, 
	s.St_FName as 'First Name' , 
	s.St_LName as 'Last Name',  
	s.St_Email as Email, 
	s.St_Age as Age,
	s.St_Bd as Birthdate, 
	s.St_City as City,
	s.St_Gender as Gender,
	t.Track_Name as Track
from Student s, Track t
where t.Track_Id = s.Track_Id
order by t.Track_Name

Return_Std_Info
----------------------------------------------------------------
--report 2
--•	Report that takes the student ID and returns
--	the grades of the student in all courses. 
create or alter proc Std_Grad_by_SId @id int 
as 
select s.St_FName + ' ' +s.St_LName as 'Name', c.C_Name as 'Course Name', sc.Grade as 'Grade'
from  Student s 
	inner join Student_Take_Course sc on s.St_Id=sc.St_Id
	inner join Course c on sc.C_Id=c.C_Id
where s.St_Id = @id

Std_Grad_by_SId 2
----------------------------------------------------------------
--report 3
--•	Report that takes the instructor ID and returns 
--	the name of the courses that he teaches 
--	and the number of student per course.
create or alter proc Ins_Teach_Course @id int 
as 
select c.C_Name as 'Course Name', count(s.St_Id) as 'Number of Student'
from  Instructor i 
	inner join Instructor_Teach_Course itc on i.Ins_Id = itc.Ins_Id
	inner join Course c on c.C_Id = itc.C_Id
	inner join Track_Include_Course tic on c.C_Id = tic.C_Id
	inner join Track t on t.Track_Id = tic.Track_Id
	inner join Student s on t.Track_Id = s.Track_Id
where i.Ins_Id = @id
group by c.C_Name

Ins_Teach_Course 1
----------------------------------------------------------------
--report 4
--•	Report that takes course ID and returns its topics
create or alter proc Course_Topics @id int 
as 
select t.Topic_Desc as 'Topic Name'
from Topic t
where t.C_Id = @id

Course_Topics 1


--report 5
--•	Report that takes exam number and returns 
--	the Questions in it and chocies [freeform report]
create or alter proc Ques_in_Exam @exNum int
as 
select q.Q_Desc as 'Question', q.ChoiceA , q.ChoiceB , q.ChoiceC , q.ChoiceD
from Exam_Evaluated ev 
	inner join Question q on q.Q_Id = ev.Q_Id 
	where ev.Exam_Id = @exNum 

Ques_in_Exam 1
----------------------------------------------------------------
--report 6
--•	Report that takes exam number and the student ID 
--	then returns the Questions in this exam with the student answers. 

create or alter proc Std_Ans @exNum int, @sId int
as 
select q.Q_Desc as 'Question' , ev.Answer as 'Student Answer'
from Exam_Evaluated ev 
	inner join Question q on q.Q_Id = ev.Q_Id 
	inner join Student s on s.St_Id = ev.St_Id
	where ev.Exam_Id = @exNum and ev.St_Id = @sId 

Std_Ans 2,2