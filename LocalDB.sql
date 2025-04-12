CREATE TABLE students (
    student_id    NUMBER PRIMARY KEY,
    name          VARCHAR2(100),
    email         VARCHAR2(100),
    phone         VARCHAR2(15),
    course        VARCHAR2(50),
    join_date     DATE
);

CREATE SEQUENCE student_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
  
  
  select * from students;
  
  CREATE TABLE class_schedule (
    class_id    NUMBER PRIMARY KEY,
    course      VARCHAR2(50),
    class_date  VARCHAR2(20),
    class_time  VARCHAR2(20)
);

CREATE SEQUENCE class_seq START WITH 1 INCREMENT BY 1;
