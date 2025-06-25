-- SAMPLE DATA FOR TuneCloud

-- Insert Users
INSERT INTO Users (username, email, password_hash) VALUES
('khushi_p', 'khushi@example.com', 'hashed_pass_1'),
('bhagya_m', 'bhagya@example.com', 'hashed_pass_2'),
('rajan_c', 'rajan@example.com', 'hashed_pass_3'),
('kirtan_c', 'kirtan@example.com', 'hashed_pass_4');

-- Insert Artists
INSERT INTO Artists (name, genre) VALUES
('Arijit Singh', 'Pop'),
('Shreya Ghoshal', 'Classical'),
('A. R. Rahman', 'Fusion');

-- Insert Albums
INSERT INTO Albums (title, release_year, artist_id) VALUES
('Soulful Tunes', 2021, 1),
('Melody Nights', 2022, 2),
('Rhythm World', 2020, 3);

-- Insert Songs
INSERT INTO Songs (title, duration, album_id, artist_id) VALUES
('Tum Hi Ho', '00:04:22', 1, 1),
('Teri Ore', '00:03:47', 2, 2),
('Jai Ho', '00:05:10', 3, 3),
('Raabta', '00:04:18', 1, 1);

-- Insert Playlists
INSERT INTO Playlists (name, user_id) VALUES
('Morning Chill', 1),
('Workout Hits', 2);

-- Insert Playlist_Songs
INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- Insert Listening_History
INSERT INTO Listening_History (user_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1);

-- Insert Subscriptions
INSERT INTO Subscriptions (user_id, plan_name, start_date, end_date) VALUES
(1, 'Premium', '2024-01-01', '2025-01-01'),
(2, 'Free', '2024-06-01', NULL),
(3, 'Premium', '2024-03-15', '2025-03-15');
