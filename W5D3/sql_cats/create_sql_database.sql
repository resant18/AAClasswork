DROP TABLE IF EXISTS cattoys; 
DROP TABLE IF EXISTS cats; 
DROP TABLE IF EXISTS toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255) 
); 

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    price FLOAT
); 

CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);


INSERT INTO cats(name, color,breed)
VALUES ('Fred','Yellow','Tabby'),
    ('Garfield','Orange','Tabby'),
    ('Tom','Black and White','Persian'),
    ('Fuzzy','Brown','Himalayan'),
    ('Kitty','Pink','Persian');

INSERT INTO toys(name,color,price)
VALUES ('Ball of Yarn','Red', 3.99),
    ('Feather','Orange', 2.99),
    ('String','Blue', 1.00),
    ('Mouse','Black', 0.00),
    ('Catnip','Green', 0.99);

INSERT INTO cattoys(cat_id, toy_id)
VALUES (2, 2),
    (3, 1),
    (3, 5),
    (4, 4),
    (5, 5);   

EXPLAIN SELECT cats.name, toys.name FROM cats LEFT JOIN cattoys ON cats.id = cattoys.cat_id
JOIN toys ON toys.id = cattoys.toy_id;