MySQL [(none)]> create database skilvul_playlist;
Query OK, 1 row affected (0.052 sec)

MySQL [(none)]> use skilvul_playlist;
Database changed

MySQL [skilvul_playlist]> create table users(
    -> user_id int not null auto_increment primary key,
    -> name varchar(50) not null default '',
    -> email varchar(50) not null default '',
    -> password varchar(50) not null default ''
    -> );
Query OK, 0 rows affected (0.062 sec)

MySQL [skilvul_playlist]> desc users;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| user_id  | int         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(50) | NO   |     |         |                |
| email    | varchar(50) | NO   |     |         |                |
| password | varchar(50) | NO   |     |         |                |
+----------+-------------+------+-----+---------+----------------+
4 rows in set (0.009 sec)

MySQL [skilvul_playlist]> create table singers(
    -> singer_id int not null auto_increment primary key,
    -> name varchar(50) not null default ''
    -> );
Query OK, 0 rows affected (0.047 sec)

MySQL [skilvul_playlist]> desc singers;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| singer_id | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | NO   |     |         |                |
+-----------+-------------+------+-----+---------+----------------+
2 rows in set (0.013 sec)

MySQL [skilvul_playlist]> create table albums(
    -> album_id int not null auto_increment primary key,
    -> name varchar(50) not null
    -> );
Query OK, 0 rows affected (0.053 sec)

MySQL [skilvul_playlist]> desc albums;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| album_id | int         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(50) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
2 rows in set (0.013 sec)

MySQL [skilvul_playlist]> create table tracks(
    -> track_id int not null auto_increment primary key,
    -> title varchar(255) not null,
    -> singer_id int not null,
    -> album_id int not null,
    -> constraint fk_tracks_singers_singer_id foreign key(singer_id) references singers(singer_id),
    -> constraint fk_tracks_albums_album_id foreign key(album_id) references albums(album_id)
    -> );
Query OK, 0 rows affected (0.084 sec)

MySQL [skilvul_playlist]> desc tracks;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| track_id  | int          | NO   | PRI | NULL    | auto_increment |
| title     | varchar(255) | NO   |     | NULL    |                |
| singer_id | int          | NO   | MUL | NULL    |                |
| album_id  | int          | NO   | MUL | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.014 sec)

MySQL [skilvul_playlist]> create table playlist(
    -> playlist_id int auto_increment primary key,
    -> name varchar(255) not null,
    -> user_id int not null,
    ->
    -> constraint playlist_owner_key_reff foreign key(user_id) references users(user_id)
    -> );
Query OK, 0 rows affected (0.065 sec)

MySQL [skilvul_playlist]> desc playlist;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| playlist_id | int          | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255) | NO   |     | NULL    |                |
| user_id     | int          | NO   | MUL | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.012 sec)

MySQL [skilvul_playlist]> create table track_playlist(
    -> track_id int not null,
    -> playlist_id int not null,
    -> constraint fk_tracks foreign key(track_id) references tracks(track_id),
    -> constraint fk_playlist foreign key(playlist_id) references playlist(playlist_id)
    -> );
Query OK, 0 rows affected (0.105 sec)

MySQL [skilvul_playlist]> desc track_playlist;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| track_id    | int  | NO   | MUL | NULL    |       |
| playlist_id | int  | NO   | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.014 sec)