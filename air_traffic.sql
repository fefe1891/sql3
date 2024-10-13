-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airports (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city_id INTEGER REFERENCES cities(id)
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_airport_id INTEGER REFERENCES airports(id),
  to_airport_id INTEGER REFERENCES airports(id)
);

INSERT INTO airlines (name) VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO cities (name, country) VALUES 
('Washington DC', 'United States'),
('Seattle', 'United States'),
('Tokyo', 'Japan'),
('London', 'United Kingdom'),
('Los Angeles', 'United States'),
('Las Vegas', 'United States'),
('Mexico City', 'Mexico'),
('Paris', 'France'),
('Casablanca', 'Morocco'),
('Dubai', 'UAE'),
('Beijing', 'China'),
('New York', 'United States'),
('Charlotte', 'United States'),
('Cedar Rapids', 'United States'),
('Chicago', 'United States'),
('New Orleans', 'United States'),
('Sao Paolo', 'Brazil'),
('Santiago', 'Chile');

INSERT INTO airports (name, city_id) VALUES 
('Washington DC Airport', 1),
('Seattle Airport', 2),
('Tokyo Airport',3),
('London Airport', 4),
('Los Angeles Airport', 5),
('Las Vegas Airport', 6),
('Mexico City Airport', 7),
('Paris Airport', 8),
('Casablanca Airport', 9),
('Dubai Airport', 10),
('Beijing Airport', 11),
('New York Airport', 12),
('Charlotte Airport', 13),
('Cedar Rapids Airport', 14),
('Chicago Airport', 15),
('New Orleans Airport', 16),
('Sao Paolo Airport', 17),
('Santiago Airport', 18);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_airport_id, to_airport_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);