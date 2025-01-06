-- Create Wine Table
CREATE TABLE Wine (
    Wine_Number INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Category NVARCHAR(20) NOT NULL, -- Red, White, Rose, Sparkling
    Degree DECIMAL(3, 1) NOT NULL, -- Alcohol percentage
    Year INT NOT NULL
);

-- Create Producer Table
CREATE TABLE Producer (
    Producer_ID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Region NVARCHAR(50) NOT NULL -- Sousse, Tunis, Sfax, Monastir
);

-- Create Harvest Table (Associative Table)
CREATE TABLE Harvest (
    Harvest_ID INT PRIMARY KEY,
    Wine_Number INT NOT NULL, -- FK to Wine
    Producer_ID INT NOT NULL, -- FK to Producer
    Quantity DECIMAL(10, 2) NOT NULL, -- Quantity in liters
    FOREIGN KEY (Wine_Number) REFERENCES Wine(Wine_Number),
    FOREIGN KEY (Producer_ID) REFERENCES Producer(Producer_ID)
);

INSERT INTO Wine (Wine_Number, Name, Category, Degree, Year)
VALUES
(1, 'Cabernet Sauvignon', 'Red', 13.5, 2020),
(2, 'Chardonnay', 'White', 12.5, 2021),
(3, 'Merlot', 'Red', 14.0, 2019),
(4, 'Pinot Noir', 'Red', 13.0, 2022),
(5, 'Riesling', 'White', 11.5, 2020),
(6, 'Syrah', 'Red', 13.8, 2018),
(7, 'Zinfandel', 'Red', 12.5, 2020),
(8, 'Prosecco', 'Sparkling', 11.0, 2021),
(9, 'Rose Blend', 'Rose', 10.5, 2022),
(10, 'Sauvignon Blanc', 'White', 12.2, 2019),
(11, 'Champagne', 'Sparkling', 12.0, 2018),
(12, 'Pet-Nat', 'Sparkling', 12.8, 2021);


INSERT INTO Producer (Producer_ID, Name, Region)
VALUES
(1, 'Vineyard Alpha', 'Sousse'),
(2, 'Vineyard Beta', 'Tunis'),
(3, 'Vineyard Gamma', 'Sousse'),
(4, 'Vineyard Delta', 'Sfax'),
(5, 'Vineyard Epsilon', 'Monastir'),
(6, 'Vineyard Zeta', 'Tunis'),
(7, 'Vineyard Eta', 'Sousse'),
(8, 'Vineyard Theta', 'Monastir'),
(9, 'Vineyard Iota', 'Sfax'),
(10, 'Vineyard Kappa', 'Tunis'),
(11, 'Vineyard Lambda', 'Monastir'),
(12, 'Vineyard Mu', 'Sousse');



INSERT INTO Harvest (Harvest_ID, Wine_Number, Producer_ID, Quantity)
VALUES
(1, 1, 1, 400.0),
(2, 2, 2, 300.0),
(3, 3, 3, 350.0),
(4, 4, 4, 280.0),
(5, 5, 5, 200.0),
(6, 6, 6, 450.0),
(7, 7, 7, 370.0),
(8, 8, 8, 180.0),
(9, 9, 9, 320.0),
(10, 10, 10, 240.0),
(11, 11, 11, 220.0),
(12, 12, 12, 500.0); -- Includes the required record for Wine Number 12


SELECT * FROM Producer;


SELECT * FROM Producer
ORDER BY Name;


SELECT * FROM Producer
WHERE Region = 'Sousse';



SELECT SUM(Quantity) AS Total_Quantity
FROM Harvest
WHERE Wine_Number = 12;


SELECT W.Category, SUM(H.Quantity) AS Total_Quantity
FROM Harvest H
JOIN Wine W ON H.Wine_Number = W.Wine_Number
GROUP BY W.Category;



SELECT P.Name AS Producer_Name, H.Quantity
FROM Harvest H
JOIN Producer P ON H.Producer_ID = P.Producer_ID
WHERE P.Region = 'Sousse' AND H.Quantity > 300;



SELECT W.Wine_Number, W.Name AS Wine_Name, P.Name AS Producer_Name
FROM Harvest H
JOIN Wine W ON H.Wine_Number = W.Wine_Number
JOIN Producer P ON H.Producer_ID = P.Producer_ID
WHERE W.Degree > 12 AND P.Producer_ID = 1; -- Replace 1 with desired Producer_ID




