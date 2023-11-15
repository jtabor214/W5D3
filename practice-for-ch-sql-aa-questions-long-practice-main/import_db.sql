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