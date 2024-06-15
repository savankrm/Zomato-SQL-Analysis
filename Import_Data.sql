CREATE TABLE IF NOT EXISTS goldusers_signup
(
    userid integer,
    gold_signup_date date
)

INSERT INTO goldusers_signup (userid, gold_signup_date) VALUES (1, '2017-09-22');
INSERT INTO goldusers_signup (userid, gold_signup_date) VALUES (3, '2017-04-21');
INSERT INTO goldusers_signup (userid, gold_signup_date) VALUES (5, '2017-09-22');
INSERT INTO goldusers_signup (userid, gold_signup_date) VALUES (7, '2017-04-21');
INSERT INTO goldusers_signup (userid, gold_signup_date) VALUES (9, '2021-05-15');


CREATE TABLE IF NOT EXISTS users
(
    userid integer,
    signup_date date
)

INSERT INTO users VALUES (1, '2014-09-02');
INSERT INTO users VALUES (2, '2015-01-15');
INSERT INTO users VALUES (3, '2014-04-11');
INSERT INTO users VALUES (4, '2015-06-20');
INSERT INTO users VALUES (5, '2016-08-12');
INSERT INTO users VALUES (6, '2017-10-05');
INSERT INTO users VALUES (7, '2018-01-28');
INSERT INTO users VALUES (8, '2019-03-10');
INSERT INTO users VALUES (9, '2020-05-15');

CREATE TABLE IF NOT EXISTS product
(
    product_id integer,
    product_name text,
    price integer
)

INSERT INTO product VALUES (4, 'p4', 456);
INSERT INTO product VALUES (5, 'p5', 567);
INSERT INTO product VALUES (6, 'p6', 987);
INSERT INTO product VALUES (7, 'p7', 456);
INSERT INTO product VALUES (1, 'p1', 980);
INSERT INTO product VALUES (2, 'p2', 870);
INSERT INTO product VALUES (3, 'p3', 330);

CREATE TABLE IF NOT EXISTS sales
(
    userid integer,
    created_date date,
    product_id integer
)

INSERT INTO sales VALUES (1, '2017-04-19', 2);
INSERT INTO sales VALUES (3, '2019-12-18', 1);
INSERT INTO sales VALUES (2, '2020-07-20', 3);
INSERT INTO sales VALUES (1, '2019-10-23', 2);
INSERT INTO sales VALUES (1, '2018-03-19', 3);
INSERT INTO sales VALUES (3, '2016-12-20', 2);
INSERT INTO sales VALUES (4, '2017-04-19', 2);
INSERT INTO sales VALUES (4, '2019-12-18', 1);
INSERT INTO sales VALUES (5, '2020-07-20', 3);
INSERT INTO sales VALUES (5, '2019-10-23', 2);
INSERT INTO sales VALUES (7, '2018-03-19', 3);
INSERT INTO sales VALUES (4, '2016-12-20', 2);
INSERT INTO sales VALUES (4, '2019-05-15', 1);
INSERT INTO sales VALUES (4, '2019-06-28', 2);
INSERT INTO sales VALUES (5, '2019-08-10', 3);
INSERT INTO sales VALUES (6, '2020-01-15', 1);
INSERT INTO sales VALUES (7, '2020-08-05', 2);
INSERT INTO sales VALUES (8, '2021-04-20', 3);
INSERT INTO sales VALUES (3, '2021-12-01', 1);
INSERT INTO sales VALUES (6, '2022-06-15', 2);
INSERT INTO sales VALUES (1, '2022-11-30', 3);
INSERT INTO sales VALUES (9, '2023-05-10', 1);
INSERT INTO sales VALUES (7, '2023-10-20', 2);
INSERT INTO sales VALUES (9, '2024-03-05', 3);
INSERT INTO sales VALUES (9, '2024-06-15', 1);

