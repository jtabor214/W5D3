PRAGMA foreign_keys = ON; 

    DROP TABLE IF EXISTS users;
    CREATE TABLE users (
        id INTEGER PRIMARY KEY, 
        fname TEXT NOT NULL,
        lname TEXT NOT NULL,
    );

    DROP TABLE IF EXISTS questions;
    CREATE TABLE questions (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        body TEXT NOT NULL, 
        author_id INTEGER NOT NULL,

        FOREIGN KEY (user_id) REFERENCES users(id)
    );

    DROP TABLE IF EXISTS question_follows;
    CREATE TABLE question_follows (
        id INTEGER PRIMARY KEY, 
        user_id INTEGER PRIMARY KEY,
        question_id INTEGER PRIMARY KEY,

        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (question_id) REFERENCES question(id)
    );

    DROP TABLE IF EXISTS replies 
    CREATE TABLE replies (
        id INTEGER PRIMARY KEY, 
        parent_reply_id INTEGER, 
        user_id INTEGER,
        body TEXT NOT NULL,
        subject_question_id INTEGER NOT NULL,

        FOREIGN KEY (subject_question_id) REFERENCES questions(id),
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
    );

    DROP TABLE IF EXISTS question_likes;
    CREATE TABLE question_likes (
        id INTEGER PRIMARY KEY,
        user_id INTEGER PRIMARY KEY,
        question_id INTEGER PRIMARY KEY,

        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (question_id) REFERENCES questions(id)
    );

    INSERT INTO 
    users (fname, lname)
    VALUES
        ('Ash', 'Ketchum'),
        ('Thomas', 'Shelby'),
        ('Diddy', 'Kong'),
        ('Ishan', 'Chawla');
    
    INSERT INTO 
    question (title, body, author_id)
    VALUES 
        ('Q1', 'Who''s that Pokemon?', 1)
        ('Q2', 'Why am I with these people?', 2)
        ('Q3', 'Banana?', 3)
        ('Q4', 'Gggrreeeukiiee?', 3)
        ('Q5', 'Were you tooo fast?', 4);

    INSERT INTO 
    question_follows (user_id, question_id)
    VALUES 
        (2, 1)
        (1, 4)
        (3, 3)
        (4, 1)

    INSERT INTO
    replies (body, subject_question_id, user_id, parent_reply_id)
    VALUES
        ('It''s Bidoof!', 1, 4, NULL),
        ('KAKAAKAA', 2, 3, NULL),
        ('Banana?', 3, 2, NULL),
        ('A new pokemon!', 4, 1, NULL),
        ('Not fast enough', 5, 2, NULL);
    
    INSERT INTO 
    question_likes (user_id, question_id)
    VALUES
        (5, 1),
        (3, 3),
        (1, 4);
        


    
