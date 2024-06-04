USE MASTER
GO

DROP DATABASE IF EXISTS DBFOODWEB 
GO

CREATE DATABASE DBFOODWEB
GO

USE DBFOODWEB
GO

CREATE TABLE City (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100)
);
GO

CREATE TABLE District (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100),
    city_id         SMALLINT        NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(id)
);
GO

CREATE TABLE Ward (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(100),
    district_id     SMALLINT        NOT NULL,
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
    ward_id         SMALLINT,
    district_id     SMALLINT,
    city_id         SMALLINT,
    [role]          BIT NOT NULL DEFAULT 1,
    [status]        BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (city_id) REFERENCES City(id),
    FOREIGN KEY (district_id) REFERENCES District(id),
    FOREIGN KEY (ward_id) REFERENCES Ward(id)
);
GO

CREATE TABLE Ingredients (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(255)   NOT NULL,
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
    create_account  INT,
    [period]        TINYINT CHECK ([period] IN (1,2,3)),
    day_of_week     TINYINT CHECK (day_of_week IN (2,3,4,5,6,7,8)),
    [description]   TEXT,
    [status]        BIT DEFAULT 1,
    FOREIGN KEY (create_account) REFERENCES Accounts(id)
);
GO

CREATE TABLE Dishes (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    [name]          NVARCHAR(255),
    price           MONEY,
    [status]        BIT,
    [description]   TEXT,
    [image]         IMAGE
);
GO

CREATE TABLE Menu_Dishes (
    menu_id         INT NOT NULL,
    dish_id         SMALLINT NOT NULL,
    PRIMARY KEY (menu_id, dish_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO

CREATE TABLE Recipes (
    id              SMALLINT        PRIMARY KEY IDENTITY,
    dish_id         SMALLINT        NOT NULL,
    [description]   TEXT,
    instructions    TEXT,
    [status]        BIT,
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO

CREATE TABLE Recipe_Ingredients (
    recipe_id               SMALLINT NOT NULL,
    ingredient_id           SMALLINT NOT NULL,
    ingredient_quantity     SMALLINT,
    unit                    VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id)
);
GO

CREATE TABLE Orders (
    id              INT PRIMARY KEY IDENTITY,
    account_id      INT,
    order_date      DATETIME,
    ship_date       DATETIME,
    ship_address    NVARCHAR(255),
    ship_city_id    SMALLINT,
    ship_district_id SMALLINT,
    ship_ward_id    SMALLINT,
    total_price     MONEY,
    customer_notes  TEXT,
    [status]        BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (ship_city_id) REFERENCES City(id),
    FOREIGN KEY (ship_district_id) REFERENCES District(id),
    FOREIGN KEY (ship_ward_id) REFERENCES Ward(id)
);
GO

CREATE TABLE Order_Details (
    order_id        INT NOT NULL,
    dish_id         SMALLINT NOT NULL,
    item_type       BIT NOT NULL DEFAULT 1,
    quantity        SMALLINT,
    price_per_unit  MONEY,
    PRIMARY KEY (order_id, dish_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO

CREATE TABLE Cart (
    id              SMALLINT IDENTITY(1,1) PRIMARY KEY,
    account_id      INT,
    [status]        BIT DEFAULT 1,
    created_date    DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (account_id) REFERENCES Accounts(id)
);
GO

CREATE TABLE CartItems (
    id              INT IDENTITY(1,1) PRIMARY KEY,
    cart_id         SMALLINT NOT NULL,
    recipe_id       SMALLINT NOT NULL,
    quantity        INT DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES Cart(id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(id)
);
GO

CREATE TABLE Customer_Plan (
    id              INT PRIMARY KEY,
    account_id      INT,
    [period]        TINYINT CHECK ([period] IN (1,2,3)),
    day_of_week     TINYINT CHECK (day_of_week IN (2,3,4,5,6,7,8)),
    dish_id         SMALLINT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);
GO
