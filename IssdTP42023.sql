USE [IssdTP42023]
GO
/****** Object:  Table [dbo].[encuestas]    Script Date: 17/10/2023 21:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encuestas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NULL,
	[valor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preguntas]    Script Date: 17/10/2023 21:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preguntas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[encuestas]  WITH CHECK ADD  CONSTRAINT [FK_idPreg_pregunta] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[preguntas] ([id])
GO
ALTER TABLE [dbo].[encuestas] CHECK CONSTRAINT [FK_idPreg_pregunta]
GO
