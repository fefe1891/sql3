-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  light_years_diameter FLOAT
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER REFERENCES stars(id),
  moons TEXT[]
);

INSERT INTO galaxies (name, light_years_diameter)
VALUES
  ('Milky Way', 87400.0),
  ('Andromeda', 152000.0),
  ('Messier 87', 130000.0),
  ('Messier 82', 120000.0),
  ('Sombrero', 50000.0);

INSERT INTO stars (name, galaxy_id)
VALUES
  ('Sun', (SELECT id FROM galaxies WHERE name = 'Milky Way')),
  ('Proxima Centauri b', (SELECT id FROM galaxies WHERE name = 'Milky Way')),
  ('Gliese 876 b', (SELECT id FROM galaxies WHERE name = 'Milky Way')),
  ('Andromeda Star 1', (SELECT id FROM galaxies WHERE name = 'Andromeda')),
  ('Messier 87 Star 1', (SELECT id FROM galaxies WHERE name = 'Messier 87')),
  ('Messier 82 Star 1', (SELECT id FROM galaxies WHERE name = 'Messier 82')),
  ('Sombrero Star 1', (SELECT id FROM galaxies WHERE name = 'Sombrero'));

INSERT INTO planets
  (name, type, orbital_period_in_years, star_id, moons)
VALUES
  ('Earth', 'Terrestrial', 1.00, (SELECT id FROM stars WHERE name = 'Sun'), '{"The Moon"}'),
  ('Mars', 'Terrestrial', 1.88, (SELECT id FROM stars WHERE name = 'Sun'), '{"Phobos", "Deimos"}'),
  ('Venus', 'Terrestrial', 0.62, (SELECT id FROM stars WHERE name = 'Sun'), '{}'),
  ('Neptune', 'Gas giant', 164.8, (SELECT id FROM stars WHERE name = 'Sun'), '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 'Exoplanet', 0.03, (SELECT id FROM stars WHERE name = 'Proxima Centauri b'), '{}'),
  ('Gliese 876 b', 'Exoplanet', 0.23, (SELECT id FROM stars WHERE name = 'Gliese 876 b'), '{}');