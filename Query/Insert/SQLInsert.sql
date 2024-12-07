INSERT INTO Course 
VALUES (1, 'HTML'),
	   (2, 'CSS'),
	   (3, 'JS'),
	   (4, 'C++'),
	   (5, 'C#'),
	   (6, 'XML'),
	   (7, 'Advanced JS'),
	   (8, 'UML'),
	   (9, 'SQL'),
	   (10, 'NodeJS'),
	   (11, 'MongoDB'),
	   (12, 'XHTML'),
	   (13, 'Advanced SQL'), 
	   (14, 'MySQL'),
	   (15, 'JAVA'),
	   (16, 'typescript'),
	   (17, 'Angular'),
	   (18, 'OOP'),
	   (19, 'LINQ'),
	   (20, 'EF');


INSERT INTO Branch (Branch_Id, Branch_Name, Branch_City, Branch_Street)
VALUES 
(1, 'Downtown Campus', 'New York', '5th Avenue'),
(2, 'Westside Campus', 'Los Angeles', 'Sunset Blvd'),
(3, 'Lakeside Branch', 'Chicago', 'Michigan Ave'),
(4, 'Midtown Branch', 'Houston', 'Main St'),
(5, 'Eastside Center', 'Phoenix', 'Central Ave'),
(6, 'Seaside Campus', 'San Diego', 'Ocean Blvd'),
(7, 'Hilltop Branch', 'San Francisco', 'Market St'),
(8, 'Riverside Campus', 'Austin', 'Riverside Dr'),
(9, 'North Campus', 'Seattle', 'Pike St'),
(10, 'South Branch', 'Miami', 'Ocean Dr');

INSERT INTO Instructor (Ins_Id, Ins_FName, Ins_LName, Ins_Salary, Ins_Bd, Ins_HirDate, Ins_City, Ins_Street, Branch_Id, Ins_Gender)
VALUES 
(1, 'John', 'Doe', 5000, '1985-06-15', DEFAULT, 'New York', '5th Avenue', 1, 'M'),
(2, 'Jane', 'Smith', 6000, '1990-04-20', DEFAULT, 'Los Angeles', 'Sunset Blvd', 2, 'F'),
(3, 'Michael', 'Brown', 4500, '1987-08-11', DEFAULT, 'Chicago', 'Michigan Ave', 1, 'M'),
(4, 'Emily', 'Davis', 5500, '1993-03-25', DEFAULT, 'Houston', 'Main St', 3, 'F'),
(5, 'Robert', 'Wilson', 4800, '1988-12-01', DEFAULT, 'Phoenix', 'Central Ave', 2, 'M'),
(6, 'Sophia', 'Taylor', 7000, '1992-07-18', DEFAULT, 'San Diego', 'Market St', 3, 'F'),
(7, 'William', 'Moore', 5300, '1986-01-10', DEFAULT, 'Dallas', 'Elm St', 1, 'M'),
(8, 'Olivia', 'Jackson', 6200, '1991-09-07', DEFAULT, 'San Francisco', 'Bay St', 2, 'F'),
(9, 'James', 'Harris', 4700, '1984-11-30', DEFAULT, 'Austin', 'Congress Ave', 1, 'M'),
(10, 'Emma', 'Martin', 5600, '1995-05-22', DEFAULT, 'Seattle', 'Pike St', 3, 'F'),
(11, 'Benjamin', 'Clark', 5100, '1989-10-14', DEFAULT, 'Denver', 'Colfax Ave', 2, 'M'),
(12, 'Ava', 'Lewis', 5800, '1994-06-09', DEFAULT, 'Boston', 'Beacon St', 3, 'F'),
(13, 'Henry', 'Walker', 4600, '1983-07-03', DEFAULT, 'Miami', 'Ocean Dr', 1, 'M'),
(14, 'Mia', 'Hall', 6500, '1990-02-18', DEFAULT, 'Atlanta', 'Peachtree St', 2, 'F'),
(15, 'Alexander', 'Allen', 5400, '1988-04-08', DEFAULT, 'San Antonio', 'Riverwalk', 3, 'M'),
(16, 'Charlotte', 'Young', 6100, '1991-11-12', DEFAULT, 'Orlando', 'Orange Ave', 1, 'F'),
(17, 'Ethan', 'King', 5200, '1986-09-22', DEFAULT, 'Las Vegas', 'Fremont St', 2, 'M'),
(18, 'Amelia', 'Wright', 5700, '1993-01-19', DEFAULT, 'Philadelphia', 'Market St', 3, 'F'),
(19, 'Logan', 'Scott', 4900, '1987-03-05', DEFAULT, 'Portland', 'Burnside St', 1, 'M'),
(20, 'Isabella', 'Green', 6600, '1992-08-27', DEFAULT, 'Salt Lake City', 'Main St', 2, 'F');

