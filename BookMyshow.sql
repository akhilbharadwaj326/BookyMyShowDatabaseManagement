-- Theatre table
CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100)
);

-- Movie table
CREATE TABLE Movie (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Format VARCHAR(20) NOT NULL,
    Certification VARCHAR(10),
    Duration INT NOT NULL
);

-- Screen table
CREATE TABLE Screen (
    ScreenID INT PRIMARY KEY AUTO_INCREMENT,
    TheatreID INT NOT NULL,
    ScreenName VARCHAR(10) NOT NULL,
    Capacity INT NOT NULL,
    SoundSystem VARCHAR(50),
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID)
);

-- Show table (escaped with backticks)
CREATE TABLE `Show` (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT NOT NULL,
    ScreenID INT NOT NULL,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Status VARCHAR(50),
    AvailableSeats INT NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screen(ScreenID)
);
-- --------------------------------------------------
-- Hyderabad Theaters
-- --------------------------------------------------
INSERT INTO Theatre (Name, Location, ContactInfo) VALUES
('PVR: Hyderabad Central', 'Panjagutta, Hyderabad', '040-12345678'),
('INOX: GVK One', 'Banjara Hills, Hyderabad', '040-23456789'),
('AMB Cinemas', 'Gachibowli, Hyderabad', '040-34567890');

-- --------------------------------------------------
-- Recent Movies (2023-2024 Releases)
-- --------------------------------------------------
INSERT INTO Movie (Title, Language, Format, Certification, Duration) VALUES
('Salaar', 'Telugu', 'IMAX 3D', 'UA', 175),
('Animal', 'Hindi', '4DX', 'A', 181),
('Dunki', 'Hindi', '2D', 'U', 153),
('Guntur Kaaram', 'Telugu', '2D', 'UA', 158),
('Fighter', 'Hindi', 'IMAX 3D', 'UA', 166),
('Pushpa 2', 'Telugu', 'IMAX', 'UA', 185),
('Leo', 'Tamil', '2D', 'UA', 164);

-- --------------------------------------------------
-- Screens in Hyderabad Theaters
-- --------------------------------------------------
INSERT INTO Screen (TheatreID, ScreenName, Capacity, SoundSystem) VALUES
(1, 'Screen 1', 250, 'Dolby Atmos'),
(1, 'Screen 2', 200, '4K Dolby 7.1'),
(2, 'Screen 1', 220, 'IMAX 3D'),
(2, 'Screen 2', 180, 'Dolby 5.1'),
(3, 'Screen 1', 300, '4DX'),
(3, 'Screen 2', 280, 'IMAX');

-- --------------------------------------------------
-- 7-Day Shows (March 25 - March 31, 2024)
-- --------------------------------------------------
INSERT INTO `Show` (MovieID, ScreenID, Date, StartTime, EndTime, Status, AvailableSeats) VALUES
-- Day 1
(1, 1, '2024-03-25', '10:00:00', '12:55:00', 'Available', 250),
(2, 2, '2024-03-25', '13:30:00', '16:00:00', 'Available', 200),
(3, 3, '2024-03-25', '16:30:00', '19:00:00', 'Available', 220),
(4, 4, '2024-03-25', '19:30:00', '22:00:00', 'Available', 180),
(5, 5, '2024-03-25', '22:30:00', '01:15:00', 'Available', 300),

-- Day 2
(6, 1, '2024-03-26', '10:00:00', '12:55:00', 'Available', 250),
(7, 2, '2024-03-26', '13:30:00', '16:00:00', 'Available', 200),
(1, 3, '2024-03-26', '16:30:00', '19:00:00', 'Available', 220),
(2, 4, '2024-03-26', '19:30:00', '22:00:00', 'Available', 180),
(3, 5, '2024-03-26', '22:30:00', '01:15:00', 'Available', 300),

-- Day 3
(4, 1, '2024-03-27', '10:00:00', '12:55:00', 'Available', 250),
(5, 2, '2024-03-27', '13:30:00', '16:00:00', 'Available', 200),
(6, 3, '2024-03-27', '16:30:00', '19:00:00', 'Available', 220),
(7, 4, '2024-03-27', '19:30:00', '22:00:00', 'Available', 180),
(1, 5, '2024-03-27', '22:30:00', '01:15:00', 'Available', 300),

-- Day 4
(2, 1, '2024-03-28', '10:00:00', '12:55:00', 'Available', 250),
(3, 2, '2024-03-28', '13:30:00', '16:00:00', 'Available', 200),
(4, 3, '2024-03-28', '16:30:00', '19:00:00', 'Available', 220),
(5, 4, '2024-03-28', '19:30:00', '22:00:00', 'Available', 180),
(6, 5, '2024-03-28', '22:30:00', '01:15:00', 'Available', 300),

-- Day 5
(7, 1, '2024-03-29', '10:00:00', '12:55:00', 'Available', 250),
(1, 2, '2024-03-29', '13:30:00', '16:00:00', 'Available', 200),
(2, 3, '2024-03-29', '16:30:00', '19:00:00', 'Available', 220),
(3, 4, '2024-03-29', '19:30:00', '22:00:00', 'Available', 180),
(4, 5, '2024-03-29', '22:30:00', '01:15:00', 'Available', 300),

-- Day 6
(5, 1, '2024-03-30', '10:00:00', '12:55:00', 'Available', 250),
(6, 2, '2024-03-30', '13:30:00', '16:00:00', 'Available', 200),
(7, 3, '2024-03-30', '16:30:00', '19:00:00', 'Available', 220),
(1, 4, '2024-03-30', '19:30:00', '22:00:00', 'Available', 180),
(2, 5, '2024-03-30', '22:30:00', '01:15:00', 'Available', 300),

-- Day 7
(3, 1, '2024-03-31', '10:00:00', '12:55:00', 'Available', 250),
(4, 2, '2024-03-31', '13:30:00', '16:00:00', 'Available', 200),
(5, 3, '2024-03-31', '16:30:00', '19:00:00', 'Available', 220),
(6, 4, '2024-03-31', '19:30:00', '22:00:00', 'Available', 180),
(7, 5, '2024-03-31', '22:30:00', '01:15:00', 'Available', 300);

-- P2 list down all the shows on a given date at a given theatre along with their respective show timings.
SELECT 
    s.ShowID,
    m.Title AS MovieTitle,
    s.Date AS ShowDate,
    s.StartTime,
    s.EndTime,
    scr.ScreenName,
    t.Name AS TheatreName
FROM `Show` s
JOIN Screen scr ON s.ScreenID = scr.ScreenID
JOIN Theatre t ON scr.TheatreID = t.TheatreID
JOIN Movie m ON s.MovieID = m.MovieID
WHERE s.Date = '2024-03-26'  -- Replace with the desired date
AND t.Name = 'PVR: Hyderabad Central'  -- Replace with the desired theatre name
ORDER BY s.StartTime;


