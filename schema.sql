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

CREATE TABLE author(
	id INT PRIMARY KEY SERIAL,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE game(
	id INT PRIMARY KEY SERIAL,
	publish_date DATE,
	last_played_at DATE,
	multiplayer BOOLEAN,
	author_id INT,
	FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE label(
	id INT GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(250),
	color VARCHAR(250),
	PRIMARY KEY (id)
);

CREATE TABLE book(
	id INT GENERATED ALWAYS AS IDENTITY,
	publisher VARCHAR(250),
	publish_date DATE,
	cover_state VARCHAR(250),
	label_id INT REFERENCES label(id),
	PRIMARY KEY (id)
);