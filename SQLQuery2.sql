 SELECT 
	Id,  
	Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song;

/*1----Query all of the entries in the Genre table*/
SELECT * FROM Genre;

/*2-----Using the INSERT statement, add one of your favorite artists to the Artist table.*/
INSERT INTO Artist (ArtistName, YearEstablished) Values ('Taylor', '1999');

SELECT * FROM Artist;

/*3----Using the INSERT statement, add one, or more, albums by your artist to the Album table.*/
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Red', 01/01/2001, 30, 'Warner Bros', 30, 11); 

SELECT * FROM Album;

/*4-----Using the INSERT statement, add some songs that are on that album to the Song table.*/

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) Values ('Sumthin', 2, '01/01/2001',11, 30, 30);

SELECT * FROM Song;

/* 5------Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables,
 and the WHERE keyword to filter the results to the album and artist you added.*/

SELECT album.Title, song.Title, artist.artistname FROM (Album  LEFT JOIN Song  ON song.AlbumId = album.Id)
 LEFT JOIN artist ON song.artistId = artist.Id
WHERE album.Title = 'Red';

/* 6-----Write a SELECT statement to display how many songs exist for each album.
 You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/

SELECT a.title as AlbumName, count(s.title) as SongCount
FROM album a LEFT JOIN song s
ON s.albumId = a.Id
group by a.title

/*7---Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/

SELECT ar.artistname as Artist, count(s.title) as NumOfSong
FROM artist ar LEFT JOIN song s
ON s.ArtistId = ar.Id
group by ar.ArtistName

/*8----Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/

SELECT g.label as Genre, count(s.title) as NumOfSong
FROM genre g LEFT JOIN song s
ON s.GenreId = g.Id
group  by g.label

/*9---Using MAX() function, write a select statement to find the album with the longest duration.
 The result should display the album title and the duration.*/
 
Select a.title, AlbumLength as Album
From Album a
Where AlbumLength = ( SELECT MAX(AlbumLength)
FROM Album )

/*10-----Using MAX() function, write a select statement to find the song with the longest duration.
 The result should display the song title and the duration.*/

 SELECT s.title, songlength as Song
 From Song s
 Where SongLength = ( SELECT MAX(SongLength)R
 FROM Song)

 /*11-----Modify the previous query to also display the title of the album.*/
 
 SELECT s.title, a.title, songlength as Song
 From Song s left join Album a
 ON s.AlbumId = a.id
 Where SongLength = ( SELECT MAX(SongLength)
 FROM song)




