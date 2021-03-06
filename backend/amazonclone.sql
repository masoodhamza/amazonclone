USE [master]
GO
/****** Object:  Database [AmazonClone]    Script Date: 22-Jun-21 19:10:00 ******/
CREATE DATABASE [AmazonClone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AmazonClone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AmazonClone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AmazonClone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AmazonClone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AmazonClone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AmazonClone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AmazonClone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AmazonClone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AmazonClone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AmazonClone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AmazonClone] SET ARITHABORT OFF 
GO
ALTER DATABASE [AmazonClone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AmazonClone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AmazonClone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AmazonClone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AmazonClone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AmazonClone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AmazonClone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AmazonClone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AmazonClone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AmazonClone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AmazonClone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AmazonClone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AmazonClone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AmazonClone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AmazonClone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AmazonClone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AmazonClone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AmazonClone] SET RECOVERY FULL 
GO
ALTER DATABASE [AmazonClone] SET  MULTI_USER 
GO
ALTER DATABASE [AmazonClone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AmazonClone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AmazonClone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AmazonClone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AmazonClone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AmazonClone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AmazonClone', N'ON'
GO
ALTER DATABASE [AmazonClone] SET QUERY_STORE = OFF
GO
USE [AmazonClone]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TotalAmount] [decimal](16, 2) NULL,
	[OrderedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal](16, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[UserType] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
	@VendorID INT,
	@Name VARCHAR(255),
	@Description VARCHAR(MAX),
	@Price DECIMAL(16, 2),
	@Quantity SMALLINT
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM Vendors wHERE VendorID = @VendorID)
		SELECT 0 AS Result
	ELSE
		BEGIN
			INSERT INTO Products (VendorID, [Name], [Description], Price)
			VALUES (@VendorID, @Name, @Description, @Price)

			INSERT INTO Stock (ProductID, Quantity)
			VALUES (@@IDENTITY, @Quantity)

			SELECT 1 AS Result
		END
END

GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddToCart]
	@CustomerID INT,
	@ProductID INT,
	@Quantity INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM Customers WHERE CustomerID = @CustomerID)
		BEGIN
			DECLARE @Stock SMALLINT;
			SELECT @Stock = Quantity FROM Stock WHERE ProductID = @ProductID

			IF EXISTS(SELECT * FROM Cart WHERE CustomerID = @CustomerID AND ProductID = @ProductID)
				BEGIN
					DECLARE @ExistingQuantity SMALLINT;
					DECLARE @NewQuantity SMALLINT;
					
					SELECT @ExistingQuantity = Quantity FROM Cart WHERE CustomerID = @CustomerID AND ProductID = @ProductID;

					SET @NewQuantity = @ExistingQuantity + @Quantity;

					IF (@Stock < @NewQuantity)
						SELECT 0 AS Result
					ELSE
						BEGIN
							UPDATE Cart 
							SET Quantity = @NewQuantity
							WHERE CustomerID = @CustomerID AND ProductID = @ProductID
							SELECT 1 AS Result
						END
				END
			ELSE
				BEGIN
					SELECT @Stock = Quantity FROM Stock WHERE ProductID = @ProductID
					IF (@Stock < @Quantity)
						SELECT 0 AS Result
					ELSE
						BEGIN
							INSERT INTO Cart (CustomerID, ProductID, Quantity)
							VALUES (@CustomerID, @ProductID, @Quantity)
							SELECT 1 AS Result
						END
				END
		END
		
	ELSE
		SELECT 0 AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserDetails]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUserDetails]
	@UserID INT,
	@Name VARCHAR(255),
	@Address VARCHAR(255),
	@Phone VARCHAR(255)
AS
BEGIN
	DECLARE @UserType bit;

	IF NOT EXISTS(SELECT * FROM Users WHERE UserID = @UserID)
		SELECT 0 AS Result
	ELSE
		BEGIN
			SELECT @UserType = UserType FROM Users WHERE UserID = @UserID

			IF (@UserType = 0)
				IF EXISTS(SELECT * FROM Customers WHERE UserID = @UserID)
					SELECT 0 AS Result
				ELSE
					INSERT INTO Customers (UserID, [Name], [Address], Phone)
					VALUES (@UserID, @Name, @Address, @Phone)

			ELSE IF (@UserType = 1)
				IF EXISTS(SELECT * FROM Vendors WHERE UserID = @UserID)
					SELECT 0 AS Result
				ELSE
					INSERT INTO Vendors(UserID, [Name], [Address], Phone)
					VALUES (@UserID, @Name, @Address, @Phone)

			SELECT 1 AS Result
		END
