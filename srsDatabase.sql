USE [srsInfo]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 2020. 02. 10. 19:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[LicensePlateNum] [varchar](50) NULL,
	[ProductionDate] [date] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 2020. 02. 10. 19:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relation]    Script Date: 2020. 02. 10. 19:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_Relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (1, N'Opel', N'Astra', N'qwe-123', CAST(N'1992-09-24' AS Date))
INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (2, N'Opel', N'Corsa', N'rtz-456', CAST(N'1400-04-10' AS Date))
INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (3, N'Suzuki', N'Ignis', N'uio-678', CAST(N'2002-10-11' AS Date))
INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (4, N'Volkswagen', N'Polo', N'asd-012', CAST(N'1547-12-01' AS Date))
INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (5, N'Ferrari', N'Mondial', N'wer-111', CAST(N'2020-02-04' AS Date))
INSERT [dbo].[Car] ([id], [Manufacturer], [Type], [LicensePlateNum], [ProductionDate]) VALUES (6, N'Fiat', N'Punto', N'xcv-465', CAST(N'2020-02-07' AS Date))
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([id], [LastName], [FirstName], [BirthDate]) VALUES (1, N'Nagy', N'Péter', CAST(N'1999-09-15' AS Date))
INSERT [dbo].[Owner] ([id], [LastName], [FirstName], [BirthDate]) VALUES (2, N'Kiss', N'Anna', CAST(N'2000-10-13' AS Date))
INSERT [dbo].[Owner] ([id], [LastName], [FirstName], [BirthDate]) VALUES (4, N'Burucz', N'Alex', CAST(N'2020-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[Owner] OFF
SET IDENTITY_INSERT [dbo].[Relation] ON 

INSERT [dbo].[Relation] ([id], [OwnerId], [CarId]) VALUES (1, 1, 1)
INSERT [dbo].[Relation] ([id], [OwnerId], [CarId]) VALUES (2, 1, 3)
INSERT [dbo].[Relation] ([id], [OwnerId], [CarId]) VALUES (3, 2, 2)
INSERT [dbo].[Relation] ([id], [OwnerId], [CarId]) VALUES (4, 2, 4)
INSERT [dbo].[Relation] ([id], [OwnerId], [CarId]) VALUES (7, 4, 5)
SET IDENTITY_INSERT [dbo].[Relation] OFF
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Car] FOREIGN KEY([id])
REFERENCES [dbo].[Car] ([id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Car]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_Car]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_Owner]
GO
/****** Object:  StoredProcedure [dbo].[spCarData]    Script Date: 2020. 02. 10. 19:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spCarData]
@id int
AS
BEGIN
	SELECT 
	c.id,
	c.Manufacturer,
	c.Type,
	c.LicensePlateNum,
	c.ProductionDate
	FROM Relation AS r 
	INNER JOIN Car AS c
	ON c.id = r.CarId
	INNER JOIN Owner AS o
	ON o.id = r.OwnerId
	WHERE OwnerId = @id
END
GO
