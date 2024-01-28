/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model1_Seattle.DM1
 *
 * Date Created : Monday, October 23, 2023 20:59:48
 * Target DBMS : Microsoft Azure SQL DB
 */

/* 
 * TABLE: Dim_Breed 
 */

CREATE TABLE Dim_Breed(
    Breed_SK             int            NOT NULL,
    Species              varchar(10)    NULL,
    Primary_Breed        varchar(15)    NULL,
    Secondary_Breed      varchar(15)    NULL,
    Date_to_Warehouse    date           NULL,
    DI_JobID             varchar(10)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Breed_SK)
)

go


IF OBJECT_ID('Dim_Breed') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Breed >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Breed >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Date_Sk              int            NOT NULL,
    Day_Num              int            NULL,
    Day_Str              varchar(10)    NULL,
    Month_Num            int            NULL,
    Month_Str            varchar(10)    NULL,
    Year_Num             int            NULL,
    Is_Weekend           varchar(4)     NULL,
    Date_To_Warehouse    datetime       NULL,
    DI_JobID             varchar(10)    NULL,
    dt                   datetime       NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Date_Sk)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Location 
 */

CREATE TABLE Dim_Location(
    Location_Sk          int            NOT NULL,
    Zip                  varchar(10)    NULL,
    City                 varchar(10)    NULL,
    State                varchar(10)    NULL,
    Date_To_Warehouse    datetime       NULL,
    DI_JobID             char(10)       NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Location_Sk)
)

go


IF OBJECT_ID('Dim_Location') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Location >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Location >>>'
go

/* 
 * TABLE: Fct_SeaatlePetLicense 
 */

CREATE TABLE Fct_SeaatlePetLicense(
    PetLicense_SK     char(10)    NOT NULL,
    Location_Sk       int         NOT NULL,
    Date_Sk           int         NOT NULL,
    Breed_SK          int         NOT NULL,
    License_Number    char(10)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (PetLicense_SK, Location_Sk, Date_Sk, Breed_SK)
)

go


IF OBJECT_ID('Fct_SeaatlePetLicense') IS NOT NULL
    PRINT '<<< CREATED TABLE Fct_SeaatlePetLicense >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fct_SeaatlePetLicense >>>'
go

/* 
 * TABLE: Fct_SeaatlePetLicense 
 */

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Location1 
    FOREIGN KEY (Location_Sk)
    REFERENCES Dim_Location(Location_Sk)
go

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Date2 
    FOREIGN KEY (Date_Sk)
    REFERENCES Dim_Date(Date_Sk)
go

ALTER TABLE Fct_SeaatlePetLicense ADD CONSTRAINT RefDim_Breed3 
    FOREIGN KEY (Breed_SK)
    REFERENCES Dim_Breed(Breed_SK)
go


