DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE IF NOT EXISTS students(
  ID SERIAL PRIMARY KEY,     
  student_name VARCHAR(30) NOT NULL,   
  major VARCHAR(30),
  friend_count INT,
  email VARCHAR(30) NOT NULL UNIQUE,
  password_ VARCHAR(30) NOT NULL,
  location VARCHAR(30),
  admin BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS classes CASCADE;
CREATE TABLE IF NOT EXISTS classes(
    class_id INT PRIMARY KEY,
    class_name VARCHAR(90),
    class_description VARCHAR(2000)
);

DROP TABLE IF EXISTS sections CASCADE;
CREATE TABLE IF NOT EXISTS sections(
    ID INT PRIMARY KEY,
    class_ID INT,
    professor VARCHAR(30)
);

DROP TABLE IF EXISTS enrolled CASCADE;
CREATE TABLE IF NOT EXISTS enrolled(
    ID SERIAL PRIMARY KEY,
    student_ID INT,
    section_ID INT
 );

 CREATE TABLE IF NOT EXISTS friends(
     student_ID INT,
     friends INT[],
     friends_pending INT[]
 );

INSERT INTO friends(student_ID, friends, friends_pending)
VALUES(1, ARRAY [3,4,5],NULL),
(2, ARRAY [3,4],NULL),
(3, ARRAY [1,2,4,5],NULL),
(4, ARRAY [1,2,3,5],NULL),
(5, ARRAY [1,3,4], NULL);

INSERT INTO students(student_name,major,friend_count,email,password_,location,admin) 
VALUES ('Eli','Computer Science',0,'eli@gmail.com','password','clubbin',True),
('Micheal','Computer Science',100,'Micheal@edu.com','1234','tun tavern',False),
('Logan','Computer Science',50,'Logan@tall.com','iAmTall','scotland',False),
('Eddy','Computer Science',420,'Eddy@colorado.com','iAmEddy','the dark web',False),
('Maya','Computer Science',2,'Maya@pink.com','IlikePink','japan',False);

INSERT INTO sections(ID,class_ID,professor)
VALUES (30309,3308,'Corey'),
(39692,3104,'Bo Wagoner'),
(39704,3753,'Carey Herman');

INSERT INTO sections(ID,class_ID,professor)
VALUES (30310,3308,'Vishal');
 
INSERT INTO enrolled(student_ID,section_ID)
VALUES (1,30309),(2,30309),(1,39704),(3,39704),(4,39704);

INSERT INTO classes(class_id,class_name,class_description)
VALUES (3308,'Software Development Method and Tools','Covers tools and techniques for successful software development with a strong focus on best \
    practices used in industry. Students work in small teams to complete a semester-long application \
    development project. Students learn front-end design and construction using HTML & CSS, back-end \
    database design and construction, and full-stack integration. Students gain exposure to agile \
    methodologies, web services, distributed version control, requirements definition, automated \
    integration testing, and cloud-based application deployment. Same as CSPB 3308.');

INSERT INTO classes(class_id,class_name,class_description)
VALUES (3104, 'Algorithms','Covers the fundamentals of algorithms and various algorithmic strategies, including time and \
    space complexity, sorting algorithms, recurrence relations, divide and conquer algorithms, greedy \
    algorithms, dynamic programming, linear programming, graph algorithms, problems in P and NP, and \
    approximation algorithms. Same as CSPB 3104.');

INSERT INTO classes(class_id,class_name,class_description)
VALUES (3753, 'Design and Analysis of Operation Systems','Analyzes the software that extends hardware to provide a computing environment, including the \
    role of linkers, file systems, resource sharing, security and networking. Studies the history of \
    operating system organization and design and their influence on security, functionality and \
    reliability. Same as CSPB 3753.');




  