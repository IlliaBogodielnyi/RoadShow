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
				[VendorID] [bigint],
                CONSTRAINT [PK_ProductLine_ProductLineID] PRIMARY KEY CLUSTERED ( [ProductLineID] ASC )
) ON [PRIMARY];
GO

ALTER TABLE [dbo].[ProductLine] WITH CHECK ADD 
	CONSTRAINT [FK_ProductLine_Vendor_VendorID] FOREIGN KEY
	(
		[VendorID]
	) REFERENCES [dbo].[Vendor] (
		[VendorID]
	); 
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

/****** inserts ******/

USE [roadshow_db]
GO

INSERT INTO [dbo].[Vendor]
           ([Name])
     VALUES
           ('Microsoft'),
		   ('Amazon'),
		   ('Google'),
		   ('MongoDB Inc')

GO

USE [roadshow_db]
GO

INSERT INTO [dbo].[ProductLine]
           ([Name]
           ,[VendorID])
     VALUES
           ('Azure', 1),
		   ('Amazon Web Services', 2),
		   ('Google Cloud Platform', 3)
GO

USE [roadshow_db]
GO

INSERT INTO [dbo].[Product]
           ([ProductLineID]
           ,[VendorID]
           ,[Name]
           ,[ShortDescription])
     VALUES
        (1,1,'Cosmos DB','Distributed, multi-model database service offered by Microsoft. It is designed to provide high availability, scalability, and low-latency access to data for modern applications. '),
		(2,2,'DynamoDB',' Managed NoSQL database service provided by Amazon Web Services. It supports key-value and document data structures and is designed to handle a wide range of applications requiring scalability and performance.'),
		(3,3,'Cloud Firestore','Flexible, scalable NoSQL cloud database that can store and sync data for client- and server-side development'),
		(3,3,'Cloud Spanner','Globally distributed relational database service that offers both strong consistency and horizontal scalability'),
		(3,3,'Cloud Bigtable','NoSQL big data database service suitable for large analytical and operational workloads'),
		(3,3,'Cloud Memorystore','Fully managed in-memory data store service built on popular open-source in-memory data stores like Redis and Memcached'),
		(3,3,'Cloud SQL','Fully-managed relational database that supports SQL Server, PostgreSQL, and MySQL'),
		(NULL,4,'MongoDB','MongoDB is a source-available, cross-platform, document-oriented database program. Classified as a NoSQL database product, MongoDB uses JSON-like documents with optional schemas. Released in February 2009 by 10gen, it supports features like sharding, replication, and ACID transactions.')
GO


