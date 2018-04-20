CREATE DATABASE altrun;

CREATE TABLE groups (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  city VARCHAR(200),
  meeting_point VARCHAR(200),
  day_time VARCHAR(100),
  contact VARCHAR(400),
  info VARCHAR(800),
  photo VARCHAR(400)
);

INSERT INTO groups (name, meeting_point, day_time, contact, info) VALUES ('Tuesday Tan Runners', 'The Tan', 'Tuesday, 6-7pm', 'Nick', 'Anyone who wants to run the tan');
INSERT INTO groups (name, meeting_point, day_time, contact, info) VALUES ('Pavement Pounders', 'Fed Square', 'Wednesday 6.30-7am', 'Andrea', 'We run this city');



CREATE TABLE messages (
  id SERIAL4 PRIMARY KEY,
  content VARCHAR (1000) NOT NULL,
  group_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);


CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  user_name VARCHAR(200) NOT NULL,
  user_email VARCHAR(100) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);

UPDATE groups SET city = 'Melbourne', WHERE id = 1, 2;

INSERT INTO groups (name, city, meeting_point, day_time, contact, info) VALUES ('Runs With Dogs', 'Melbourne', 'Elsternwick Park', 'Sunday, 9-10am', 'Chloe', 'Doggy and leashes mandatory.');
INSERT INTO groups (name, city, meeting_point, day_time, contact, info) VALUES ('Drag Queen Racers', 'Sydney', 'Cremorne Point', 'Saturday, 10-11am', 'Andy & Fil', 'Heels optional. Join us for Brunch afterwards.');
INSERT INTO groups (name, city, meeting_point, day_time, contact, info) VALUES ('Track Titans', 'Brisbane', 'Queensland Sports & Aquatic Centre', 'Tuesday, 6-7pm', 'Steve & Georgina', 'Interval workout.');
INSERT INTO groups (name, city, meeting_point, day_time, contact, info) VALUES ('Run to Eat', 'Melbourne', 'Docklands', 'Wednesday 6.30-8pm', 'Amanda & Victor', '45 Minute run followed by gorging on burgers, pizza and burritos');
