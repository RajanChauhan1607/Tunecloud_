-- TuneCloud - Music Streaming SQL Project
-- Author: Rajan Chauhan & Team
-- Description: SQL-based DBMS project for a music streaming platform

-- USERS TABLE
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    signup_date DATE DEFAULT CURRENT_DATE
);

-- ARTISTS TABLE
CREATE TABLE Artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    genre VARCHAR(50)
);

-- ALBUMS TABLE
CREATE TABLE Albums (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    release_year YEAR,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- SONGS TABLE
CREATE TABLE Songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    duration TIME,
    album_id INT,
    artist_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- PLAYLISTS TABLE
CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    user_id INT,
    creation_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- PLAYLIST_SONGS TABLE (Many-to-Many)
CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

-- LISTENING HISTORY TABLE
CREATE TABLE Listening_History (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    song_id INT,
    listen_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

-- SUBSCRIPTIONS TABLE
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    plan_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- SAMPLE QUERIES FOR ANALYSIS

-- Top 3 Songs by Play Count
SELECT s.title, COUNT(*) AS play_count
FROM Listening_History lh
JOIN Songs s ON lh.song_id = s.song_id
GROUP BY s.song_id
ORDER BY play_count DESC
LIMIT 3;

-- User Playlist Count
SELECT u.username, COUNT(p.playlist_id) AS total_playlists
FROM Users u
LEFT JOIN Playlists p ON u.user_id = p.user_id
GROUP BY u.user_id;

-- Songs in a Given Playlist (e.g., playlist_id = 1)
SELECT s.title
FROM Songs s
JOIN Playlist_Songs ps ON s.song_id = ps.song_id
WHERE ps.playlist_id = 1;

-- End of Project Schema
