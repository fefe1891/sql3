-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE song_artists (
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id),
  PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE song_producers (
  song_id INTEGER REFERENCES songs(id),
  producer_id INTEGER REFERENCES producers(id),
  PRIMARY KEY (song_id, producer_id)
);

INSERT INTO artists (name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz to Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child')
ON CONFLICT (name) DO NOTHING;

INSERT INTO albums (name, release_date)
VALUES
('Middle of Nowhere', '04-15-1997'),
('A Night at the Opera', '10-31-1975'),
('Daydream', '11-14-1995'),
('A Star Is Born', '09-27-2018'),
('Silver Side Up', '08-21-2001'),
('The Blueprint 3', '10-20-2009'),
('Prism', '12-17-2013'),
('Hands All Over', '06-21-2011'),
('Let Go', '05-14-2002'),
('The Writing''s on the Wall', '11-07-1999');

INSERT INTO producers (name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '1997-04-15', (SELECT id FROM albums WHERE name = 'Middle of Nowhere')),
  ('Bohemian Rhapsody', 355, '1975-10-31', (SELECT id FROM albums WHERE name = 'A Night at the Opera')),
  ('One Sweet Day', 282, '1995-11-14', (SELECT id FROM albums WHERE name = 'Daydream')),
  ('Shallow', 216, '2018-09-27', (SELECT id FROM albums WHERE name = 'A Star Is Born')),
  ('How You Remind Me', 223, '2001-08-21', (SELECT id FROM albums WHERE name = 'Silver Side Up')),
  ('New York State of Mind', 276, '2009-10-20', (SELECT id FROM albums WHERE name = 'The Blueprint 3')),
  ('Dark Horse', 215, '2013-12-17', (SELECT id FROM albums WHERE name = 'Prism')),
  ('Moves Like Jagger', 201, '2011-06-21', (SELECT id FROM albums WHERE name = 'Hands All Over')),
  ('Complicated', 244, '2002-05-14', (SELECT id FROM albums WHERE name = 'Let Go')),
  ('Say My Name', 240, '1999-11-07', (SELECT id FROM albums WHERE name = 'The Writing''s on the Wall'));

  INSERT INTO song_artists (song_id, artist_id)
VALUES
((SELECT id FROM songs WHERE title = 'MMMBop'), (SELECT id FROM artists WHERE name = 'Hanson')),
((SELECT id FROM songs WHERE title = 'Bohemian Rhapsody'), (SELECT id FROM artists WHERE name = 'Queen')),
((SELECT id FROM songs WHERE title = 'One Sweet Day'), (SELECT id FROM artists WHERE name = 'Mariah Cary')),
((SELECT id FROM songs WHERE title = 'One Sweet Day'), (SELECT id FROM artists WHERE name = 'Boyz to Men')),
((SELECT id FROM songs WHERE title = 'Shallow'), (SELECT id FROM artists WHERE name = 'Lady Gaga')),
((SELECT id FROM songs WHERE title = 'Shallow'), (SELECT id FROM artists WHERE name = 'Bradley Cooper')),
((SELECT id FROM songs WHERE title = 'How You Remind Me'), (SELECT id FROM artists WHERE name = 'Nickelback')),
((SELECT id FROM songs WHERE title = 'New York State of Mind'), (SELECT id FROM artists WHERE name = 'Jay Z')),
((SELECT id FROM songs WHERE title = 'New York State of Mind'), (SELECT id FROM artists WHERE name = 'Alicia Keys')),
((SELECT id FROM songs WHERE title = 'Dark Horse'), (SELECT id FROM artists WHERE name = 'Katy Perry')),
((SELECT id FROM songs WHERE title = 'Dark Horse'), (SELECT id FROM artists WHERE name = 'Juicy J')),
((SELECT id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT id FROM artists WHERE name = 'Maroon 5')),
((SELECT id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT id FROM artists WHERE name = 'Christina Aguilera')),
((SELECT id FROM songs WHERE title = 'Complicated'), (SELECT id FROM artists WHERE name = 'Avril Lavigne')),
((SELECT id FROM songs WHERE title = 'Say My Name'), (SELECT id FROM artists WHERE name = 'Destiny''s Child'));

INSERT INTO song_producers (song_id, producer_id)
VALUES
((SELECT id FROM songs WHERE title = 'MMMBop'), (SELECT id FROM producers WHERE name = 'Dust Brothers')),
((SELECT id FROM songs WHERE title = 'MMMBop'), (SELECT id FROM producers WHERE name = 'Stephen Lironi')),
((SELECT id FROM songs WHERE title = 'Bohemian Rhapsody'), (SELECT id FROM producers WHERE name = 'Roy Thomas Baker')),
((SELECT id FROM songs WHERE title = 'One Sweet Day'), (SELECT id FROM producers WHERE name = 'Walter Afanasieff')),
((SELECT id FROM songs WHERE title = 'Shallow'), (SELECT id FROM producers WHERE name = 'Benjamin Rice')),
((SELECT id FROM songs WHERE title = 'How You Remind Me'), (SELECT id FROM producers WHERE name = 'Rick Parashar')),
((SELECT id FROM songs WHERE title = 'New York State of Mind'), (SELECT id FROM producers WHERE name = 'Al Shux')),
((SELECT id FROM songs WHERE title = 'Dark Horse'), (SELECT id FROM producers WHERE name = 'Max Martin')),
((SELECT id FROM songs WHERE title = 'Dark Horse'), (SELECT id FROM producers WHERE name = 'Cirkut')),
((SELECT id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT id FROM producers WHERE name = 'Shellback')),
((SELECT id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT id FROM producers WHERE name = 'Benny Blanco')),
((SELECT id FROM songs WHERE title = 'Complicated'), (SELECT id FROM producers WHERE name = 'The Matrix')),
((SELECT id FROM songs WHERE title = 'Say My Name'), (SELECT id FROM producers WHERE name = 'Darkchild'));
