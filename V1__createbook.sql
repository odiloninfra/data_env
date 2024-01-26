CREATE TABLE book
(
    id                INTEGER NOT NULL,
    title             VARCHAR(255),
    author_first_name VARCHAR(255),
    author_last_name  VARCHAR(255),
    author_email      VARCHAR(255),
    CONSTRAINT pk_book PRIMARY KEY (id)
);