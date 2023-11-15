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