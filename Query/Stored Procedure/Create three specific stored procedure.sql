alter proc GenerateExam 
@id int, @duration varchar(50),
@mcq int,@t_f int,@cid int,@sid int
as
	if exists(select C_Id from Course where C_Id = @cid)
	begin 
		if not exists(select Exam_Id from Exam where Exam_Id = @id)
		begin 
		if exists(select St_Id from Student where St_Id = @sid)
			begin
				insert into Exam values(@id,@duration,@cid)

				INSERT INTO Exam_Evaluated (St_Id, Exam_Id, Q_Id)
				SELECT TOP (@t_f) @sid, @id, q.Q_Id
				FROM Question q
				WHERE q.C_Id = @cid AND q.Q_Type = 't-f'
				ORDER BY NEWID();

				INSERT INTO Exam_Evaluated (St_Id, Exam_Id, Q_Id)
				SELECT TOP (@mcq) @sid, @id, q.Q_Id
				FROM Question q
				WHERE q.C_Id = @cid AND q.Q_Type = 'mcq'
				ORDER BY NEWID();

			end
			else
				select 'student not found'
		end
		else
			select 'exam is exists'
	end
	else
		select 'corse not found'

GenerateExam 21,'30 min',6,4,5,1

delete from exam where Exam_Id = 21
delete from Exam_Evaluated where Exam_Id = 21
-----------------------------------------------------------------
alter PROCEDURE ExamAnswers
    @eid INT, -- Exam ID
    @sid INT, -- Student ID
    @answer1 NVARCHAR(50), -- Answer and Grade for Q1
    @answer2 NVARCHAR(50), -- Answer and Grade for Q2
    @answer3 NVARCHAR(50), -- Answer and Grade for Q3
    @answer4 NVARCHAR(50), -- Answer and Grade for Q4
    @answer5 NVARCHAR(50), -- Answer and Grade for Q5
    @answer6 NVARCHAR(50), -- Answer and Grade for Q6
    @answer7 NVARCHAR(50), -- Answer and Grade for Q7
    @answer8 NVARCHAR(50), -- Answer and Grade for Q8
    @answer9 NVARCHAR(50), -- Answer and Grade for Q9
    @answer10 NVARCHAR(50) -- Answer and Grade for Q10
AS
BEGIN
     UPDATE Exam_Evaluated
    SET Answer = @answer1
    WHERE St_Id = @sid AND Exam_Id = @eid 
      AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = 1 AND Exam_Id = 21) AS Temp
                  WHERE RowNum = 1);

	UPDATE Exam_Evaluated
    SET Answer = @answer2
    WHERE St_Id = @sid AND Exam_Id = @eid 
      AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 2);

			UPDATE Exam_Evaluated
				SET Answer = @answer3
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 3);

			 UPDATE Exam_Evaluated
				SET Answer = @answer4
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 4);

			  UPDATE Exam_Evaluated
				SET Answer = @answer5
				WHERE St_Id = @sid AND Exam_Id = @eid 
					AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 5);

			UPDATE Exam_Evaluated
				SET Answer = @answer6
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 6);

			UPDATE Exam_Evaluated
				SET Answer = @answer7
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 7);

			UPDATE Exam_Evaluated
				SET Answer = @answer8
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 8);
				 
			UPDATE Exam_Evaluated
				SET Answer = @answer9
				WHERE St_Id = @sid AND Exam_Id = @eid 
				  AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 9);

			UPDATE Exam_Evaluated
				SET Answer = @answer10
				WHERE St_Id = @sid AND Exam_Id = @eid 
					AND Q_Id = (SELECT Q_Id FROM 
                    (SELECT Q_Id, ROW_NUMBER() OVER (ORDER BY Exam_Id) AS RowNum 
                     FROM Exam_Evaluated 
                     WHERE St_Id = @sid AND Exam_Id = @eid) AS Temp
                  WHERE RowNum = 10);
	end

ExamAnswers 21,1,true,true,false,true,a,b,c,c,d,a
-------------------------------------------------------------------
create proc ExamCorrection @eid int,@sid int
as
declare @t int
	=(select sum(q.Q_Grade) as 'your grade' from Exam_Evaluated ev
	inner join Question q on  q.Q_Id = ev.Q_Id
	where q.Q_ModelAnswer = ev.Answer
	and ev.St_Id = 1 and ev.Exam_Id = 21)
	declare @c int =
	(select sum(q.Q_Grade) as 'total grade' from Exam_Evaluated ev
	inner join Question q on  q.Q_Id = ev.Q_Id
	and ev.St_Id = 1 and ev.Exam_Id = 21)
	
	select @t as 'Your Grade' ,@c as 'Totale Grade'
	
ExamCorrection 21 , 1