INSERT INTO Track (Track_Id, Track_Name, Track_Desc)
VALUES 
(1, 'Data Science', 'Focus on data analysis and AI'),
(2, 'Web Development', 'Frontend and Backend programming'),
(3, 'Mobile Development', 'Android and iOS applications'),
(4, 'Cybersecurity', 'Protecting digital assets'),
(5, 'Cloud Computing', 'AWS, Azure, and GCP platforms'),
(6, 'Networking', 'Building and managing networks'),
(7, 'DevOps', 'CI/CD pipelines and automation'),
(8, 'Game Development', 'Building games with Unity and Unreal'),
(9, 'AI and Machine Learning', 'Neural networks and deep learning'),
(10, 'UI/UX Design', 'Designing user experiences'),
(11, 'Blockchain', 'Decentralized applications'),
(12, 'IoT', 'Internet of Things projects'),
(13, 'Big Data', 'Managing large datasets'),
(14, 'Embedded Systems', 'Programming hardware devices'),
(15, 'Database Management', 'SQL and NoSQL systems'),
(16, 'Digital Marketing', 'SEO and online advertising'),
(17, 'IT Support', 'Technical troubleshooting'),
(18, 'AR/VR', 'Augmented and Virtual Reality'),
(19, 'Software Testing', 'Ensuring software quality'),
(20, 'Robotics', 'Programming robots and automation');

INSERT INTO Topic (Topic_Id, Topic_Desc, C_Id)
VALUES 
(1, 'Introduction to Programming', 1),
(2, 'Variables and Data Types', 1),
(3, 'Control Structures', 1),
(4, 'Object-Oriented Concepts', 2),
(5, 'Inheritance and Polymorphism', 2),
(6, 'Database Design', 3),
(7, 'SQL Queries', 3),
(8, 'Normalization Techniques', 3),
(9, 'Web Basics', 4),
(10, 'HTML and CSS', 4),
(11, 'JavaScript Essentials', 4),
(12, 'Responsive Design', 4),
(13, 'Mobile UI Design', 5),
(14, 'Android Fundamentals', 5),
(15, 'iOS Development Basics', 5),
(16, 'Introduction to Cybersecurity', 6),
(17, 'Network Security', 6),
(18, 'Ethical Hacking Basics', 6),
(19, 'Cloud Fundamentals', 7),
(20, 'AWS Services Overview', 7);

INSERT INTO Student (St_Id, St_FName, St_LName, St_Email, St_Password, St_Gender, St_Bd, St_Grade, St_City, St_Street, Track_Id)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', 'M', '2000-05-15', 85.5, 'New York', '5th Avenue', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'pass1234', 'F', '1999-03-22', 92.3, 'Los Angeles', 'Sunset Blvd', 2),
(3, 'Michael', 'Brown', 'michael.brown@example.com', 'mypassword', 'M', '2001-11-10', 78.0, 'Chicago', 'Michigan Ave', 3),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 'emily123', 'F', '1998-07-08', 89.6, 'Houston', 'Main St', 4),
(5, 'William', 'Johnson', 'will.johnson@example.com', 'willpass', 'M', '2002-01-25', 76.4, 'Phoenix', 'Central Ave', 5),
(6, 'Olivia', 'Wilson', 'olivia.wilson@example.com', 'olivia456', 'F', '2000-04-12', 95.2, 'San Diego', 'Ocean Blvd', 6),
(7, 'James', 'Taylor', 'james.taylor@example.com', 'jtaylor789', 'M', '1997-08-14', 88.7, 'San Francisco', 'Market St', 7),
(8, 'Sophia', 'Moore', 'sophia.moore@example.com', 'sophiapass', 'F', '1999-12-19', 90.1, 'Austin', 'Riverside Dr', 8),
(9, 'Benjamin', 'Anderson', 'ben.anderson@example.com', 'benpass123', 'M', '2001-06-05', 82.4, 'Seattle', 'Pike St', 9),
(10, 'Ava', 'Thomas', 'ava.thomas@example.com', 'avapass', 'F', '2002-09-28', 87.0, 'Miami', 'Ocean Dr', 10),
(11, 'Ethan', 'Jackson', 'ethan.jackson@example.com', 'ethanpass', 'M', '2000-03-17', 80.3, 'New York', '5th Avenue', 1),
(12, 'Mia', 'White', 'mia.white@example.com', 'miapass', 'F', '1998-11-30', 85.8, 'Los Angeles', 'Sunset Blvd', 2),
(13, 'Alexander', 'Harris', 'alex.harris@example.com', 'alexpass', 'M', '1999-01-21', 93.4, 'Chicago', 'Michigan Ave', 3),
(14, 'Isabella', 'Martin', 'isabella.martin@example.com', 'isabellapass', 'F', '1997-05-06', 96.0, 'Houston', 'Main St', 4),
(15, 'Daniel', 'Thompson', 'daniel.thompson@example.com', 'daniel123', 'M', '2002-02-11', 78.5, 'Phoenix', 'Central Ave', 5),
(16, 'Charlotte', 'Garcia', 'charlotte.garcia@example.com', 'charlotte456', 'F', '1999-09-23', 89.9, 'San Diego', 'Ocean Blvd', 6),
(17, 'Matthew', 'Martinez', 'matthew.martinez@example.com', 'matthewpass', 'M', '2000-07-19', 84.6, 'San Francisco', 'Market St', 7),
(18, 'Amelia', 'Rodriguez', 'amelia.rodriguez@example.com', 'ameliapass', 'F', '2001-10-01', 91.5, 'Austin', 'Riverside Dr', 8),
(19, 'Henry', 'Clark', 'henry.clark@example.com', 'henry123', 'M', '1998-06-15', 83.7, 'Seattle', 'Pike St', 9),
(20, 'Grace', 'Lewis', 'grace.lewis@example.com', 'gracepass', 'F', '1997-12-24', 94.8, 'Miami', 'Ocean Dr', 10);

