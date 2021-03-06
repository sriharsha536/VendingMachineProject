/****** Object:  Table [dbo].[__RefactorLog]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__RefactorLog](
	[OperationKey] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OperationKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Items__727E838BE5B580C4] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[LocationAddressZip] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[MachineId] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[Capacity] [bigint] NULL,
 CONSTRAINT [PK__Machine__44EE5B38811A39E8] PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineItemDetails]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineItemDetails](
	[MachineId] [bigint] NOT NULL,
	[ItemId] [bigint] NOT NULL,
	[ItemCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC,
	[ItemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/3/2021 1:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[MachineId] [bigint] NULL,
	[ItemId] [bigint] NULL,
	[AmountDeposited] [decimal](18, 2) NULL,
	[AmountCharged] [decimal](18, 2) NULL,
	[TransactionStatus] [nvarchar](50) NULL,
	[TransactionDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__Transact__55433A6BA34CF03C] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'9821ab71-23e8-4b3b-a61d-097f92a3940c')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'c090d73e-6fab-46f5-9e2e-11c2b187fc23')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'7cf00c3f-757a-4d64-ba1e-1bf2660207b9')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'affb37d5-2a26-469b-9909-4769a22c3fb9')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'13eabb9c-2664-41be-b757-51dd65aa046c')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'd67324a2-ca64-4c5e-ad26-641ae6c4f418')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'8e8504c9-93bf-4fab-93f4-88dc0c3fe8cf')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'a2792504-7975-4f94-aa30-921bca045377')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'f728d17a-f420-474e-9899-aa2c1057d067')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'5c33a1f7-ae3a-4879-a266-e945f074688e')
INSERT [dbo].[__RefactorLog] ([OperationKey]) VALUES (N'5287e276-b12b-47dc-a8ff-f6338e091088')
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (1, N'Snickers', CAST(1.29 AS Decimal(18, 2)), N'https://pngimg.com/uploads/snickers/snickers_PNG13929.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (2, N'Water', CAST(1.00 AS Decimal(18, 2)), N'https://pngimg.com/uploads/water_bottle/water_bottle_PNG98961.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (3, N'Sprite', CAST(1.39 AS Decimal(18, 2)), N'https://banner2.cleanpng.com/20171220/qfw/sprite-png-can-image-5a3ab5f5287616.04952168151379710916578638.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (4, N'Coke', CAST(2.25 AS Decimal(18, 2)), N'https://img.favpng.com/2/19/14/coca-cola-cherry-fizzy-drinks-diet-coke-png-favpng-j1rHB4Ls2zDVpsJfkM2xbEnpU.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (5, N'Diet Coke', CAST(2.25 AS Decimal(18, 2)), N'https://e1.pngegg.com/pngimages/962/647/png-clipart-s-diet-coke-can.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (6, N'Fanta', CAST(1.39 AS Decimal(18, 2)), N'https://pngimg.com/uploads/fanta/fanta_PNG54.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (7, N'Milk', CAST(1.50 AS Decimal(18, 2)), N'https://pngimg.com/uploads/milk/milk_PNG12718.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (9, N'Peanuts', CAST(1.00 AS Decimal(18, 2)), N'https://www.riteaid.com/shop/media/catalog/product/0/2/029000016507.jpg?quality=80&bg-color=255,255,255&height=120&width=120')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (11, N'Cashews', CAST(1.75 AS Decimal(18, 2)), N'https://www.riteaid.com/shop/media/catalog/product/0/2/029000075399.jpg?quality=80&bg-color=255,255,255&height=120&width=120&canvas=120:120')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (12, N'Cake', CAST(2.00 AS Decimal(18, 2)), N'https://pngimg.com/uploads/chocolate_cake/chocolate_cake_PNG39.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (13, N'Chips', CAST(1.10 AS Decimal(18, 2)), N'https://pngimg.com/uploads/potato_chips/potato_chips_PNG80.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (14, N'Sanitizer', CAST(2.50 AS Decimal(18, 2)), N'https://pngimg.com/uploads/antiseptic/antiseptic_PNG61.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (15, N'Mask', CAST(1.39 AS Decimal(18, 2)), N'https://pngimg.com/uploads/medical_mask/medical_mask_PNG44.png')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [Url]) VALUES (16, N'Cheez-It', CAST(1.95 AS Decimal(18, 2)), N'https://www.riteaid.com/shop/media/catalog/product/j/r/jrqbieljm2iqpqt1agag.jpg?quality=80&bg-color=255,255,255&height=120&width=120&canvas=120:120')
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [LocationName], [LocationAddressZip]) VALUES (1, N'Chicago', N'60173')
INSERT [dbo].[Location] ([LocationId], [LocationName], [LocationAddressZip]) VALUES (2, N'Nashville', N'37203')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Machine] ON 

INSERT [dbo].[Machine] ([MachineId], [LocationId], [MachineName], [Capacity]) VALUES (1, 1, N'SNT17301', 100)
INSERT [dbo].[Machine] ([MachineId], [LocationId], [MachineName], [Capacity]) VALUES (2, 1, N'SNT17302', 80)
INSERT [dbo].[Machine] ([MachineId], [LocationId], [MachineName], [Capacity]) VALUES (3, 2, N'SNT20301', 60)
INSERT [dbo].[Machine] ([MachineId], [LocationId], [MachineName], [Capacity]) VALUES (4, 2, N'SNT20302', 150)
SET IDENTITY_INSERT [dbo].[Machine] OFF
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 1, 16)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 2, 19)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 3, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 4, 5)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 5, 2)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 6, 3)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 7, 1)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 9, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 11, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 12, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 13, 19)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 14, 3)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (1, 15, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 2, 3)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 3, 0)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 4, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 5, 5)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 6, 3)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 7, 3)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 9, 5)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 11, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 12, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 13, 1)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 14, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (2, 15, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 1, 1)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 2, 16)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 3, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 4, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 5, 5)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 6, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 7, 9)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 9, 2)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 11, 18)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 12, 16)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 13, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 14, 14)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 15, 15)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (3, 16, 1)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 1, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 2, 4)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 3, 7)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 4, 6)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 5, 2)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 6, 0)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 7, 2)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 9, 10)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 11, 12)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 12, 13)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 13, 13)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 14, 15)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 15, 15)
INSERT [dbo].[MachineItemDetails] ([MachineId], [ItemId], [ItemCount]) VALUES (4, 16, 11)
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (58, 1, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (59, 1, 7, CAST(3.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (60, 1, 9, CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (61, 1, 14, CAST(2.75 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (62, 1, 13, CAST(1.10 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (63, 2, 4, CAST(3.00 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (64, 2, 13, CAST(2.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (65, 2, 14, CAST(2.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (66, 2, 7, CAST(2.25 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (67, 2, 15, CAST(2.25 AS Decimal(18, 2)), CAST(1.39 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (68, 2, 3, CAST(1.50 AS Decimal(18, 2)), CAST(1.39 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (69, 2, 3, CAST(2.00 AS Decimal(18, 2)), CAST(1.39 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (70, 3, 4, CAST(2.25 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (71, 3, 12, CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (72, 3, 7, CAST(2.35 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (73, 3, 13, CAST(1.25 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (74, 3, 1, CAST(1.35 AS Decimal(18, 2)), CAST(1.29 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (75, 3, 16, CAST(2.00 AS Decimal(18, 2)), CAST(1.95 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (76, 4, 3, CAST(1.60 AS Decimal(18, 2)), CAST(1.39 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (77, 4, 13, CAST(1.25 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (78, 4, 16, CAST(2.25 AS Decimal(18, 2)), CAST(1.95 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (79, 4, 4, CAST(2.25 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (80, 4, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (81, 4, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (82, 4, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
INSERT [dbo].[Transactions] ([TransactionId], [MachineId], [ItemId], [AmountDeposited], [AmountCharged], [TransactionStatus], [TransactionDate]) VALUES (83, 4, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Complete', CAST(N'2021-03-03T00:00:00.0000000-06:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
ALTER TABLE [dbo].[Machine] ADD  CONSTRAINT [DF__Machine__Capacit__656C112C]  DEFAULT ((100)) FOR [Capacity]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF__Transacti__Amoun__66603565]  DEFAULT ((0.00)) FOR [AmountDeposited]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF__Transacti__Amoun__6754599E]  DEFAULT ((0.00)) FOR [AmountCharged]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF__Transacti__Trans__68487DD7]  DEFAULT ('INCOMPLETE') FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_Machine_Location]
GO
ALTER TABLE [dbo].[MachineItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_MachineItemDetails_ItemsTable] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[MachineItemDetails] CHECK CONSTRAINT [FK_MachineItemDetails_ItemsTable]
GO
ALTER TABLE [dbo].[MachineItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_MachineItemDetails_MachineTable] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[MachineItemDetails] CHECK CONSTRAINT [FK_MachineItemDetails_MachineTable]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Items]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Machine]
GO
