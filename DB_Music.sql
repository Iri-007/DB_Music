CREATE TABLE IF NOT EXISTS artists (artist_id SERIAL PRIMARY KEY, artist_name VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS genres (genre_id SERIAL PRIMARY KEY, genre_name VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS tracks (track_id SERIAL PRIMARY KEY, trak_name VARCHAR(90), track_duration TIME, album_id INTEGER NOT NULL REFERENCES albums(album_id));

CREATE TABLE IF NOT EXISTS artists_genres (

     artist_id INTEGER REFERENCES artists(artist_id),

     genre_id INTEGER REFERENCES genres(genre_id),
     
     CONSTRAINT ag_artist_genre PRIMARY KEY (artist_id, genre_id)

);

CREATE TABLE IF NOT EXISTS albums (

    album_id SERIAL PRIMARY KEY,

	album_name VARCHAR(120) NOT NULL,

	album_release_year INTEGER NOT NULL

);

CREATE TABLE IF NOT EXISTS artists_albums (

    artist_id INTEGER REFERENCES artists(artist_id),

    album_id INTEGER REFERENCES albums(album_id),

    CONSTRAINT aa_artist_album PRIMARY KEY (artist_id, album_id)

);

CREATE TABLE IF NOT EXISTS tracks (

    track_id SERIAL PRIMARY KEY,

	track_name VARCHAR(90) NOT NULL,

	track_duration TIME NOT NULL,
	
	album_id INTEGER
);

CREATE TABLE IF NOT EXISTS songcollections (
    
    songcollection_id SERIAL PRIMARY KEY,
	
	songcollection_name VARCHAR(120) NOT NULL,
	
	songcollection_release INTEGER NOT NULL
	
);

CREATE TABLE IF NOT EXISTS tracks_songcollections ( 

    track_id INTEGER REFERENCES tracks(track_id),

    songcollection_id INTEGER REFERENCES songcollections(songcollection_id),
    
    CONSTRAINT st_track_collection PRIMARY KEY (track_id, songcollection_id)

);