END

GO
/****** Object:  StoredProcedure [dbo].[Checkout]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Checkout]
	@CustomerID INT
AS
BEGIN
	IF EXISTS(SELECT * FROM Customers WHERE CustomerID = @CustomerID)
		BEGIN
			DECLARE @TotalAmount DECIMAL(16,2);

			SELECT @TotalAmount = SUM(Products.Price)
			FROM Cart 
			INNER JOIN Products
			ON Cart.ProductID = Products.ProductID
			WHERE CustomerID = @CustomerID

			INSERT INTO Orders (CustomerID, TotalAmount, OrderedAt)
			VALUES (@CustomerID, @TotalAmount, GETDATE())
			DECLARE @OrderID INT = @@IDENTITY

			DECLARE @ProductID INT;
			DECLARE @Quantity SMALLINT;
			DECLARE @ExistingQuantity SMALLINT;
			DECLARE @NewQuantity SMALLINT;

			DECLARE OrderDetailsCursor CURSOR FOR
			SELECT ProductID, Quantity FROM Cart
			WHERE CustomerID = @CustomerID
			
			OPEN OrderDetailsCursor

			FETCH NEXT FROM OrderDetailsCursor
			INTO @ProductID, @Quantity
							
			WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT INTO OrdersDetails(OrderID, ProductID, Quantity)
				VALUES(@OrderID, @ProductID, @Quantity)

				SELECT @ExistingQuantity = Quantity FROM Stock
				WHERE ProductID = @ProductID

				SET @NewQuantity = @ExistingQuantity - @Quantity

				UPDATE Stock
				SET Quantity = @NewQuantity
				WHERE ProductID = @ProductID

				FETCH NEXT FROM OrderDetailsCursor
				INTO @ProductID, @Quantity
			END
			CLOSE OrderDetailsCursor
			DEALLOCATE OrderDetailsCursor

			DELETE FROM Cart
			WHERE CustomerID = @CustomerID

			SELECT 1 AS Result
		END
	ELSE
		SELECT 0 AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProducts]
	@VendorID INT = 0
AS
BEGIN	
	IF (@VendorID = 0)
		BEGIN
			SELECT P.ProductID, P.Name AS Product, P.Description, P.Price, S.Quantity, V.Name AS Vendor
			FROM Products AS P
			INNER JOIN Stock AS S 
			ON P.ProductID = S.ProductID
			INNER JOIN Vendors AS V 
			ON P.VendorID = V.VendorID
		END
	ELSE
		BEGIN
			SELECT P.ProductID, P.Name AS Product, P.Description, P.Price, S.Quantity, V.Name AS Vendor
			FROM Products AS P
			INNER JOIN Stock AS S 
			ON P.ProductID = S.ProductID
			INNER JOIN Vendors AS V 
			ON P.VendorID = V.VendorID
			WHERE P.VendorID = @VendorID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromCart]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveFromCart]
	@CustomerID INT,
	@ProductID INT = 0
AS
BEGIN
	IF EXISTS(SELECT * FROM Cart WHERE CustomerID = @CustomerID)
	BEGIN
		IF (@ProductID = 0)
			DELETE FROM Cart WHERE CustomerID = @CustomerID
		ELSE
			DELETE FROM Cart WHERE CustomerID = @CustomerID AND ProductID = @ProductID
		SELECT 1 AS Result
	END
	ELSE
		SELECT 0 AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[Signin]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Signin] 
	@Email varchar(255),
	@Password varchar(255)
AS
BEGIN
	if exists(select * from Users where Email = @Email and [Password] = @Password)
		select 1 as Result
	else
		select 0 as Result
END
GO
/****** Object:  StoredProcedure [dbo].[Signup]    Script Date: 22-Jun-21 19:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Signup] 
	@UserName varchar(255),
	@Email varchar(255),
	@Password varchar(255),
	@UserType bit
AS
BEGIN
	IF exists(select * from Users where UserName = @UserName or Email = @Email)
		select 0 as Result
	ELSE
		BEGIN
			insert into Users
			(UserName, Email, [Password], UserType)
			values
			(@UserName,@Email,@Password,@UserType)
			select 1 as Result
		END
END
GO
USE [master]
GO
ALTER DATABASE [AmazonClone] SET  READ_WRITE 
GO
