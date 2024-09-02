# Oracle-DB-Triggers-Views  
**Database Design and Triggers Implementation Project**  

This project demonstrates the creation and management of relational database tables, views, sequences, and triggers in Oracle SQL. It includes procedures for copying data from existing tables into newly structured tables, and the implementation of triggers to handle CRUD operations on a view.  

**Project Overview**
This project is divided into the following sections:

Table Creation:  

Tables for storing lessons and students' data, including their associated attributes and relationships.  
Indexes and foreign keys are defined to maintain data integrity.  

Data Insertion:  
SQL sequences are created to auto-increment primary keys for new data.
A procedure is provided to copy data from existing tables into the new tables.

View Creation:  

Views are designed to combine data from multiple tables and present a simplified interface for interacting with the underlying tables.
Trigger Implementation:

Triggers are created to handle INSERT, UPDATE, and DELETE operations on the views, ensuring the underlying tables are updated accordingly.


Key SQL Components

Table Creation  
LESSON: Stores information about lessons including their ID, course ID, venue, duration, and start time.
LESSON_DAYOFWEEK: Maps lessons to days of the week, including start and end times.
DAYOFWEEK: Stores the day of the week for lessons.
STUDENT: Stores student details including name, gender, age, and contact information.
PHONENUMBER: Stores phone numbers associated with students.
STUDENT_PHONE: Maps students to their phone numbers and includes start and end times for the association.
Sequence Creation
DAYOFWEEK_SEQ: Sequence for generating unique IDs for DAYOFWEEK.
LESSON_SEQ: Sequence for generating unique IDs for LESSON.
STUDENT_SEQ: Sequence for generating unique IDs for STUDENT.
STUDENT_PHONE_SEQ: Sequence for generating unique IDs for STUDENT_PHONE.

Views
LESSON_DAYOFWEEK_VIEW: Combines lesson and day of the week data, showing only active lessons (those with no end time).
StudentPhoneView: Combines student, phone number, and related data, showing only active phone numbers for students.
**Triggers**  
LESSON_DAYOFWEEK_VIEW_INSERT_TRIGGER: Handles insert operations on LESSON_DAYOFWEEK_VIEW.
LESSON_DAYOFWEEK_VIEW_UPDATE_TRIGGER: Handles update operations on LESSON_DAYOFWEEK_VIEW.
LESSON_DAYOFWEEK_VIEW_DELETE_TRIGGER: Handles delete operations on LESSON_DAYOFWEEK_VIEW.
STUDENTPHONEVIEW_INSERT: Handles insert operations on StudentPhoneView.
STUDENTPHONEVIEW_UPDATE: Handles update operations on StudentPhoneView, including phone number changes.
STUDENTPHONEVIEW_DELETE: Handles delete operations on StudentPhoneView.

**How to Use**  
Clone the repository:  
git clone https://github.com/ScarletWQ/Oracle-DB-Triggers-Views

Setup:  
Ensure you have an Oracle SQL environment set up.
Run the SQL scripts provided to create tables, sequences, and triggers.

Populate Data:
Use the provided procedure to copy existing data from your lesson1 and student1 tables into the new structure.

Interact with Views:  
Perform INSERT, UPDATE, and DELETE operations on the views, and the triggers will automatically update the underlying tables.

Project Structure  
SQL Scripts: All SQL scripts are included in the root directory.  

README.md: This file provides an overview of the project.  

License  
This project is licensed under the MIT License. See the LICENSE file for details.

Contact  
For any questions or suggestions, please contact scarlet.zh@gmail.com.
