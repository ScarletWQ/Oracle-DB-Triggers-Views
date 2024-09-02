create table ExtracurricularActivity (
	ActivityID int not null,
	ActivityName varchar(20) not null,
	Description varchar(50),
	constraint ActivityPK primary key(ActivityID)
);


create table Course (
	CourseID int not null,
	ActivityID int not null,
	Type varchar(20) not null,
	Prerequisites varchar(50),
	MaxPartcipants int not null,
	ParticipantsCount int not null,
	constraint CoursePK primary key(CourseID),
	constraint CourseFK foreign key(ActivityID) references ExtracurricularActivity(ActivityID)
);

create table Lesson (
	LessonID int not null,
	CourseID int not null,
	Venue varchar(50) not null,
	Duration int not null,
	StartTime varchar(10) not null,
	--StartTime time not null,    oracle cannot accept time
	DayofWeek int not null,
	constraint LessonPK primary key(LessonID),
	constraint LessonFK foreign key(CourseID) references Course(CourseID)
);

create table Student (
	StudentID int not null,
	CourseID int not null,
	Name varchar(30) not null,
	Gender int not null,
	Age int not null,
	Phone varchar(20),
	Email varchar(50) not null,
	Address varchar(50) not null,
	constraint StudentPK primary key(StudentID),
	constraint StudentFK foreign key(CourseID) references Course(CourseID)
);

create table Staff (
	StaffID int not null,
	CourseID int not null,
	Name varchar(30) not null,
	Email varchar(50) not null,
	Phone varchar(20) not null,
	constraint StaffPK primary key(StaffID),
	constraint StaffFK foreign key(CourseID) references Course(CourseID)
) ;

create table Coach (
	CoachID int not null,
	StaffID int not null,
	Certification varchar(40),
	Experience varchar(40),
	Specialty varchar(40),
	constraint CoachPK primary key(CoachID),
	constraint CoachFK foreign key(StaffID) references Staff(StaffID)
);

create table Assistant (
	AssistantID int not null,
	StaffID int not null,
	Certification varchar(40),
	Experience varchar(40),
	Role varchar(40),
	constraint AssistantPK primary key(AssistantID),
	constraint AssistantFK foreign key(StaffID) references Staff(StaffID)
);

-- Activities
INSERT INTO ExtracurricularActivity (ActivityID, ActivityName, Description) VALUES 
	(1, 'Sport', 'Various physical activities and games');
INSERT INTO ExtracurricularActivity (ActivityID, ActivityName, Description) VALUES 
	(2, 'Art', 'Creative activities like drawing and painting');
INSERT INTO ExtracurricularActivity (ActivityID, ActivityName, Description) VALUES 
	(3, 'Music', 'Activities involving playing and listening');
INSERT INTO ExtracurricularActivity (ActivityID, ActivityName, Description) VALUES 
	(4, 'Dance', 'Various styles of dance activities');

