# 🎵 TuneCloud SQL Project

A full-fledged SQL-based **DBMS project** simulating a music streaming platform. This project is built as part of academic coursework by:

- Khushi Pandya – 202301406
- Bhagya Majithiya – 202301269
- Rajankumar Chauhan – 202301427
- Kirtan Chauhan – 202301409

---

## 📘 Overview

TuneCloud mimics the database backend of a real-world streaming service like Spotify or Apple Music. It captures all major components including users, artists, songs, playlists, subscriptions, and listening history.

---

## 🗃️ Database Features

- **User Management**

  - Store and manage users with email authentication

- **Music Catalog**

  - Songs, Albums, Artists – with relational integrity

- **Playlists**

  - Many-to-many playlist-song relationship

- **Listening History**

  - Tracks every user's listening sessions

- **Subscription Plans**

  - Start/end dates, linked to users

---

## 🧱 Tech Stack

- MySQL / MariaDB or any SQL-compatible RDBMS
- SQL (DDL & DML)

---

## 📄 Files Included

- `tunecloud_schema.sql` — Full schema creation script
- `README.md` — This file (project documentation)
- *(Optional)* `sample_data.sql` — Add your own test data if needed

---

## 🧪 Sample SQL Queries

```sql
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
```

---

## 🎯 ERD, Normalization, and More

You can enhance this project by:

- Drawing ER diagrams using [dbdiagram.io](https://dbdiagram.io/)
- Adding proof of normalization up to 3NF
- Including `sample_data.sql` for realistic test cases

---

## 📌 How to Use

1. Clone the repository
2. Import the SQL schema into MySQL or compatible database
3. Optionally insert sample data and run test queries

```bash
mysql -u your_user -p < tunecloud_schema.sql
```

---

## 📫 Contact

Want to collaborate or give feedback? Reach out to any of the contributors or connect on [LinkedIn](https://linkedin.com).

---

> Designed with ❤️ for academic learning and real-world DBMS demonstration.

