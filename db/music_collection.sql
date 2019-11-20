DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE album(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES artist(id)


)
