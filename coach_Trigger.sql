--drop original table coach then create table
drop table coach;

CREATE TABLE Experiences (
    ExperienceID INT NOT NULL,
    Experience VARCHAR(50) NOT NULL,
    CONSTRAINT ExperiencesPK PRIMARY KEY (ExperienceID)
);

create table Coach (
	CoachID int not null,
	StaffID int not null,
	Certification varchar(40),
	Specialty varchar(40),
	constraint CoachPK primary key(CoachID),
	constraint CoachFK foreign key(StaffID) references Staff(StaffID)
);

CREATE TABLE COACH_EXPERIENCE (
    CoachID INT,
    ExperienceID INT,
    StartTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (CoachID) REFERENCES COACH(CoachID),
    FOREIGN KEY (ExperienceID) REFERENCES EXPERIENCES(ExperienceID)
);

--create view
CREATE VIEW COACH_VIEW AS
SELECT C.CoachID, C.StaffID, C.Certification, C.Specialty,
       E.ExperienceID, E.Experience,
       CE.StartTime, CE.EndTime
FROM COACH C
LEFT JOIN COACH_EXPERIENCE CE
ON C.CoachID = CE.CoachID
LEFT JOIN EXPERIENCES E
ON CE.ExperienceID = E.ExperienceID
WHERE CE.EndTime IS NULL;

create sequence ExperienceID_SEQ
 START WITH 11
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;


create sequence coach_experience_SEQ
start with 11
increment by 1
nocache
nocycle;


--create trigger insert
create or replace TRIGGER COACH_VIEW_INSERT
INSTEAD OF INSERT ON COACH_VIEW
FOR EACH ROW
DECLARE
    v_experience_id NUMBER;
BEGIN
    
    INSERT INTO COACH (CoachID, StaffID, Certification, Specialty)
    VALUES (:NEW.CoachID, :NEW.StaffID, :NEW.Certification, :NEW.Specialty);

    BEGIN
        SELECT ExperienceID
        INTO v_experience_id
        FROM EXPERIENCES
        WHERE Experience = :NEW.Experience;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            v_experience_id := EXPERIENCEID_SEQ.NEXTVAL;

            INSERT INTO EXPERIENCES (ExperienceID, Experience)
            VALUES (v_experience_id, :NEW.Experience);
    END;

    INSERT INTO COACH_EXPERIENCE (CoachID, ExperienceID, StartTime)
    VALUES (:NEW.CoachID, v_experience_id, CURRENT_TIMESTAMP);

END;

--create trigger update
CREATE OR REPLACE TRIGGER COACH_VIEW_UPDATE
INSTEAD OF UPDATE ON COACH_VIEW
FOR EACH ROW
DECLARE
    v_experience_id NUMBER;
BEGIN
    
    IF :NEW.Experience <> :OLD.Experience THEN
        
        BEGIN
            SELECT ExperienceID
            INTO v_experience_id
            FROM EXPERIENCES
            WHERE Experience = :NEW.Experience;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
               
                INSERT INTO EXPERIENCES (ExperienceID, Experience)
                VALUES (ExperienceID_SEQ.NEXTVAL, :NEW.Experience);

                SELECT ExperienceID_SEQ.CURRVAL INTO v_experience_id FROM DUAL;
            WHEN OTHERS THEN

                v_experience_id := NULL;
        END;

        UPDATE COACH_EXPERIENCE
        SET EndTime = CURRENT_TIMESTAMP
        WHERE CoachID = :OLD.CoachID
          AND ExperienceID = :OLD.ExperienceID
          AND EndTime IS NULL;

        INSERT INTO COACH_EXPERIENCE ( CoachID, ExperienceID, StartTime)
        VALUES (:OLD.CoachID, v_experience_id, CURRENT_TIMESTAMP);

    ELSE
        UPDATE COACH
        SET StaffID = :NEW.StaffID,
            Certification = :NEW.Certification,
            Specialty = :NEW.Specialty
        WHERE CoachID = :OLD.CoachID;
    END IF;
END;

--create trigger delete
create or replace TRIGGER coach_view_delete
INSTEAD OF DELETE ON COACH_VIEW
FOR EACH ROW
DECLARE
    
    CURSOR ce_cursor IS
        SELECT CoachID, ExperienceID
        FROM COACH_EXPERIENCE
        WHERE CoachID = :OLD.CoachID;

    v_coach_id COACH.CoachID%TYPE;
    v_experience_id EXPERIENCES.ExperienceID%TYPE;

BEGIN
   
    FOR ce_record IN ce_cursor LOOP
       
        DELETE FROM COACH_EXPERIENCE
        WHERE CoachID = ce_record.CoachID
          AND ExperienceID = ce_record.ExperienceID;
    END LOOP;

    DELETE FROM EXPERIENCES
    WHERE ExperienceID = :OLD.ExperienceID
      AND NOT EXISTS (
          SELECT 1 FROM COACH_EXPERIENCE
          WHERE ExperienceID = :OLD.ExperienceID
      );

    DELETE FROM COACH
    WHERE CoachID = :OLD.CoachID
      AND NOT EXISTS (
          SELECT 1 FROM COACH_EXPERIENCE
          WHERE CoachID = :OLD.CoachID
      );

END;


--insert data into coach_view
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES (1, 1, 'Certified Tennis Coach', 'Tennis', '5 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(2, 4, 'Certified Swimming Coach', 'Swimming', '7 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(3, 7, 'Certified Basketball Coach', 'Basketball', '6 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(4, 10, 'Certified Soccer Coach', 'Soccer', '8 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(5, 13, 'Certified Volleyball Coach', 'Volleyball', '4 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(6, 16, 'Certified Gymnastics Coach', 'Gymnastics', '9 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(7, 19, 'Certified Martial Arts Coach', 'Martial Arts', '10 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(8, 22, 'Certified Yoga Coach', 'Yoga', '3 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(9, 25, 'Certified Golf Coach', 'Golf', '5 years of coaching experience');
INSERT INTO COACH_VIEW (CoachID, StaffID, Certification, Specialty, Experience)
VALUES(10, 28, 'Certified Cycling Coach', 'Cycling', '7 years of coaching experience');



