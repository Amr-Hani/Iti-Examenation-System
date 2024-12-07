use ITI_Examenation

create table Branch
(
	Branch_Id int primary key,
	Branch_Name varchar(50),
	Branch_City varchar(50),
	Branch_Street varchar(50),
)


create table Instructor
(
	Ins_Id int primary key,
	Ins_FName varchar(50),
	Ins_LName varchar(50),
	Ins_Salary int,
	Ins_Bd date,
	Ins_Age as year(getdate()) - year(Ins_Bd),
	Ins_HirDate date default getdate(),
	Ins_City varchar(50),
	Ins_Street varchar(50),
	Branch_Id int foreign key references Branch(Branch_Id),
	Ins_Gender varchar(1),
	constraint c1 check(Ins_Gender='F' or Ins_Gender='M'),
)

create table Track
(
	Track_Id int primary key,
	Track_Name varchar(50),
	Track_Desc varchar(50),
	Track_Manager varchar(50)
)

create table Branch_Contain_Track
(
	Branch_Id int foreign key references Branch(Branch_Id),
	Track_Id int foreign key references Track(Track_Id),
	constraint c2 primary key(Branch_Id,Track_Id)
)

create table Course
(
	C_Id int primary key,
	C_Name varchar(20),
)

create table Track_Include_Course
(
	C_Id int foreign key references Course(C_Id),
	Track_Id int foreign key references Track(Track_Id)
	constraint c4 primary key(C_Id,Track_Id)
)

create table Instructor_Teach_Course
(
	C_Id int foreign key references Course(C_Id),
	Ins_Id int foreign key references Instructor(Ins_Id)
	constraint c5 primary key(C_Id,Ins_Id)
)

create table Student
(
	St_Id int Primary key,
	St_FName varchar(20),
	St_LName varchar(20),
	St_Email varchar(50),
	St_Password varchar(20),
	St_Gender varchar(1),
	St_Bd date,
	St_Age as year(getdate()) - year(St_Bd),
	St_Grade float,
	St_City varchar(50),
	St_Street varchar(50),
	Track_Id int foreign key references Track(Track_Id),
	constraint c3 check(St_Gender='F' or St_Gender='M'),
)

create table Topic
(
	Topic_Id int primary key,
	Topic_Desc varchar(50),
	C_Id int,
	 constraint c7 foreign key(C_Id) references Course(C_Id)
     on delete cascade on update cascade
)

create table Question
(
	Q_Id int primary key ,
	Q_Type varchar(3),
	Q_Desc varchar(150),
	Q_Grade int ,
	Q_ModelAnswer varchar(150),
	ChoiceA varchar(50),
	ChoiceB varchar(50),
	ChoiceC varchar(50),
	ChoiceD varchar(50),
	 C_Id int foreign key references Course(C_Id),
	constraint c8 check(Q_Type='MCQ' or Q_Type='T-F')
)


create table Exam
(
	Exam_Id int primary key ,
	Exam_Duration varchar(50),
	C_Id int foreign key references Course(C_Id)
)

create table Exam_Evaluated
(
	St_Id int foreign key references Student(St_Id),
	Exam_Id int foreign key references Exam(Exam_Id),
	Q_Id int foreign key references Question(Q_Id),
	Grade int,
	Answer varchar(50),
	Date date
	
)

alter table Exam_Evaluated add artificial int identity

create table Student_Take_Course
(
	C_Id int foreign key references Course(C_Id),
	St_Id int foreign key references Student(St_Id),
	Grade int,
	constraint c6 primary key(C_Id,St_Id)
)



--------------------------------
create table Student_Take_Course
(
	C_Id int foreign key references Course(C_Id),
	St_Id int foreign key references Student(St_Id),
	constraint c6 primary key(C_Id,St_Id)
)

create table Student_Take_Exam
(
	St_Id int  foreign key references Student(St_Id),
	Exam_Id int  foreign key references Exam(Exam_Id),
	Exam_Grade int,
	Exam_Date date,
	constraint c11 primary key (St_Id,Exam_Id)
)

create table Exam_contain_Qestions 
(
	Exam_Id int  foreign key references Exam(Exam_Id),
	Q_Id int foreign key references Question (Q_Id),
	constraint c12 primary key (Exam_Id , Q_Id)
)

------------------------------

backup database ITI_Examenation
to disk = 'D:el distenation ya lol.bak'
/**/










