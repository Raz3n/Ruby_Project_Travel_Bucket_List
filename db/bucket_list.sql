DROP TABLE visits;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE visits(
  id SERIAL4 PRIMARY KEY,
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE,
  city_id INT4 REFERENCES cities(id) ON DELETE CASCADE,
  visited VARCHAR(255)
);
