-- Genre table
CREATE TABLE genre(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255)
);

-- Music Album table
CREATE TABLE music_albums (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	release_date DATE,
	album_title VARCHAR(255),
	album_artist VARCHAR(255),
	on_spotify BOOL
  genre_id INT
  ADD CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id)
);
CREATE TABLE game(
	id INT PRIMARY KEY SERIAL,
	last_played_at DATE,
	multiplayer BOOLEAN,
	author_id INT,
	FOREIGN KEY (author_id) REFERENCES author(id)
);