INSERT INTO Exam (Exam_Id, Exam_Duration, C_Id)
VALUES 
(1, '60 minutes', 1),
(2, '90 minutes', 2),
(3, '120 minutes', 3),
(4, '45 minutes', 4),
(5, '30 minutes', 5),
(6, '75 minutes', 6),
(7, '50 minutes', 7),
(8, '100 minutes', 8),
(9, '80 minutes', 9),
(10, '40 minutes', 10),
(11, '70 minutes', 1),
(12, '55 minutes', 2),
(13, '85 minutes', 3),
(14, '110 minutes', 4),
(15, '25 minutes', 5),
(16, '95 minutes', 6),
(17, '105 minutes', 7),
(18, '35 minutes', 8),
(19, '65 minutes', 9),
(20, '20 minutes', 10);

INSERT INTO Question (Q_Id, Q_Type, Q_Desc, Q_Grade, Q_ModelAnswer, ChoiceA, ChoiceB, ChoiceC, ChoiceD)
VALUES
(1, 'MCQ', 'What is the capital of France?', 5, 'Paris', 'London', 'Berlin', 'Paris', 'Madrid'),
(2, 'MCQ', 'Which planet is known as the Red Planet?', 5, 'Mars', 'Venus', 'Mars', 'Jupiter', 'Saturn'),
(3, 'MCQ', 'What is the largest ocean on Earth?', 5, 'Pacific', 'Atlantic', 'Indian', 'Pacific', 'Arctic'),
(4, 'MCQ', 'Who wrote "Romeo and Juliet"?', 5, 'Shakespeare', 'Dickens', 'Shakespeare', 'Hemingway', 'Fitzgerald'),
(5, 'T-F', 'The sun rises in the west.', 2, 'False', NULL, NULL, NULL, NULL),
(6, 'T-F', 'Water freezes at 0 degrees Celsius.', 2, 'True', NULL, NULL, NULL, NULL),
(7, 'MCQ', 'What is the chemical symbol for water?', 5, 'H2O', 'H2', 'O2', 'H2O', 'HO2'),
(8, 'MCQ', 'What is the square root of 64?', 5, '8', '6', '7', '8', '9'),
(9, 'T-F', 'The Great Wall of China is visible from space.', 2, 'False', NULL, NULL, NULL, NULL),
(10, 'T-F', 'Lightning never strikes the same place twice.', 2, 'False', NULL, NULL, NULL, NULL),
(11, 'MCQ', 'What is the smallest prime number?', 5, '2', '1', '2', '3', '5'),
(12, 'MCQ', 'Which element has the atomic number 1?', 5, 'Hydrogen', 'Helium', 'Oxygen', 'Hydrogen', 'Nitrogen'),
(13, 'T-F', 'Humans can breathe underwater without equipment.', 2, 'False', NULL, NULL, NULL, NULL),
(14, 'T-F', 'Sound travels faster in air than in water.', 2, 'False', NULL, NULL, NULL, NULL),
(15, 'MCQ', 'What is the capital of Japan?', 5, 'Tokyo', 'Seoul', 'Tokyo', 'Beijing', 'Bangkok'),
(16, 'MCQ', 'Which gas do plants absorb for photosynthesis?', 5, 'Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Helium'),
(17, 'T-F', 'Earth is the third planet from the sun.', 2, 'True', NULL, NULL, NULL, NULL),
(18, 'T-F', 'The Eiffel Tower is in Italy.', 2, 'False', NULL, NULL, NULL, NULL),
(19, 'MCQ', 'Which programming language is known as the language of the web?', 5, 'JavaScript', 'Python', 'JavaScript', 'C++', 'Ruby'),
(20, 'MCQ', 'What is 5 multiplied by 6?', 5, '30', '25', '30', '35', '40');



