# Tunecloud_
TuneCloud is a comprehensive SQL-based project built to simulate the backend of a music streaming platform (like Spotify or Apple Music). It was created as part of an academic DBMS project, featuring real-world database design with normalized schema, sample data, and query use cases.
 TuneCloud SQL Project
A full-fledged SQL-based DBMS project simulating a music streaming platform. 
 Overview
TuneCloud mimics the database backend of a real-world streaming service like Spotify or Apple Music. It captures all major components including users, artists, songs, playlists, subscriptions, and listening history.

 Database Features
User Management

Store and manage users with email authentication
Music Catalog

Songs, Albums, Artists – with relational integrity
Playlists

Many-to-many playlist-song relationship
Listening History

Tracks every user's listening sessions
Subscription Plans

Start/end dates, linked to users
 Tech Stack
MySQL / MariaDB or any SQL-compatible RDBMS
SQL (DDL & DML)
 Files Included
tunecloud_schema.sql — Full schema creation script
README.md — This file (project documentation)
(Optional) sample_data.sql — Add your own test data if needed
 Sample SQL Queries
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
 ERD, Normalization, and More



