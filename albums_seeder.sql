SELECT 'Using codeup_test_db' AS 'Use Statement';

USE codeup_test_db;

SELECT 'Truncating albums table' AS 'Truncate Statement';

TRUNCATE albums;

SELECT 'Inserting records into albums table' AS 'Insert Statement';

INSERT INTO albums (artist, name, release_date, genre, sales)
VALUES
('Michael Jackson', 'Thriller', 1982, 'Pop, Rock, R&R', 47.3),
('Eagles', 'Their Greatest Hits (1971–1975)', 1976, 'Country rock, soft rock, folk rock', 41.2),
