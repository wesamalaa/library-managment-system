-- Create the database
CREATE DATABASE LibraryVisualizeDB;
GO

-- Use the created database
USE LibraryVisualizeDB;
GO

-- Create the Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- Create the Publishers table
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY IDENTITY(1,1),
    PublisherName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    ContactNumber NVARCHAR(15),
    Email NVARCHAR(100),
    Website NVARCHAR(100)
);

-- Create the Writers table
CREATE TABLE Writers (
    WriterID INT PRIMARY KEY IDENTITY(1,1),
    WriterName NVARCHAR(100) NOT NULL,
    BirthDate DATE,
    Nationality NVARCHAR(50),
    Biography NVARCHAR(MAX)
);

-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    ISBN NVARCHAR(13) NOT NULL UNIQUE,
    PublicationYear DATE,
    PublisherID INT,
    CategoryID INT,
    Genre NVARCHAR(50),
    Language NVARCHAR(50),
    TotalCopies INT,
    AvailableCopies INT,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the BookWriters junction table
CREATE TABLE BookWriters (
    BookID INT,
    WriterID INT,
    PRIMARY KEY (BookID, WriterID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (WriterID) REFERENCES Writers(WriterID)
);

-- Insert sample data into Categories

-- Insert data into Categories table
INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Science'),
('History'),
('Biography'),
('Children'),
('Fantasy'),
('Mystery'),
('Romance'),
('Self-help'),
('Travel');

-- Insert data into Publishers table
INSERT INTO Publishers (PublisherName, Address, ContactNumber, Email, Website) VALUES
('Al-Ahram Publishing House', 'Cairo, Egypt', '01012345678', 'info@ahram.com', 'www.ahram.com'),
('Dar El Shorouk', 'Cairo, Egypt', '01098765432', 'contact@shorouk.com', 'www.shorouk.com'),
('Maktabat Al Madbouly', 'Cairo, Egypt', '01234567890', 'support@madbouly.com', 'www.madbouly.com'),
('Al Kotob Khan', 'Giza, Egypt', '01112345678', 'info@kotobkhan.com', 'www.kotobkhan.com'),
('Al Dar Al Masriah Al Lubnaniah', 'Cairo, Egypt', '01198765432', 'contact@dar-masriah.com', 'www.dar-masriah.com'),
('Nahdet Misr', 'Giza, Egypt', '01212345678', 'support@nahdetmisr.com', 'www.nahdetmisr.com'),
('Dar Al Maaref', 'Cairo, Egypt', '01023456789', 'info@daralmaaref.com', 'www.daralmaaref.com'),
('Al Markaz Al Qawmi', 'Cairo, Egypt', '01034567890', 'contact@markazqawmi.com', 'www.markazqawmi.com'),
('Dar Al Hilal', 'Cairo, Egypt', '01123456789', 'support@daralhilal.com', 'www.daralhilal.com'),
('The National Center for Translation', 'Cairo, Egypt', '01223456789', 'info@nationaltranslation.com', 'www.nationaltranslation.com');

-- Insert data into Writers table
INSERT INTO Writers (WriterName, BirthDate, Nationality, Biography) VALUES
('Naguib Mahfouz', '1911-12-11', 'Egyptian', 'Naguib Mahfouz was an Egyptian writer who won the 1988 Nobel Prize for Literature. He published 34 novels, over 350 short stories, dozens of movie scripts, and five plays over a 70-year career.'),
('Taha Hussein', '1889-11-15', 'Egyptian', 'Taha Hussein was one of the most influential 20th-century Egyptian writers and intellectuals.'),
('Yusuf Idris', '1927-05-19', 'Egyptian', 'Yusuf Idris was an Egyptian writer of plays, short stories, and novels. He was a nominee for the Nobel Prize in Literature.'),
('Nawal El Saadawi', '1931-10-27', 'Egyptian', 'Nawal El Saadawi was an Egyptian feminist writer, activist, physician, and psychiatrist.'),
('Ihsan Abdel Quddous', '1919-01-01', 'Egyptian', 'Ihsan Abdel Quddous was a prominent Egyptian writer, novelist, and journalist.'),
('Sonallah Ibrahim', '1937-01-01', 'Egyptian', 'Sonallah Ibrahim is an Egyptian novelist and short story writer.'),
('Alaa Al Aswany', '1957-05-26', 'Egyptian', 'Alaa Al Aswany is an Egyptian writer and a founding member of the political movement Kefaya.'),
('Mansoura Ez-Eldin', '1976-03-12', 'Egyptian', 'Mansoura Ez-Eldin is an Egyptian novelist and journalist.'),
('Mohamed Salmawy', '1945-05-02', 'Egyptian', 'Mohamed Salmawy is an Egyptian playwright, journalist, and author.'),
('Bahaa Taher', '1935-01-01', 'Egyptian', 'Bahaa Taher was an Egyptian novelist and short story writer who won the inaugural International Prize for Arabic Fiction in 2008.');

-- Insert data into Books table
INSERT INTO Books (Title, ISBN, PublicationYear, PublisherID, CategoryID, Genre, Language, TotalCopies, AvailableCopies) VALUES
('Palace Walk', '9789774163875', '2011-12-11', 1, 1, 'Fiction', 'Arabic', 10, 5),
('The Days', '9789770933876', '2011-11-11', 2, 4, 'Biography', 'Arabic', 15, 7),
('The Committee', '9789774163882', '2015-08-11', 6, 2, 'Science Fiction', 'Arabic', 8, 3),
('Woman at Point Zero', '9789774163889', '2007-10-20', 5, 1, 'Fiction', 'Arabic', 12, 6),
('The Cairo Trilogy', '9789774163878', '1911-08-11', 1, 1, 'Fiction', 'Arabic', 10, 5),
('Chicago', '9789774163877', '2008-12-11', 7, 1, 'Fiction', 'Arabic', 10, 4),
('Zaat', '9789774163876', '2009-11-10', 8, 1, 'Fiction', 'Arabic', 10, 5),
('Yacoubian Building', '9789774163879', '2005-12-11', 3, 1, 'Fiction', 'Arabic', 10, 4),
('Sunset Oasis', '9789774163881', '1911-05-05', 4, 1, 'Fiction', 'Arabic', 10, 3),
('The Collar and the Bracelet', '9789774163880', '1986-09-09', 09, 1, 'Fiction', 'Arabic', 10, 2);




-- Update existing rows to set the DateAdded value to the current date


-- Insert data into BookWriters table
INSERT INTO BookWriters (BookID, WriterID) VALUES
(1, 1),
(2, 2),
(3, 6),
(4, 4),
(5, 1),
(6, 7),
(7, 8),
(8, 7),
(9, 10),
(10, 5);

