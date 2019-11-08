DROP TABLE visits;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE visits
(
  id SERIAL8 PRIMARY KEY,
  country_id REFERENCES countries(id) ON DELETE CASCADE,
  city_id REFERENCES cities(id) ON DELETE CASCADE,
  visited VARCHAR(255)
);

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
