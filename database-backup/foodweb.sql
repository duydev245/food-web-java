USE MASTER
GO

DROP DATABASE IF EXISTS [DBFOODWEB] 
GO

CREATE DATABASE [DBFOODWEB]
GO

USE [DBFOODWEB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[ward_id] [int] NULL,
	[district_id] [int] NULL,
	[city_id] [int] NULL,
	[role] [nvarchar](20) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Plan]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Plan](
	[id] [int] NOT NULL,
	[account_id] [int] NULL,
	[dish_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish_Ingredients]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish_Ingredients](
	[dish_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[ingredient_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [money] NULL,
	[status] [bit] NULL,
	[description] [text] NULL,
	[category] [nvarchar](255) NULL,
	[calories] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[recipe] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[city_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
	[total_quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[name] [nvarchar](255) NULL,
	[period] [tinyint] NULL,
	[day_of_week] [tinyint] NULL,
	[description] [text] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Dishes]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Dishes](
	[menu_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[order_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[item_type] [bit] NOT NULL,
	[quantity] [int] NULL,
	[price_per_unit] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[order_date] [datetime] NULL,
	[ship_date] [datetime] NULL,
	[ship_address] [nvarchar](255) NULL,
	[ship_city_id] [int] NULL,
	[ship_district_id] [int] NULL,
	[ship_ward_id] [int] NULL,
	[total_price] [money] NULL,
	[customer_notes] [text] NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 7/2/2024 12:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[district_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Order_Details] ADD  DEFAULT ((1)) FOR [item_type]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([ward_id])
REFERENCES [dbo].[Ward] ([id])
GO
ALTER TABLE [dbo].[Customer_Plan]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Customer_Plan]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dishes] ([id])
GO
ALTER TABLE [dbo].[Dish_Ingredients]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dishes] ([id])
GO
ALTER TABLE [dbo].[Dish_Ingredients]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[Ingredients] ([id])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Menu_Dishes]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dishes] ([id])
GO
ALTER TABLE [dbo].[Menu_Dishes]  WITH CHECK ADD FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dishes] ([id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ship_city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ship_district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ship_ward_id])
REFERENCES [dbo].[Ward] ([id])
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD CHECK  (([day_of_week]=(8) OR [day_of_week]=(7) OR [day_of_week]=(6) OR [day_of_week]=(5) OR [day_of_week]=(4) OR [day_of_week]=(3) OR [day_of_week]=(2)))
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD CHECK  (([period]=(3) OR [period]=(2) OR [period]=(1)))
GO
