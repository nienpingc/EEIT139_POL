CREATE DATABASE HouseShip;

USE HouseShip;

CREATE TABLE [member] (
  [account] varchar(100) PRIMARY KEY NOT NULL,
  [hashed_pwd] nvarchar(100) NOT NULL,
  [salt] nvarchar(100) NOT NULL,
  [lastname] nvarchar(100) NOT NULL,
  [firstname] varchar(100) NOT NULL,
  [birthday] datetime2 NOT NULL,
  [email] nvarchar(100) NOT NULL,
  [m_address] nvarchar(100),
  [phone] varchar(10) NOT NULL,
  [mempic] nvarchar(100)
)
GO

CREATE TABLE [houseinfo] (
  [houseNo] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [account] varchar(100) NOT NULL,
  [h_title] nvarchar(100),
  [h_address] nvarchar(100),
  [h_type] int,
  [h_about] nvarchar(100),
  [h_price] decimal,
  [offersNo] int NOT NULL,
  [rulesNo] int NOT NULL
)
GO

CREATE TABLE [houseOffers] (
  [offersNo] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [wifi] bit,
  [tv] bit,
  [kitchen] bit,
  [refrigerator] bit,
  [microwave] bit,
  [aircon] bit,
  [washer] bit
)
GO

CREATE TABLE [houseRules] (
  [rulesNo] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [check_in] time(0),
  [check_out] time(0),
  [smoking] bit,
  [pet] bit
)
GO

CREATE TABLE [housePhotos] (
  [photoNo] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [houseNo] int NOT NULL,
  [photoPath] nvarchar(255)
)
GO

CREATE TABLE [orderinfo] (
  [orderid] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [account] varchar(100) NOT NULL,
  [orderdate] datetime2 NOT NULL
)
GO

CREATE TABLE [orderItem] (
  [itemid] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [orderid] int NOT NULL,
  [houseno] int NOT NULL,
  [chkinDate] date NOT NULL,
  [chkoutDate] date NOT NULL,
  [vid] int
)
GO


CREATE TABLE [forum] (
  [fid] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [account] varchar(100) NOT NULL,
  [postTime] datetime2,
  [theme] nvarchar(100),
  [title] nvarchar(100),
  [content] nvarchar(300)
)
GO

CREATE TABLE [vouchers] (
  [vid] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [v_code] nvarchar(100) NOT NULL,
  [v_title] nvarchar(100) NOT NULL,
  [v_status] bit NOT NULL,
  [discount] float NOT NULL,
  [stardate] datetime2 NOT NULL,
  [enddate] datetime2 NOT NULL
)
GO

ALTER TABLE [houseinfo] ADD FOREIGN KEY ([account]) REFERENCES [member] ([account])
GO

ALTER TABLE [houseinfo] ADD FOREIGN KEY ([offersNo]) REFERENCES [houseOffers] ([offersNo])
GO

ALTER TABLE [houseinfo] ADD FOREIGN KEY ([rulesNo]) REFERENCES [houseRules] ([rulesNo])
GO

ALTER TABLE [housePhotos] ADD FOREIGN KEY ([houseNo]) REFERENCES [houseinfo] ([houseNo])
GO

ALTER TABLE [orderinfo] ADD FOREIGN KEY ([account]) REFERENCES [member] ([account])
GO

ALTER TABLE [orderItem] ADD FOREIGN KEY ([orderid]) REFERENCES [orderinfo] ([orderid])
GO

ALTER TABLE [orderItem] ADD FOREIGN KEY ([houseno]) REFERENCES [houseinfo] ([houseNo])
GO

ALTER TABLE [orderItem] ADD UNIQUE ([orderid],[houseno]) 
GO


ALTER TABLE [forum] ADD FOREIGN KEY ([account]) REFERENCES [member] ([account])
GO

