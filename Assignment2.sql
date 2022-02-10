CREATE DATABASE ASSIGNMENT2
GO

USE ASSIGNMENT2
GO

CREATE TABLE Trainee(
	TraineeID		int IDENTITY(1, 1) PRIMARY KEY,
	Full_Name		nvarchar(50),
	Birth_Date		date,
	Gender			bit,
	ET_IQ			int,
	ET_Gmath		int,
	ET_English		int,
	Training_Class		char(10),
	Evaluation_Notes	nvarchar(500),
    CONSTRAINT Check_ET_IQ CHECK (ET_IQ >= 0 AND ET_IQ <= 20),
	CONSTRAINT Check_ET_Gmath CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
	CONSTRAINT Check_ET_English CHECK (ET_English >= 0 AND ET_English <= 50)
)
GO



----------------------Q1-----------------------
INSERT INTO Trainee
VALUES ('Ngo Quang Huy', '01/23/2001', 1, 19, 18, 44, 'SQL', 'Creative, Energetic')
GO

INSERT INTO Trainee
VALUES ('Nguyen Minh Tri', '11/22/2001', 1, 17, 15, 35, 'SQL', 'Polite')
GO

INSERT INTO Trainee
VALUES ('Nguyen Tien Duc', '8/14/2001', 1, 7, 11, 28, 'SQL', 'Hard-working')
GO

INSERT INTO Trainee
VALUES ('Nguyen Manh Hoang', '3/10/2001', 1, 11, 11, 36, 'SQL', 'Friendly')
GO

INSERT INTO Trainee
VALUES ('Nguyen Hoang Phuc ', '2/25/2001', 1, 12, 14, 40, 'SQL', 'Talkative')
GO

INSERT INTO Trainee
VALUES ('Tran Thanh Van ', '11/18/2001', 0, 2, 10, 20, 'SQL', 'Sociable')
GO

INSERT INTO Trainee
VALUES ('Ta Thu Trang ', '12/31/2001', 0, 20, 19, 49, 'SQL', 'Smart, Talented')
GO

INSERT INTO Trainee
VALUES ('Do Thanh Thao ', '1/30/2001', 1, 16, 15, 40, 'SQL', 'Enthusiastic')
GO

INSERT INTO Trainee
VALUES ('Luu Thu Trang ', '5/3/2001', 1, 15, 10, 30, 'SQL', 'Optimistic')
GO

INSERT INTO Trainee
VALUES ('Nguyen Thu Huong', '1/30/2001', 1, 20, 18, 41, 'SQL', 'Serious')
GO


----------------------Q2-----------------------
ALTER TABLE Trainee
ADD Fsoft_Account char(50)
GO

UPDATE Trainee
    SET Fsoft_Account = LEFT(CONVERT(char(36), NEWID()), 10)
GO

ALTER TABLE Trainee
ALTER COLUMN Fsoft_Account char(50) NOT NULL
GO

ALTER TABLE Trainee
ADD UNIQUE (Fsoft_Account)
GO

ALTER TABLE Trainee
DROP COLUMN Fsoft_Account;
Go

----------------------Q3-----------------------
CREATE VIEW ET_Passed_Trainees AS
	SELECT TraineeID, Full_Name, Birth_Date, Gender
	FROM Trainee
	WHERE ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18
GO

SELECT * FROM ET_Passed_Trainees;

----------------------Q4-----------------------
SELECT	TraineeID,
	Full_Name,
	Birth_Date
FROM	Trainee
WHERE	ET_IQ + ET_Gmath >= 20
	AND ET_IQ >= 8
	AND ET_Gmath >= 8
	AND ET_English >= 18
ORDER BY MONTH(Birth_Date)



----------------------Q5-----------------------
SELECT	TraineeID,
	Full_Name,
	Birth_Date,
	YEAR(GETDATE()) - YEAR(Birth_Date) AS AGE,
	Gender
FROM	Trainee
WHERE	LEN(Full_Name) = (SELECT MAX(LEN(Full_Name)) FROM Trainee)

--Drop Database
DROP DATABASE ASSIGNMENT2
GO


