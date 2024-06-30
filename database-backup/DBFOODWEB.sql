USE MASTER
GO

DROP DATABASE IF EXISTS DBFOODWEB 
GO

CREATE DATABASE DBFOODWEB
GO

USE DBFOODWEB
GO

CREATE TABLE City (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100)
);
GO

CREATE TABLE District (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100),
    city_id         INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(id)
);
GO

CREATE TABLE Ward (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100),
    district_id     INT NOT NULL,
    FOREIGN KEY (district_id) REFERENCES District(id)
);
GO

CREATE TABLE Accounts (
    id              INT PRIMARY KEY IDENTITY,
    full_name       NVARCHAR(255) NOT NULL,
    [password]      NVARCHAR(MAX) NOT NULL,
    email			NVARCHAR(255) NOT NULL,
    phone           NVARCHAR(20),
    [address]       NVARCHAR(255),
    ward_id         INT,
    district_id     INT,
    city_id         INT,
    [role]          NVARCHAR(20) DEFAULT 'user',
    [status]        BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (city_id) REFERENCES City(id),
    FOREIGN KEY (district_id) REFERENCES District(id),
    FOREIGN KEY (ward_id) REFERENCES Ward(id)
);
GO

CREATE TABLE Ingredients (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(255) NOT NULL,
    unit            NVARCHAR(50),
    price           MONEY,
    total_quantity  INT,
    category        NVARCHAR(100),
    [description]   TEXT,
    [status]        BIT,
    [image]         IMAGE
);
GO

CREATE TABLE Menu (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(255),
    [period]        TINYINT CHECK ([period] IN (1,2,3)),
    day_of_week     TINYINT CHECK (day_of_week IN (2,3,4,5,6,7,8)),
    [description]   TEXT,
    [status]        BIT DEFAULT 1,
);
GO

CREATE TABLE Dishes (
    id              INT PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(255),
    price           MONEY,
    [status]        BIT,
    [description]   TEXT,
    [image]         IMAGE
);
GO

CREATE TABLE Menu_Dishes (
    menu_id         INT NOT NULL,
    dish_id         INT NOT NULL,
    PRIMARY KEY (menu_id, dish_id),
    
    FOREIGN KEY (menu_id) REFERENCES Menu(id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO

CREATE TABLE Dish_Ingredients (
    dish_id               INT NOT NULL,
    ingredient_id         INT NOT NULL,
    ingredient_quantity   INT,
    unit                  VARCHAR(50),
    PRIMARY KEY (dish_id, ingredient_id),

    FOREIGN KEY (dish_id) REFERENCES Dishes(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id)
);
GO

CREATE TABLE Orders (
    id               INT PRIMARY KEY IDENTITY,
    account_id       INT,
    order_date       DATETIME,
    ship_date        DATETIME,
    ship_address     NVARCHAR(255),
    ship_city_id     INT,
    ship_district_id INT,
    ship_ward_id     INT,
    total_price      MONEY,
    customer_notes   TEXT,
    [status]         BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (ship_city_id) REFERENCES City(id),
    FOREIGN KEY (ship_district_id) REFERENCES District(id),
    FOREIGN KEY (ship_ward_id) REFERENCES Ward(id)
);
GO

CREATE TABLE Order_Details (
    order_id        INT NOT NULL,
    dish_id         INT NOT NULL,
    item_type       BIT NOT NULL DEFAULT 1,
    quantity        INT,
    price_per_unit  MONEY,
    PRIMARY KEY (order_id, dish_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO

CREATE TABLE Customer_Plan (
    id              INT PRIMARY KEY,
    account_id      INT,
    menu_id         INT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (menu_id) REFERENCES Menu(id)
);
GO
