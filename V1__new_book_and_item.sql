CREATE TABLE book
(
    id                INTEGER NOT NULL,
    title             VARCHAR(255),
    author_first_name VARCHAR(255),
    author_last_name  VARCHAR(255),
    author_email      VARCHAR(255),
    CONSTRAINT pk_book PRIMARY KEY (id)
);

CREATE TABLE item
(
    item_id     INTEGER NOT NULL,
    item_name   VARCHAR(255),
    category    VARCHAR(255),
    description VARCHAR(255),
    price       FLOAT,
    quantity    VARCHAR(255),
    CONSTRAINT pk_item PRIMARY KEY (item_id)
);