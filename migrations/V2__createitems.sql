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