--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Model1_Seattle.DM1
--
-- Date Created : Monday, October 23, 2023 20:58:09
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: Dim_Breed 
--

CREATE TABLE Dim_Breed(
    Breed_SK             INT            NOT NULL,
    Species              VARCHAR(10),
    Primary_Breed        VARCHAR(15),
    Secondary_Breed      VARCHAR(15),
    Date_to_Warehouse    DATE,
    DI_JobID             VARCHAR(10),
    PRIMARY KEY (Breed_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    Date_Sk              INT            NOT NULL,
    Day_Num              INT,
    Day_Str              VARCHAR(10),
    Month_Num            INT,
    Month_Str            VARCHAR(10),
    Year_Num             INT,
    Is_Weekend           VARCHAR(4),
    Date_To_Warehouse    DATETIME,
    DI_JobID             VARCHAR(10),
    dt                   DATETIME,
    PRIMARY KEY (Date_Sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Location 
--

CREATE TABLE Dim_Location(
    Location_Sk          INT            NOT NULL,
    Zip                  VARCHAR(10),
    City                 VARCHAR(10),
    State                VARCHAR(10),
    Date_To_Warehouse    DATETIME,
    DI_JobID             CHAR(10),
    PRIMARY KEY (Location_Sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_SeaatlePetLicense 
--

CREATE TABLE Fct_SeaatlePetLicense(
    PetLicense_SK     CHAR(10)    NOT NULL,
    Location_Sk       INT         NOT NULL,
    Date_Sk           INT         NOT NULL,
    Breed_SK          INT         NOT NULL,
    License_Number    CHAR(10),
    PRIMARY KEY (PetLicense_SK, Location_Sk, Date_Sk, Breed_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_SeaatlePetLicense 
--

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Location1 
    FOREIGN KEY (Location_Sk)
    REFERENCES Dim_Location(Location_Sk)
;

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Date2 
    FOREIGN KEY (Date_Sk)
    REFERENCES Dim_Date(Date_Sk)
;

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Breed3 
    FOREIGN KEY (Breed_SK)
    REFERENCES Dim_Breed(Breed_SK)
;


