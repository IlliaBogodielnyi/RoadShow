USE [master] 
GO

/****** Object:  Database [roadshow_db] ******/

CREATE DATABASE [roadshow_db] 
GO 

USE [roadshow_db] 
GO

/****** Object:  Table [dbo].[vendors] ******/

CREATE TABLE [dbo].[Vendor]
        (
                [VendorID] [bigint] IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
                [Name] [nvarchar](50) NOT NULL,
                CONSTRAINT [PK_Vendor_VendorID] PRIMARY KEY CLUSTERED ( [VendorID] ASC )
        )
ON [PRIMARY]
GO

/****** Object:  Table [dbo].[product_lines] *****/

CREATE TABLE [dbo].[ProductLine]
        (
                [ProductLineID] [bigint] IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
                [Name] [nvarchar](50) NOT NULL,
                CONSTRAINT [PK_ProductLine_ProductLineID] PRIMARY KEY CLUSTERED ( [ProductLineID] ASC )
) ON [PRIMARY];
GO

/****** Object:  Table [dbo].[Product] *****/

CREATE TABLE [dbo].[Product]
        (
                [ProductID] [bigint] IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
				[ProductLineID] [bigint] NULL,
                [VendorID] [bigint] NOT NULL,
				[Name] [nvarchar](50) NOT NULL,
                [ShortDescription] [nvarchar](max) NULL,                
                CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED ( [ProductID] ASC )
        )
ON [PRIMARY];
GO

ALTER TABLE [dbo].[Product] WITH CHECK ADD 
	CONSTRAINT [FK_Product_ProductLine_ProductLineID] FOREIGN KEY
	(
		[ProductLineID]
	) REFERENCES [dbo].[ProductLine] (
		[ProductLineID]
	); 
GO
		
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductLine_ProductLineID] 
GO
		
ALTER TABLE [dbo].[Product] WITH CHECK ADD 
	CONSTRAINT [FK_Product_Vendor] FOREIGN KEY
	(
		[VendorID]
	) REFERENCES [dbo].[Vendor] (
		[VendorID]
	);
GO
		
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Vendor]
 GO
		
/****** Object:  Table [dbo].[Tag] ******/
                
CREATE TABLE [dbo].[Tag]
    (
        [TagID] [bigint] IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
        [Name] [nvarchar](50) NOT NULL,
		CONSTRAINT [PK_Tag_TagID] PRIMARY KEY CLUSTERED ( [TagID] ASC )
    ) ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[Criteria] ******/

CREATE TABLE [dbo].[Criteria]
    (
        [CriteriaID] [bigint] IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
        [Name] [nvarchar](50) NOT NULL,
		[CriteriaRank] [int] NULL,
		CONSTRAINT [PK_Criteria_CriteriaID] PRIMARY KEY CLUSTERED ( [CriteriaID] ASC )
    ) ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[ProductCriteria] ******/

CREATE TABLE [dbo].[ProductCriteria](
	[ProductID] [bigint] NOT NULL,
	[CriteriaID] [bigint] NOT NULL,
	[CrtieriaValue] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_Product_ProductCriteria] PRIMARY KEY CLUSTERED ( [ProductID], [CriteriaID] )

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductCriteria] WITH CHECK ADD 
	CONSTRAINT [FK_ProductCriteria_Product_ProductID] FOREIGN KEY
	(
		[ProductID]
	) REFERENCES [dbo].[Product] (
		[ProductID]
	); 
GO
		
ALTER TABLE [dbo].[ProductCriteria] CHECK 
	CONSTRAINT [FK_ProductCriteria_Product_ProductID] 
GO
		
ALTER TABLE [dbo].[ProductCriteria] WITH CHECK ADD 
	CONSTRAINT [FK_ProductCriteria_Criteria_CriteriaID] FOREIGN KEY
	(
		[CriteriaID]
	) REFERENCES [dbo].[Criteria] (
		[CriteriaID]
	);
GO


