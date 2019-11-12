DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL
);
