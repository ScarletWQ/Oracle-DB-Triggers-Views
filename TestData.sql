--test insert new data in to studenphonetview(neet to change id on each testing)
insert into StudentPhoneView (courseID, name, Gender, AGe, phone, email, Address)
values(1,'Amy A', 0, 10, '111-111-1111',  'abc@abc.abc', '111 post Road, Ottawa, Canada' );


select * from StudentPhoneView;
select * from studentPhoneView where courseID = 1;
select * from student_phone where studentid = 101;
select * from phonenumber where phone ='111-111-1111';


--test update the StudentPHoneview
select * from StudentPhoneView;
select * from Student;
select * from student_phone;

update StudentPhoneView
set phone = '333-333-3333'
where studentid = 1;

update studentphoneview set age=10 where studenid=1;
update student_phone set endtime=null where phoneid=1 and studentid=1;


select * from StudentPhoneView where studentid = 1;
select * from student_phone where studentid = 2;

select * from phonenumber;


--test delete 

select * from studentphoneview;
delete from studentphoneview where studentid = 1;

select * from studentphoneview;
-----------------------------------------

--test Coach
--try:
--select * from coach;
--select * from experiences;
--select * from coach_experience;
---select * from coach_view;
commit;
--rollback;

DELETE FROM COACH_VIEW
WHERE CoachID = 1;

INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty,  Experience)
VALUES (1, 1, 'Certified Tennis Coach', 'Tennis', '5 years of coaching experience');

--UPDATE COACH_VIEW
SET specialty = 'Cyclinging'
WHERE CoachID = 10;

--UPDATE COACH_VIEW
SET experience = '10 years of coaching experience'
WHERE CoachID = 10;

select * from coach;

--Test Lesson


select * from lesson;
select * from lesson1;
select * from dayofweek;
select * from lesson_dayofweek;
select * from lesson_dayofweek_view;

insert into lesson_dayofWeek_view ( courseid, venue, duration, lesson_starttime, dayofweek)
values(1, 'nowhere', 1, '16:30:00', 1);

delete from lesson_dayofWeek_view where lessonid = 150;
update lesson_dayofWeek_view set venue = 'somewhere' where lessonid =1;