-- Insert 10 fake records for Sport (ActivityID = 1)
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (1, 1, 'Basketball', 'None', 20, 15);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (2, 1, 'Soccer', 'None', 22, 18);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (3, 1, 'Swimming', 'Basic swimming skills', 10, 8);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (4, 1, 'Volleyball', 'None', 12, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (5, 1, 'Tennis', 'Own a racket', 8, 6);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (6, 1, 'Baseball', 'None', 18, 14);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (7, 1, 'Track', 'None', 25, 20);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (8, 1, 'Gymnastics', 'None', 15, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (9, 1, 'Badminton', 'None', 10, 7);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (10, 1, 'Table Tennis', 'None', 8, 6);

-- Insert 10 fake records for Art (ActivityID = 2)
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (11, 2, 'Painting', 'None', 15, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (12, 2, 'Sculpture', 'None', 10, 7);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (13, 2, 'Digital Art', 'Basic computer skills', 12, 9);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (14, 2, 'Photography', 'Own a camera', 10, 8);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (15, 2, 'Graphic Design', 'Basic drawing skills', 12, 9);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (16, 2, 'Ceramics', 'None', 10, 6);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (17, 2, 'Illustration', 'None', 15, 12);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (18, 2, 'Calligraphy', 'None', 10, 8);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (19, 2, 'Printmaking', 'None', 8, 6);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (20, 2, 'Mixed Media', 'None', 12, 10);

-- Insert 10 fake records for Music (ActivityID = 3)
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (21, 3, 'Choir', 'None', 30, 25);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (22, 3, 'Guitar Lessons', 'Own a guitar', 10, 6);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (23, 3, 'Piano Lessons', 'None', 8, 5);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (24, 3, 'Drumming', 'None', 10, 7);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (25, 3, 'Violin Lessons', 'Own a violin', 8, 4);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (26, 3, 'Flute Lessons', 'None', 10, 6);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (27, 3, 'Saxophone Lessons', 'None', 10, 5);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (28, 3, 'Trumpet Lessons', 'None', 8, 4);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (29, 3, 'Music Theory', 'None', 12, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (30, 3, 'Band', 'None', 20, 15);

-- Insert 10 fake records for Dance (ActivityID = 4)
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (31, 4, 'Hip Hop Dance', 'None', 20, 15);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (32, 4, 'Ballet', 'None', 15, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (33, 4, 'Contemporary Dance', 'None', 18, 12);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (34, 4, 'Jazz Dance', 'None', 20, 14);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (35, 4, 'Tap Dance', 'None', 15, 10);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (36, 4, 'Salsa Dance', 'None', 18, 13);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (37, 4, 'Ballroom Dance', 'None', 20, 16);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (38, 4, 'Folk Dance', 'None', 15, 12);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (39, 4, 'Modern Dance', 'None', 18, 14);
INSERT INTO Course (CourseID, ActivityID, Type, Prerequisites, MaxPartcipants, ParticipantsCount) VALUES (40, 4, 'Break Dance', 'None', 20, 15);

-- CourseID 1
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (1, 1, 'John Smith', 'john.smith@example.com', '123-456-7890')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (2, 1, 'Emily Johnson', 'emily.johnson@example.com', '234-567-8901')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (3, 1, 'Michael Williams', 'michael.williams@example.com', '345-678-9012')
SELECT * FROM dual;

-- CourseID 2
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (4, 2, 'Jessica Brown', 'jessica.brown@example.com', '456-789-0123')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (5, 2, 'Daniel Taylor', 'daniel.taylor@example.com', '567-890-1234')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (6, 2, 'Olivia Miller', 'olivia.miller@example.com', '678-901-2345')
SELECT * FROM dual;

-- CourseID 3
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (7, 3, 'William Davis', 'william.davis@example.com', '789-012-3456')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (8, 3, 'Emma Wilson', 'emma.wilson@example.com', '890-123-4567')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (9, 3, 'James Garcia', 'james.garcia@example.com', '901-234-5678')
SELECT * FROM dual;

-- CourseID 4
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (10, 4, 'Sophia Hernandez', 'sophia.hernandez@example.com', '012-345-6789')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (11, 4, 'Alexander Martinez', 'alexander.martinez@example.com', '123-456-7890')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (12, 4, 'Charlotte Anderson', 'charlotte.anderson@example.com', '234-567-8901')
SELECT * FROM dual;

-- CourseID 5
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (13, 5, 'Benjamin Nguyen', 'benjamin.nguyen@example.com', '345-678-9012')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (14, 5, 'Sophia Johnson', 'sophia.johnson@example.com', '456-789-0123')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (15, 5, 'William Brown', 'william.brown@example.com', '567-890-1234')
SELECT * FROM dual;

-- CourseID 6
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (16, 6, 'Olivia Taylor', 'olivia.taylor@example.com', '678-901-2345')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (17, 6, 'Noah Martinez', 'noah.martinez@example.com', '789-012-3456')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (18, 6, 'Emma Garcia', 'emma.garcia@example.com', '890-123-4567')
SELECT * FROM dual;

-- CourseID 7
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (19, 7, 'James Rodriguez', 'james.rodriguez@example.com', '901-234-5678')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (20, 7, 'Olivia Hernandez', 'olivia.hernandez@example.com', '012-345-6789')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (21, 7, 'Daniel Smith', 'daniel.smith@example.com', '123-456-7890')
SELECT * FROM dual;

-- CourseID 8
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (22, 8, 'Ava Johnson', 'ava.johnson@example.com', '234-567-8901')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (23, 8, 'William Wilson', 'william.wilson@example.com', '345-678-9012')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (24, 8, 'Sophia Davis', 'sophia.davis@example.com', '456-789-0123')
SELECT * FROM dual;

-- CourseID 9
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (25, 9, 'Alexander Taylor', 'alexander.taylor@example.com', '567-890-1234')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (26, 9, 'Olivia Martinez', 'olivia.martinez@example.com', '678-901-2345')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (27, 9, 'Ethan Johnson', 'ethan.johnson@example.com', '789-012-3456')
SELECT * FROM dual;

-- CourseID 10
INSERT ALL 
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (28, 10, 'Ava Brown', 'ava.brown@example.com', '890-123-4567')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (29, 10, 'William Garcia', 'william.garcia@example.com', '901-234-5678')
INTO Staff (StaffID, CourseID, Name, Email, Phone) VALUES (30, 10, 'Sophia Wilson', 'sophia.wilson@example.com', '012-345-6789')
SELECT * FROM dual;

-- CoachID 1
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(1, 1, 'Certified Tennis Coach', '5 years of coaching experience', 'Tennis');

-- CoachID 2
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(2, 4, 'Certified Swimming Coach', '7 years of coaching experience', 'Swimming');

-- CoachID 3
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(3, 7, 'Certified Basketball Coach', '6 years of coaching experience', 'Basketball');

-- CoachID 4
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(4, 10, 'Certified Soccer Coach', '8 years of coaching experience', 'Soccer');

-- CoachID 5
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(5, 13, 'Certified Volleyball Coach', '4 years of coaching experience', 'Volleyball');

-- CoachID 6
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(6, 16, 'Certified Gymnastics Coach', '9 years of coaching experience', 'Gymnastics');

-- CoachID 7
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(7, 19, 'Certified Martial Arts Coach', '10 years of coaching experience', 'Martial Arts');

-- CoachID 8
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(8, 22, 'Certified Yoga Coach', '6 years of coaching experience', 'Yoga');

-- CoachID 9
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(9, 25, 'Certified Golf Coach', '3 years of coaching experience', 'Golf');

-- CoachID 10
INSERT INTO Coach (CoachID, StaffID, Certification, Experience, Specialty) VALUES 
(10, 28, 'Certified Cycling Coach', '5 years of coaching experience', 'Cycling');


-- AssistantID 1
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(1, 2, 'First Aid Certification', '2 years of assistant experience', 'Assistant');

-- AssistantID 2
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(2, 3, 'Coaching Certification', '5 years of coaching experience', 'Assistant Coach');

-- AssistantID 3
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(3, 5, 'CPR Certification', '3 years of assistant experience', 'Assistant');

-- AssistantID 4
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(4, 6, 'Coaching Certification', '7 years of coaching experience', 'Assistant Coach');

-- AssistantID 5
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(5, 8, 'First Aid Certification', '1 year of assistant experience', 'Assistant');

-- AssistantID 6
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(6, 9, 'Coaching Certification', '6 years of coaching experience', 'Assistant Coach');

-- AssistantID 7
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(7, 11, 'CPR Certification', '2 years of assistant experience', 'Assistant');

-- AssistantID 8
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(8, 12, 'Coaching Certification', '8 years of coaching experience', 'Assistant Coach');

-- AssistantID 9
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(9, 14, 'First Aid Certification', '3 years of assistant experience', 'Assistant');

-- AssistantID 10
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(10, 15, 'Coaching Certification', '4 years of coaching experience', 'Assistant Coach');

-- AssistantID 11
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(11, 17, 'CPR Certification', '1 year of assistant experience', 'Assistant');

-- AssistantID 12
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(12, 18, 'Coaching Certification', '9 years of coaching experience', 'Assistant Coach');

-- AssistantID 13
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(13, 20, 'First Aid Certification', '2 years of assistant experience', 'Assistant');

-- AssistantID 14
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(14, 21, 'Coaching Certification', '10 years of coaching experience', 'Assistant Coach');

-- AssistantID 15
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(15, 23, 'CPR Certification', '3 years of assistant experience', 'Assistant');

-- AssistantID 16
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(16, 24, 'Coaching Certification', '6 years of coaching experience', 'Assistant Coach');

-- AssistantID 17
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(17, 26, 'First Aid Certification', '1 year of assistant experience', 'Assistant');

-- AssistantID 18
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(18, 27, 'Coaching Certification', '5 years of coaching experience', 'Assistant Coach');

-- AssistantID 19
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(19, 29, 'CPR Certification', '2 years of assistant experience', 'Assistant');

-- AssistantID 20
INSERT INTO Assistant (AssistantID, StaffID, Certification, Experience, Role) VALUES 
(20, 30, 'Coaching Certification', '3 years of coaching experience', 'Assistant Coach');

-- Insert lessons for each course

-- Lessons for CourseID = 1 (Basketball)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (1, 1, 'Gym A', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (2, 1, 'Gym A', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (3, 1, 'Gym A', 2, '16:00:00', 5);

-- Lessons for CourseID = 2 (Soccer)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (4, 2, 'Field B', 1, '16:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (5, 2, 'Field B', 1, '17:30:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (6, 2, 'Field B', 2, '16:30:00', 5);

-- Lessons for CourseID = 3 (Swimming)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (7, 3, 'Pool C', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (8, 3, 'Pool C', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (9, 3, 'Pool C', 2, '17:30:00', 4);

-- Lessons for CourseID = 4 (Volleyball)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (10, 4, 'Gym D', 1, '16:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (11, 4, 'Gym D', 1, '17:00:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (12, 4, 'Gym D', 2, '16:00:00', 5);

-- Lessons for CourseID = 5 (Tennis)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (13, 5, 'Court E', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (14, 5, 'Court E', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (15, 5, 'Court E', 2, '17:30:00', 5);

-- Lessons for CourseID = 6 (Baseball)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (16, 6, 'Field F', 1, '16:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (17, 6, 'Field F', 1, '17:00:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (18, 6, 'Field F', 2, '16:00:00', 5);

-- Lessons for CourseID = 7 (Track)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (19, 7, 'Track G', 1, '16:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (20, 7, 'Track G', 1, '17:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (21, 7, 'Track G', 2, '16:30:00', 5);

-- Lessons for CourseID = 8 (Gymnastics)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (22, 8, 'Gym H', 1, '15:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (23, 8, 'Gym H', 1, '16:30:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (24, 8, 'Gym H', 2, '17:30:00', 5);

-- Lessons for CourseID = 9 (Badminton)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (25, 9, 'Gym I', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (26, 9, 'Gym I', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (27, 9, 'Gym I', 2, '16:00:00', 5);

-- Lessons for CourseID = 10 (Table Tennis)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (28, 10, 'Gym J', 1, '15:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (29, 10, 'Gym J', 1, '16:30:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (30, 10, 'Gym J', 2, '17:30:00', 5);

-- Insert lessons for each course

-- Lessons for CourseID = 11 (Painting)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (31, 11, 'Art Room 1', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (32, 11, 'Art Room 1', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (33, 11, 'Art Room 1', 2, '17:30:00', 5);

-- Lessons for CourseID = 12 (Sculpture)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (34, 12, 'Art Room 2', 1, '17:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (35, 12, 'Art Room 2', 1, '16:30:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (36, 12, 'Art Room 2', 2, '17:30:00', 5);

-- Lessons for CourseID = 13 (Digital Art)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (37, 13, 'Computer Lab', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (38, 13, 'Computer Lab', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (39, 13, 'Computer Lab', 2, '17:30:00', 5);

-- Lessons for CourseID = 14 (Photography)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (40, 14, 'Photo Studio', 1, '17:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (41, 14, 'Photo Studio', 1, '16:00:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (42, 14, 'Photo Studio', 2, '17:30:00', 5);

-- Lessons for CourseID = 15 (Graphic Design)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (43, 15, 'Design Lab', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (44, 15, 'Design Lab', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (45, 15, 'Design Lab', 2, '16:00:00', 5);

-- Lessons for CourseID = 16 (Ceramics)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (46, 16, 'Ceramics Studio', 1, '17:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (47, 16, 'Ceramics Studio', 1, '16:00:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (48, 16, 'Ceramics Studio', 2, '17:30:00', 5);

-- Lessons for CourseID = 17 (Illustration)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (49, 17, 'Art Room 3', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (50, 17, 'Art Room 3', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (51, 17, 'Art Room 3', 2, '17:30:00', 5);

-- Lessons for CourseID = 18 (Calligraphy)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (52, 18, 'Art Room 4', 1, '16:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (53, 18, 'Art Room 4', 1, '17:00:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (54, 18, 'Art Room 4', 2, '16:00:00', 5);

-- Lessons for CourseID = 19 (Printmaking)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (55, 19, 'Print Lab', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (56, 19, 'Print Lab', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (57, 19, 'Print Lab', 2, '16:00:00', 5);

-- Lessons for CourseID = 20 (Mixed Media)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (58, 20, 'Mixed Media Lab', 1, '15:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (59, 20, 'Mixed Media Lab', 1, '16:30:00', 4);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (60, 20, 'Mixed Media Lab', 2, '17:30:00', 5);

-- Lessons for CourseID = 31 (Ballet)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (91, 31, 'Dance Studio A', 1, '16:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (92, 31, 'Dance Studio A', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (93, 31, 'Dance Studio A', 2, '16:00:00', 4);

-- Lessons for CourseID = 32 (Hip Hop)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (94, 32, 'Dance Studio B', 1, '16:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (95, 32, 'Dance Studio B', 1, '17:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (96, 32, 'Dance Studio B', 2, '16:30:00', 3);

-- Lessons for CourseID = 33 (Contemporary)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (97, 33, 'Dance Studio C', 1, '15:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (98, 33, 'Dance Studio C', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (99, 33, 'Dance Studio C', 2, '17:30:00', 4);

-- Lessons for CourseID = 34 (Jazz)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (100, 34, 'Dance Studio D', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (101, 34, 'Dance Studio D', 1, '17:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (102, 34, 'Dance Studio D', 2, '16:00:00', 3);

-- Lessons for CourseID = 35 (Tap)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (103, 35, 'Dance Studio E', 1, '16:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (104, 35, 'Dance Studio E', 1, '17:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (105, 35, 'Dance Studio E', 2, '16:30:00', 4);

-- Lessons for CourseID = 36 (Ballroom)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (106, 36, 'Dance Studio F', 1, '15:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (107, 36, 'Dance Studio F', 1, '16:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (108, 36, 'Dance Studio F', 2, '17:30:00', 3);

-- Lessons for CourseID = 37 (Latin Dance)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (109, 37, 'Dance Studio G', 1, '16:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (110, 37, 'Dance Studio G', 1, '17:00:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (111, 37, 'Dance Studio G', 2, '16:00:00', 4);

-- Lessons for CourseID = 38 (Folk Dance)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (112, 38, 'Dance Studio H', 1, '16:30:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (113, 38, 'Dance Studio H', 1, '17:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (114, 38, 'Dance Studio H', 2, '16:30:00', 3);

-- Lessons for CourseID = 39 (Modern Dance)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (115, 39, 'Dance Studio I', 1, '15:30:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (116, 39, 'Dance Studio I', 1, '16:30:00', 3);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (117, 39, 'Dance Studio I', 2, '17:30:00', 4);

-- Lessons for CourseID = 40 (Dance Choreography)
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (118, 40, 'Dance Studio J', 1, '16:00:00', 1);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (119, 40, 'Dance Studio J', 1, '17:00:00', 2);
INSERT INTO Lesson (LessonID, CourseID, Venue, Duration, StartTime, DayofWeek) VALUES (120, 40, 'Dance Studio J', 2, '16:00:00', 3);

-- CourseID 1
INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(1, 1, 'John Doe', 1, 14, '345-555-1234', 'john.doe@example.com', '123 Main St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(2, 1, 'Jane Smith', 0, 12, '345-555-5678', 'jane.smith@example.com', '456 Elm St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(3, 1, 'Michael Johnson', 1, 11, '345-555-9012', 'michael.johnson@example.com', '789 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(4, 1, 'Emily Brown', 0, 13, '345-555-3456', 'emily.brown@example.com', '1011 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(5, 1, 'Matthew Wilson', 1, 15, '345-555-7890', 'matthew.wilson@example.com', '1213 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(6, 1, 'Olivia Garcia', 0, 10, '345-555-1234', 'olivia.garcia@example.com', '1415 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(7, 1, 'William Martinez', 1, 16, '345-555-5678', 'william.martinez@example.com', '1617 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(8, 1, 'Sophia Rodriguez', 0, 9, '345-555-9012', 'sophia.rodriguez@example.com', '1819 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(9, 1, 'Ethan Hernandez', 1, 12, '345-555-3456', 'ethan.hernandez@example.com', '2021 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(10, 1, 'Isabella Lopez', 0, 14, '345-555-7890', 'isabella.lopez@example.com', '2223 Pine St');

-- CourseID 2
INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(11, 2, 'Daniel Wilson', 1, 13, '345-555-2468', 'daniel.wilson@example.com', '2325 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(12, 2, 'Amelia Taylor', 0, 15, '345-555-1357', 'amelia.taylor@example.com', '2627 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(13, 2, 'James White', 1, 12, '345-555-3698', 'james.white@example.com', '2829 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(14, 2, 'Ava Martinez', 0, 14, '345-555-9876', 'ava.martinez@example.com', '3031 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(15, 2, 'Alexander Lee', 1, 11, '345-555-7410', 'alexander.lee@example.com', '3233 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(16, 2, 'Mia Anderson', 0, 16, '345-555-8520', 'mia.anderson@example.com', '3435 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(17, 2, 'William Thompson', 1, 10, '345-555-9630', 'william.thompson@example.com', '3637 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(18, 2, 'Madison Nguyen', 0, 13, '345-555-1473', 'madison.nguyen@example.com', '3839 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(19, 2, 'Noah Thomas', 1, 15, '345-555-2589', 'noah.thomas@example.com', '4041 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(20, 2, 'Avery Harris', 0, 9, '345-555-3692', 'avery.harris@example.com', '4243 Oak St');

-- CourseID 3
INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(21, 3, 'Liam Smith', 1, 14, '345-555-4567', 'liam.smith@example.com', '4445 Elm St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(22, 3, 'Sophia Johnson', 0, 12, '345-555-7890', 'sophia.johnson@example.com', '4647 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(23, 3, 'Benjamin Williams', 1, 11, '345-555-1234', 'benjamin.williams@example.com', '4849 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(24, 3, 'Emma Brown', 0, 13, '345-555-5678', 'emma.brown@example.com', '5051 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(25, 3, 'Jacob Jones', 1, 15, '345-555-9012', 'jacob.jones@example.com', '5253 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(26, 3, 'Olivia Davis', 0, 10, '345-555-3456', 'olivia.davis@example.com', '5455 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(27, 3, 'William Miller', 1, 16, '345-555-6789', 'william.miller@example.com', '5657 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(28, 3, 'Emily Wilson', 0, 9, '345-555-9876', 'emily.wilson@example.com', '5859 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(29, 3, 'Alexander Taylor', 1, 12, '345-555-2468', 'alexander.taylor@example.com', '6061 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(30, 3, 'Sophia Anderson', 0, 14, '345-555-1357', 'sophia.anderson@example.com', '6263 Birch St');

-- CourseID 4
INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(31, 4, 'Michael Martinez', 1, 13, '345-555-3698', 'michael.martinez@example.com', '6465 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(32, 4, 'Charlotte Brown', 0, 15, '345-555-1473', 'charlotte.brown@example.com', '6667 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(33, 4, 'Ethan Nguyen', 1, 12, '345-555-2589', 'ethan.nguyen@example.com', '6869 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(34, 4, 'Ava Wilson', 0, 14, '345-555-4567', 'ava.wilson@example.com', '7071 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(35, 4, 'William Garcia', 1, 11, '345-555-7890', 'william.garcia@example.com', '7273 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(36, 4, 'Mia Hernandez', 0, 16, '345-555-1234', 'mia.hernandez@example.com', '7475 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(37, 4, 'James Lopez', 1, 10, '345-555-5678', 'james.lopez@example.com', '7677 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(38, 4, 'Olivia Smith', 0, 13, '345-555-9012', 'olivia.smith@example.com', '7879 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(39, 4, 'Noah Johnson', 1, 15, '345-555-2468', 'noah.johnson@example.com', '8081 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(40, 4, 'Sophia Martinez', 0, 9, '345-555-7890', 'sophia.martinez@example.com', '8283 Maple St');

-- CourseID 5
INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(41, 5, 'Benjamin Thompson', 1, 14, '345-555-3698', 'benjamin.thompson@example.com', '8485 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(42, 5, 'Emma Anderson', 0, 12, '345-555-1473', 'emma.anderson@example.com', '8687 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(43, 5, 'Daniel Harris', 1, 11, '345-555-2589', 'daniel.harris@example.com', '8889 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(44, 5, 'Olivia Davis', 0, 13, '345-555-4567', 'olivia.davis@example.com', '9091 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(45, 5, 'William Wilson', 1, 15, '345-555-7890', 'william.wilson@example.com', '9293 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(46, 5, 'Sophia Hernandez', 0, 16, '345-555-1234', 'sophia.hernandez@example.com', '9495 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(47, 5, 'Ethan Taylor', 1, 10, '345-555-5678', 'ethan.taylor@example.com', '9697 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(48, 5, 'Ava Miller', 0, 13, '345-555-9012', 'ava.miller@example.com', '9899 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(49, 5, 'Noah Brown', 1, 15, '345-555-2468', 'noah.brown@example.com', '10001 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES
(50, 5, 'Isabella Nguyen', 0, 9, '345-555-7890', 'isabella.nguyen@example.com', '10203 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(51, 6, 'Liam Johnson', 1, 14, '345-555-3698', 'liam.johnson@example.com', '10405 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(52, 6, 'Sophia Brown', 0, 12, '345-555-1473', 'sophia.brown@example.com', '10607 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(53, 6, 'Noah Jones', 1, 11, '345-555-2589', 'noah.jones@example.com', '10809 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(54, 6, 'Emma Garcia', 0, 13, '345-555-4567', 'emma.garcia@example.com', '11011 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(55, 6, 'Daniel Martinez', 1, 15, '345-555-7890', 'daniel.martinez@example.com', '11213 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(56, 6, 'Olivia Hernandez', 0, 16, '345-555-1234', 'olivia.hernandez@example.com', '11415 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(57, 6, 'William Smith', 1, 10, '345-555-5678', 'william.smith@example.com', '11617 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(58, 6, 'Ava Nguyen', 0, 13, '345-555-9012', 'ava.nguyen@example.com', '11819 Maple St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(59, 6, 'Benjamin Wilson', 1, 15, '345-555-2468', 'benjamin.wilson@example.com', '12021 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(60, 6, 'Emma,Taylor', 0, 9, '345-555-7890', 'emma.taylor@example.com', '12223 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(61, 7, 'Sophia Johnson', 0, 15, '345-555-1234', 'sophia.johnson@example.com', '12425 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(62, 7, 'William Williams', 1, 14, '345-555-5678', 'william.williams@example.com', '12627 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(63, 7, 'Olivia Brown', 0, 12, '345-555-9012', 'olivia.brown@example.com', '12829 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(64, 7, 'Liam Jones', 1, 13, '345-555-3698', 'liam.jones@example.com', '13031 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(65, 7, 'Emma Davis', 0, 16, '345-555-1473', 'emma.davis@example.com', '13233 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(66, 7, 'Noah Rodriguez', 1, 11, '345-555-2589', 'noah.rodriguez@example.com', '13435 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(67, 7, 'Ava Martinez', 0, 12, '345-555-7890', 'ava.martinez@example.com', '13637 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(68, 7, 'James Garcia', 1, 14, '345-555-4567', 'james.garcia@example.com', '13839 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(69, 7, 'Isabella Hernandez', 0, 15, '345-555-2468', 'isabella.hernandez@example.com', '14041 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(70, 7, 'Benjamin Lopez', 1, 13, '345-555-3698', 'benjamin.lopez@example.com', '14243 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(71, 8, 'Emily Wilson', 0, 14, '345-555-3698', 'emily.wilson@example.com', '14445 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(72, 8, 'Alexander Taylor', 1, 12, '345-555-1473', 'alexander.taylor@example.com', '14647 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(73, 8, 'Sophia Anderson', 0, 11, '345-555-2589', 'sophia.anderson@example.com', '14849 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(74, 8, 'Benjamin Wilson', 1, 13, '345-555-4567', 'benjamin.wilson@example.com', '15051 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(75, 8, 'Ava Taylor', 0, 15, '345-555-7890', 'ava.taylor@example.com', '15253 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(76, 8, 'William Martinez', 1, 16, '345-555-1234', 'william.martinez@example.com', '15455 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(77, 8, 'Olivia Johnson', 0, 10, '345-555-5678', 'olivia.johnson@example.com', '15657 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(78, 8, 'Ethan Garcia', 1, 13, '345-555-9012', 'ethan.garcia@example.com', '15859 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(79, 8, 'Emma Martinez', 0, 14, '345-555-2468', 'emma.martinez@example.com', '16061 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(80, 8, 'Daniel Rodriguez', 1, 12, '345-555-7890', 'daniel.rodriguez@example.com', '16263 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(81, 9, 'Emma Johnson', 0, 14, '345-555-3698', 'emma.johnson@example.com', '16465 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(82, 9, 'Daniel Williams', 1, 12, '345-555-1473', 'daniel.williams@example.com', '16667 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(83, 9, 'Olivia Brown', 0, 11, '345-555-2589', 'olivia.brown@example.com', '16869 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(84, 9, 'Liam Jones', 1, 13, '345-555-4567', 'liam.jones@example.com', '17071 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(85, 9, 'Sophia Davis', 0, 15, '345-555-7890', 'sophia.davis@example.com', '17273 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(86, 9, 'William Rodriguez', 1, 16, '345-555-1234', 'william.rodriguez@example.com', '17475 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(87, 9, 'Ava Martinez', 0, 10, '345-555-5678', 'ava.martinez@example.com', '17677 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(88, 9, 'James Garcia', 1, 13, '345-555-9012', 'james.garcia@example.com', '17879 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(89, 9, 'Isabella Hernandez', 0, 14, '345-555-2468', 'isabella.hernandez@example.com', '18081 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(90, 9, 'Benjamin Lopez', 1, 12, '345-555-7890', 'benjamin.lopez@example.com', '18283 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(91, 10, 'Sophia Wilson', 0, 14, '345-555-3698', 'sophia.wilson@example.com', '18485 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(92, 10, 'Alexander Taylor', 1, 12, '345-555-1473', 'alexander.taylor@example.com', '18687 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(93, 10, 'Emma Anderson', 0, 11, '345-555-2589', 'emma.anderson@example.com', '18889 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(94, 10, 'Benjamin Wilson', 1, 13, '345-555-4567', 'benjamin.wilson@example.com', '19091 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(95, 10, 'Ava Taylor', 0, 15, '345-555-7890', 'ava.taylor@example.com', '19293 Oak St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(96, 10, 'William Martinez', 1, 16, '345-555-1234', 'william.martinez@example.com', '19495 Pine St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(97, 10, 'Olivia Johnson', 0, 10, '345-555-5678', 'olivia.johnson@example.com', '19697 Cedar St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(98, 10, 'Ethan Garcia', 1, 13, '345-555-9012', 'ethan.garcia@example.com', '19899 Birch St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(99, 10, 'Emma Martinez', 0, 14, '345-555-2468', 'emma.martinez@example.com', '20001 Walnut St');

INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Phone, Email, Address) VALUES 
(100, 10, 'Daniel Rodriguez', 1, 12, '345-555-7890', 'daniel.rodriguez@example.com', '20203 Oak St');
