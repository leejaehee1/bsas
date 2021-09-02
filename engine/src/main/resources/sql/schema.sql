CREATE DATABASE test DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products
(
    prod_id     int        PRIMARY KEY auto_increment,
    prod_name   VARCHAR(255)    NOT NULL,
    prod_price  INT             NOT NULL
);