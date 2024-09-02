--create the three tables
RENAME Student TO student1;

create table Student (
	StudentID int not null,
	CourseID int not null,
	Name varchar(30) not null,
	Gender int not null,
	Age int not null,
	Email varchar(50) not null,
	Address varchar(50) not null,
	constraint StudentNPK primary key(StudentID),
	constraint StudentNFK foreign key(CourseID) references Course(CourseID)
);

create table PhoneNumber(
    PhoneID int not null,
	Phone varchar(20),
    constraint PhoneID primary key(PhoneID) 
);

create table Student_Phone(
    StudentID int not null,
    PhoneID int not null,
    StartTime timestamp NOT NULL,
    Endtime timestamp NULL,
    constraint Student_Phone_sudentIDFK foreign key(StudentID) references Student(StudentID),
    constraint Student_Phone_PhoneIDFK foreign key(PhoneID) references PhoneNumber(PhoneID)
);

--create seuency on primary key for table Student_new:
CREATE SEQUENCE Student_seq
 START WITH 101
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 
 --create  seuency on primary key for table Student_Phone:
 CREATE SEQUENCE Student_Phone_seq
 START WITH     101
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 
 --create view StudentPhoneView
CREATE OR REPLACE VIEW StudentPhoneView AS
SELECT 
    s.studentid, 
    s.courseid, 
    s.name, 
    s.gender, 
    s.age, 
    p.phoneid, 
    p.phone, 
    sp.starttime, 
    sp.endtime, 
    s.email, 
    s.address
FROM 
    Student s
LEFT JOIN 
    Student_Phone sp ON s.studentid = sp.studentid
LEFT JOIN 
    Phonenumber p ON p.phoneid = sp.phoneid
WHERE 
    sp.endtime IS NULL;
    
    
---COPPY VALUES FROM TABLE STUDENTS INTO THREE NEW TABLES.
 
BEGIN
    FOR student_record IN (SELECT studentid, courseid, name, gender, age, phone, email, address FROM student1) LOOP
        -- Insert into Student
        INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Email, Address)
        VALUES (student_record.studentid, student_record.courseid, student_record.name, student_record.gender, student_record.age, student_record.email, student_record.address);
        
        -- Insert into PhoneNumber
        INSERT INTO PhoneNumber(PhoneID, Phone)
        VALUES (student_record.studentid, student_record.phone);
        
        -- Insert into Student_Phone
        INSERT INTO Student_Phone (StudentID, PhoneID, StartTime, EndTime)
        VALUES (
            student_record.studentid,
            (SELECT PhoneID FROM PhoneNumber WHERE Phone = student_record.phone AND ROWNUM = 1),
            CURRENT_TIMESTAMP,NULL);
    END LOOP;
    COMMIT;
END;
/


--Triger on insert data into studentPhoneView
CREATE OR REPLACE TRIGGER STUDENTPHONEVIEW_INSERT
INSTEAD OF INSERT ON StudentPhoneView
FOR EACH ROW
DECLARE
    v_newPhoneID NUMBER;
    v_newStudentID NUMBER;
BEGIN
    -- Use the sequence to get the next PhoneID & StudentID
    SELECT Student_seq.NEXTVAL INTO v_newStudentID FROM dual;
    SELECT Student_Phone_seq.NEXTVAL INTO v_newPhoneID FROM dual;
        
    -- Insert into the Phonenumber table
    INSERT INTO Phonenumber (PhoneID, Phone)
    VALUES (v_newPhoneID, :NEW.phone);

    -- Insert into the Student table
    INSERT INTO Student (StudentID, CourseID, Name, Gender, Age, Email, Address)
    VALUES (v_newStudentID, :NEW.CourseID, :NEW.Name, :NEW.Gender, :NEW.Age, :NEW.Email, :NEW.Address);

    -- Insert into the Student_Phone table
    INSERT INTO Student_Phone (StudentID, PhoneID, StartTime)
    VALUES (v_newStudentID, v_newPhoneID, CURRENT_TIMESTAMP);
END;








-- triger on update studentPhoneView
CREATE OR REPLACE TRIGGER STUDENTPHONEVIEW_UPDATE
INSTEAD OF UPDATE ON StudentPhoneView
FOR EACH ROW
DECLARE
    v_newPhoneID NUMBER;
BEGIN
    -- Update the STUDENT table with new values
    UPDATE STUDENT
    SET CourseID = :NEW.CourseID,
        Name = :NEW.Name,
        Gender = :NEW.Gender,
        Age = :NEW.Age,
        Email = :NEW.Email,
        Address = :NEW.Address
    WHERE StudentID = :OLD.StudentID;

    -- Only update the phone number if it has changed
    IF :NEW.Phone <> :OLD.Phone THEN
        -- Update the STUDENT_PHONE table to set the EndTime
        UPDATE STUDENT_PHONE 
        SET EndTime = SYSDATE 
        WHERE StudentID = :OLD.StudentID
        AND EndTime IS NULL
        AND PhoneID = :OLD.PhoneID;

        -- Use the sequence to get the next PhoneID
        SELECT Student_Phone_seq.NEXTVAL INTO v_newPhoneID FROM dual;

        -- Insert the new phone number into PHONENUMBER table
        INSERT INTO PHONENUMBER (PhoneID, Phone)
        VALUES (v_newPhoneID, :NEW.Phone);

        -- Insert the new relationship into STUDENT_PHONE
        INSERT INTO STUDENT_PHONE (StudentID, PhoneID, StartTime)
        VALUES (:OLD.StudentID, v_newPhoneID, SYSDATE);
    END IF;
END;

-------------------------------------------------------------------------------------------------



--Trigger on delete record of studentphone view
CREATE OR REPLACE TRIGGER STUDENTPHONEVIEW_DELETE
INSTEAD OF DELETE ON StudentPhoneView
FOR EACH ROW
DECLARE
    CURSOR sp_cursor IS
        SELECT studentID, phoneID
        FROM student_phone
        WHERE studentID = :OLD.studentID;

    v_studentID student_phone.studentid%TYPE;
    v_phoneID student_phone.phoneID%TYPE;
BEGIN
    OPEN sp_cursor;

    LOOP
        FETCH sp_cursor INTO v_studentID, v_phoneID;
        EXIT WHEN sp_cursor%NOTFOUND;

        DELETE FROM student_phone 
        WHERE studentID = v_studentID;

        DELETE FROM student
        WHERE studentID = v_studentID
        AND NOT EXISTS (
            SELECT 1 FROM student_phone
            WHERE studentID = v_studentID
        );

        DELETE FROM phonenumber
        WHERE phoneID = v_phoneID
        AND NOT EXISTS (
            SELECT 1 FROM student_phone
            WHERE phoneID = v_phoneID
        );
    END LOOP;

    CLOSE sp_cursor;
END;

--drop table student1;