INSERT INTO Instructor_Teach_Course (C_Id, Ins_Id)
VALUES
(1, 20),
(2, 5),
(3, 12),
(4, 8),
(5, 17),
(6, 4),
(7, 13),
(8, 19),
(9, 15),
(10, 9),
(11, 2),
(12, 6),
(13, 1),
(14, 16),
(15, 7),
(16, 18),
(17, 14),
(18, 3),
(19, 10),
(20, 11);



INSERT INTO Branch_Contain_Track (Branch_Id, Track_Id)
VALUES
(1, 12),
(1, 5),
(2, 17),
(2, 9),
(3, 1),
(3, 8),
(4, 14),
(4, 15),
(5, 18),
(5, 6),
(6, 11),
(6, 3),
(7, 16),
(7, 19),
(8, 7),
(8, 2),
(9, 13),
(9, 4),
(10, 20),
(10, 10);


INSERT INTO Track_Include_Course (C_Id, Track_Id)
VALUES
(1, 3),
(2, 15),
(3, 7),
(4, 20),
(5, 5),
(6, 13),
(7, 11),
(8, 18),
(9, 6),
(10, 2),
(11, 19),
(12, 17),
(13, 9),
(14, 14),
(15, 4),
(16, 12),
(17, 10),
(18, 16),
(19, 8),
(20, 1);

INSERT INTO Exam_Evaluated (St_Id, Exam_Id, Q_Id, Grade, Answer, Date)
VALUES
-- بيانات الطالب الأول
(1, 1, 1, 10, 'True', '2024-11-01'),
(1, 1, 2, 8, 'False', '2024-11-01'),
(1, 1, 3, 9, 'True', '2024-11-01'),

-- بيانات الطالب الثاني
(2, 2, 4, 7, 'False', '2024-11-02'),
(2, 2, 5, 6, 'True', '2024-11-02'),
(2, 2, 6, 10, 'True', '2024-11-02'),

-- بيانات الطالب الثالث
(3, 3, 7, 5, 'False', '2024-11-03'),
(3, 3, 8, 9, 'True', '2024-11-03'),
(3, 3, 9, 8, 'False', '2024-11-03'),

-- بيانات الطالب الرابع
(4, 4, 10, 6, 'True', '2024-11-04'),
(4, 4, 11, 10, 'False', '2024-11-04'),
(4, 4, 12, 9, 'True', '2024-11-04');


INSERT INTO Student_Take_Course (C_Id, St_Id, Grade)
VALUES
(1, 1, 78),
(2, 2, 85),
(3, 3, 92),
(4, 4, 68),
(5, 5, 74),
(6, 6, 88),
(7, 7, 95),
(8, 8, 81),
(9, 9, 79),
(10, 10, 93),
(11, 11, 76),
(12, 12, 84),
(13, 13, 90),
(14, 14, 69),
(15, 15, 72),
(16, 16, 87),
(17, 17, 96),
(18, 18, 80),
(19, 19, 77),
(20, 20, 91);
--------------------------------------------------------
INSERT INTO Student_Take_Course (C_Id, St_Id)
VALUES
(1, 10),
(2, 5),
(3, 16),
(4, 7),
(5, 11),
(6, 19),
(7, 2),
(8, 14),
(9, 20),
(10, 3),
(11, 17),
(12, 8),
(13, 12),
(14, 4),
(15, 15),
(16, 18),
(17, 9),
(18, 6),
(19, 13),
(20, 1);

INSERT INTO Exam_contain_Qestions (Exam_Id, Q_Id)
VALUES
(1, 5),
(2, 12),
(3, 7),
(4, 15),
(5, 10),
(6, 20),
(7, 2),
(8, 18),
(9, 13),
(10, 1),
(11, 9),
(12, 14),
(13, 6),
(14, 3),
(15, 16),
(16, 11),
(17, 19),
(18, 17),
(19, 4),
(20, 8);

INSERT INTO Course_Have_Question (Q_Id, C_Id)
VALUES
(1, 5),
(2, 12),
(3, 8),
(4, 16),
(5, 2),
(6, 9),
(7, 13),
(8, 14),
(9, 3),
(10, 18),
(11, 7),
(12, 15),
(13, 17),
(14, 19),
(15, 4),
(16, 20),
(17, 10),
(18, 6),
(19, 11),
(20, 1);

