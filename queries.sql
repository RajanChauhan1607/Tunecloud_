-- TuneCloud: Useful SQL Queries

-- 1. Top 3 Most Played Songs
SELECT s.title, COUNT(*) AS play_count
FROM Listening_History lh
JOIN Songs s ON lh.song_id = s.song_id
GROUP BY s.song_id
ORDER BY play_count DESC
LIMIT 3;

-- 2. User-wise Playlist Count
SELECT u.username, COUNT(p.playlist_id) AS total_playlists
FROM Users u
LEFT JOIN Playlists p ON u.user_id = p.user_id
GROUP BY u.user_id;

-- 3. Songs in a Given Playlist (e.g., playlist_id = 1)
SELECT s.title
FROM Songs s
JOIN Playlist_Songs ps ON s.song_id = ps.song_id
WHERE ps.playlist_id = 1;

-- 4. Most Active Listener
SELECT u.username, COUNT(*) AS songs_played
FROM Listening_History lh
JOIN Users u ON lh.user_id = u.user_id
GROUP BY lh.user_id
ORDER BY songs_played DESC
LIMIT 1;

-- 5. Subscription Expiry List
SELECT u.username, s.plan_name, s.end_date
FROM Subscriptions s
JOIN Users u ON s.user_id = u.user_id
WHERE s.end_date IS NOT NULL
ORDER BY s.end_date ASC;

-- 6. Songs by Artist Name (e.g., Arijit Singh)
SELECT s.title
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
WHERE a.name = 'Arijit Singh';

-- 7. Total Songs in Each Album
SELECT al.title AS album_title, COUNT(s.song_id) AS song_count
FROM Albums al
LEFT JOIN Songs s ON al.album_id = s.album_id
GROUP BY al.album_id;

-- 8. Playlist with Most Songs
SELECT p.name, COUNT(ps.song_id) AS total_songs
FROM Playlists p
JOIN Playlist_Songs ps ON p.playlist_id = ps.playlist_id
GROUP BY p.playlist_id
ORDER BY total_songs DESC
LIMIT 1;
