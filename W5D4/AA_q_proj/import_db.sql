
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes ;
DROP TABLE IF EXISTS replies ;
DROP TABLE IF EXISTS question_follows ;
DROP TABLE IF EXISTS questions ;
DROP TABLE IF EXISTS users ;


CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  fname VARCHAR(100) NOT NULL,
  lname  VARCHAR(100) 
); 

CREATE TABLE questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  title VARCHAR(255),
  body TEXT,
  users_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY AUTOINCREMENT, /* this id is to hold together a combination of subj_id & parent_id */
  reference_subj_id INTEGER NOT NULL,
  reference_parent_id INTEGER, 
  reference_user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (reference_subj_id) REFERENCES questions(id),
  FOREIGN KEY (reference_parent_id) REFERENCES replies(id),
  FOREIGN KEY (reference_user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  questions_id INTEGER, 
  users_id INTEGER, 

  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO users(fname, lname)
VALUES
('Alex', 'Duveneck'),
('Renata', 'Santoso'),
('Justin', 'Shieh'),
('Donald', 'Baba');

INSERT INTO questions(title, body, users_id)
VALUES 
('What is life?', 'Help me I do not know why I exist. I am stuck.', 1),
('What is happiness?', 'Help me I do not know why I exist. I am stuck.', 1),
('How does SQL work?', 'How do we design the scheme for AAQuestions?', 3),
('Is there pizza today?', 'I am hungry. Hangry. I hope there is pizza!! >:(', 2);

INSERT INTO question_follows(users_id, questions_id)
VALUES 
(1, 1),
(2, 3),
(3, 3);

INSERT INTO replies(
  reference_subj_id, reference_parent_id, reference_user_id, body)
VALUES 
(1, NULL,  3, '42'), 
(1, 1, 2, 'What?!? LOL XD'),
(2, NULL, 3, 'Let''s ask the TA for help! But no response QQ'); 

INSERT INTO question_likes(
  users_id, questions_id
)
VALUES 
(1, 1),
(2, 1),
(3, 1),
(2, 3),
(1, 3); 








