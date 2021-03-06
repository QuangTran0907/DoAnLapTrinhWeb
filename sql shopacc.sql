USE [ShopAcc]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idGame] [int] NOT NULL,
	[taikhoan] [varchar](20) NULL,
	[matkhau] [varchar](20) NULL,
	[trangthai] [bit] NULL,
	[ngaycapnhat] [datetime] NULL,
	[giaban] [decimal](18, 0) NULL,
	[rank] [nvarchar](10) NULL,
	[tuong] [int] NULL,
	[trangphuc] [int] NULL,
	[hinh] [varchar](30) NULL,
	[idLoai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[idAdmin] [int] IDENTITY(1,1) NOT NULL,
	[tenDangNhap] [varchar](20) NULL,
	[matkhau] [varchar](20) NULL,
	[quyen] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitietHD]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietHD](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[maHD] [int] NOT NULL,
	[ngaylap] [datetime] NULL,
	[tongtien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[iduser] ASC,
	[id] ASC,
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[hinhthucthanhtoan] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiAcc]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiAcc](
	[idLoai] [int] IDENTITY(1,1) NOT NULL,
	[tenloai] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGame]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGame](
	[idGame] [int] IDENTITY(1,1) NOT NULL,
	[tengame] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[idMedia] [int] IDENTITY(1,1) NOT NULL,
	[link_Media] [varchar](50) NULL,
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[idPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](150) NULL,
	[hinhanh] [varchar](30) NULL,
	[vote] [int] NULL,
	[iduser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPhanHoi] ASC,
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruyCap]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruyCap](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[trangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iduser] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/03/2022 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[tendn] [varchar](20) NULL,
	[matkhau] [varchar](20) NULL,
	[email] [varchar](120) NULL,
	[sdt] [varchar](11) NULL,
	[tenhienthi] [nvarchar](30) NULL,
	[anhdaidien] [varchar](30) NULL,
	[trangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [idGame], [taikhoan], [matkhau], [trangthai], [ngaycapnhat], [giaban], [rank], [tuong], [trangphuc], [hinh], [idLoai]) VALUES (1, 1, N'quang', N'123', 1, CAST(N'2022-03-22T00:00:00.000' AS DateTime), CAST(100000 AS Decimal(18, 0)), N'xoài', 10, 7, N'content', 1)
INSERT [dbo].[Account] ([id], [idGame], [taikhoan], [matkhau], [trangthai], [ngaycapnhat], [giaban], [rank], [tuong], [trangphuc], [hinh], [idLoai]) VALUES (2, 1, N'phuoc', N'123', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(45000 AS Decimal(18, 0)), N'vang', 30, 12, N'/Content/images/Rubik2.png', 1)
INSERT [dbo].[Account] ([id], [idGame], [taikhoan], [matkhau], [trangthai], [ngaycapnhat], [giaban], [rank], [tuong], [trangphuc], [hinh], [idLoai]) VALUES (3, 2, N'phuoc2', N'123', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(45000 AS Decimal(18, 0)), N'vang', 34, 12, N'/Content/images/book4.jpg', 2)
INSERT [dbo].[Account] ([id], [idGame], [taikhoan], [matkhau], [trangthai], [ngaycapnhat], [giaban], [rank], [tuong], [trangphuc], [hinh], [idLoai]) VALUES (6, 2, N'phuoc3', N'123', 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), N'vang', 2, 3, N'/Content/images/Rubik2.png', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiAcc] ON 

INSERT [dbo].[LoaiAcc] ([idLoai], [tenloai]) VALUES (1, N'vip')
INSERT [dbo].[LoaiAcc] ([idLoai], [tenloai]) VALUES (2, N'thuong')
SET IDENTITY_INSERT [dbo].[LoaiAcc] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiGame] ON 

INSERT [dbo].[LoaiGame] ([idGame], [tengame]) VALUES (1, N'freefire')
INSERT [dbo].[LoaiGame] ([idGame], [tengame]) VALUES (2, N'Lien Quan')
SET IDENTITY_INSERT [dbo].[LoaiGame] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([idGame])
REFERENCES [dbo].[LoaiGame] ([idGame])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([idLoai])
REFERENCES [dbo].[LoaiAcc] ([idLoai])
GO
ALTER TABLE [dbo].[chitietHD]  WITH CHECK ADD FOREIGN KEY([iduser], [id])
REFERENCES [dbo].[TruyCap] ([iduser], [id])
GO
ALTER TABLE [dbo].[chitietHD]  WITH CHECK ADD FOREIGN KEY([maHD])
REFERENCES [dbo].[HoaDon] ([maHD])
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD FOREIGN KEY([iduser])
REFERENCES [dbo].[User] ([iduser])
GO
ALTER TABLE [dbo].[TruyCap]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[TruyCap]  WITH CHECK ADD FOREIGN KEY([iduser])
REFERENCES [dbo].[User] ([iduser])
GO
