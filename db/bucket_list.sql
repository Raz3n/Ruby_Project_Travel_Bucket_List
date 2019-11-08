DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE cities
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE countries
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);
