CREATE VIEW albums AS
    SELECT a.ID AS id, a.title, aa.name AS artist FROM album a JOIN artist aa on aa.ID = a.artist_ID;

CREATE VIEW playlists AS
    SELECT pl.ID AS id, pl.name AS name, t.name AS track FROM playlist pl
        JOIN playlist_track pt on pl.ID = pt.playlist_ID
        JOIN track t on t.ID = pt.track_ID;
