USE [master]
GO
/****** Object:  Database [QL_DVThueXe]    Script Date: 05/02/2023 9:09:15 PM ******/
CREATE DATABASE [QL_DVThueXe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_DVThueXe', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QL_DVThueXe.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_DVThueXe_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QL_DVThueXe_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_DVThueXe] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_DVThueXe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_DVThueXe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_DVThueXe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_DVThueXe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_DVThueXe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_DVThueXe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_DVThueXe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_DVThueXe] SET  MULTI_USER 
GO
ALTER DATABASE [QL_DVThueXe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_DVThueXe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_DVThueXe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_DVThueXe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_DVThueXe', N'ON'
GO
USE [QL_DVThueXe]
GO
/****** Object:  Table [dbo].[ChiTietDonDat]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDat](
	[VAT] [nvarchar](10) NULL,
	[idDV] [int] NOT NULL,
	[idDonDat] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[MaTinh] [tinyint] NOT NULL,
	[TenTinh] [nvarchar](50) NULL,
	[KhoangCach] [int] NULL,
 CONSTRAINT [PK_DiaDiem] PRIMARY KEY CLUSTERED 
(
	[MaTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[Gia] [float] NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[MaTinh] [tinyint] NOT NULL,
	[MaXe] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDat]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [date] NULL,
	[TongTien] [float] NULL,
	[TrangThaiThanhToan] [bit] NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaXe] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DonDat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](300) NULL,
	[MaXe] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[CMND] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](10) NULL,
	[QuyenSD] [nvarchar](20) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xe]    Script Date: 05/02/2023 9:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[MaXe] [nvarchar](20) NOT NULL,
	[TenXe] [nvarchar](50) NULL,
	[SoCho] [tinyint] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (1, N'An Giang', 10)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (2, N'Kiên Giang', 20)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (3, N'Hà Nội', 30)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (4, N'Hải Phòng', 40)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (5, N'Đà Nẵng', 50)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (6, N'TP. Hồ Chí Minh', 60)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (7, N'Bến Tre', 70)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (8, N'Cà Mau', 70)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (9, N'Sóc Trăng', 90)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (10, N'Kon Tum', 100)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (11, N'Dăk Lăk', 110)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (12, N'Lâm Đồng', 120)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (13, N'Vũng Tàu', 130)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (14, N'Nha Trang', 140)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (15, N'Khánh Hòa', 150)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (16, N'Nghệ An', 160)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (17, N'Bình Dương', 170)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (18, N'Đồng Nai', 180)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (19, N'Hà Tĩnh', 190)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (20, N'Thừa - Thiên Huế', 200)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (21, N'Pleiku', 210)
INSERT [dbo].[DiaDiem] ([MaTinh], [TenTinh], [KhoangCach]) VALUES (22, N'Buôn Mê Thuộc', 220)
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (1, N'Xe tự lái', 10000, CAST(0x85440B00 AS Date), CAST(0xA4440B00 AS Date), 1, N'Xe1')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (3, N'Xe trung chuyển', 2000, CAST(0x85440B00 AS Date), CAST(0x85440B00 AS Date), 2, N'65_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (4, N'VIP', 100, CAST(0x85440B00 AS Date), CAST(0x85440B00 AS Date), 3, N'66_H15169')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (5, N'Xe mới', 12121, CAST(0x85440B00 AS Date), CAST(0x85440B00 AS Date), 4, N'67_H11111')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (8, N'Xe cũ', 1232, CAST(0xC3600C00 AS Date), CAST(0xC3600C00 AS Date), 5, N'68_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (12, N'Xe cao cấp', 300000, CAST(0x6B430B00 AS Date), CAST(0xD8440B00 AS Date), 6, N'69_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (13, N'Siêu xe', 99999, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 7, N'70_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (14, N'Hạng sang', 555555, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 8, N'71_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (15, N'Tầm trung', 1112121, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 9, N'72_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (16, N'Giá rẻ', 10, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 10, N'73_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (17, N'Giá tốt', 33, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 1, N'74_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (18, N'Du lịch', 50, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 2, N'75_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (19, N'Tự hành', 400, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 3, N'76_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (21, N'Dịch vụ 1', 111111, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 4, N'77_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (22, N'Dịch vụ 2', 222222, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 5, N'78_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (23, N'Dịch vụ 3', 333333, CAST(0x6B430B00 AS Date), CAST(0x6B430B00 AS Date), 6, N'79_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (31, N'Xe máy', 50, CAST(0x6B430B00 AS Date), CAST(0x6C430B00 AS Date), 5, N'100')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (41, N'PKL 1', 11, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 11, N'81_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (42, N'PKL 2', 22, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 12, N'82_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (43, N'PKL 3', 33, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 13, N'83_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (44, N'PKL 4', 44, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 14, N'84_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (45, N'PKL 5', 55, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 15, N'85_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (46, N'PKL 6', 66, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 16, N'86_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (47, N'PKL 7', 77, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 17, N'87_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (48, N'PKL 8', 88, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 18, N'88_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (49, N'PKL 9', 99, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 19, N'89_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (50, N'PKL 10', 111, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 20, N'90_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (51, N'PKL 11', 222, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 21, N'91_H15168')
INSERT [dbo].[DichVu] ([id], [Ten], [Gia], [NgayBD], [NgayKT], [MaTinh], [MaXe]) VALUES (52, N'PKL 12', 333, CAST(0xEF360B00 AS Date), CAST(0xF0360B00 AS Date), 22, N'92_H15168')
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[DonDat] ON 

INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (61, CAST(0x50450B00 AS Date), 10000, 1, N'NV01', 4, N'Xe1')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (62, CAST(0x50450B00 AS Date), 2000, 1, N'NV01', 4, N'65_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (63, CAST(0x50450B00 AS Date), 36363, 1, N'NV01', 4, N'67_H11111')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (64, CAST(0x50450B00 AS Date), 1232, 1, N'NV01', 4, N'68_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (65, CAST(0x50450B00 AS Date), 300000, 1, N'NV01', 4, N'69_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (66, CAST(0x51450B00 AS Date), 2000, 1, N'NV01', 1, N'65_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (67, CAST(0x51450B00 AS Date), 30000, 1, N'NV01', 1, N'Xe1')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (68, CAST(0x51450B00 AS Date), 24242, 1, N'NV01', 1, N'67_H11111')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (69, CAST(0x51450B00 AS Date), 2464, 1, N'NV01', 1, N'68_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (70, CAST(0x51450B00 AS Date), 600000, 1, N'NV01', 1, N'69_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (80, CAST(0x51450B00 AS Date), 10000, 1, N'NV01', 1, N'Xe1')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (81, CAST(0x51450B00 AS Date), 2000, 1, N'NV01', 1, N'65_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (82, CAST(0x51450B00 AS Date), 12121, 1, N'NV01', 1, N'67_H11111')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (83, CAST(0x51450B00 AS Date), 1232, 1, N'NV01', 1, N'68_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (84, CAST(0x51450B00 AS Date), 300000, 1, N'NV01', 1, N'69_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (85, CAST(0x51450B00 AS Date), 100, 1, N'NV01', 1, N'66_H15169')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (86, CAST(0x51450B00 AS Date), 400, 1, N'NV01', 1, N'76_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (87, CAST(0x51450B00 AS Date), 1112121, 1, N'NV01', 1, N'72_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (88, CAST(0x51450B00 AS Date), 99999, 1, N'NV01', 1, N'70_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (89, CAST(0x51450B00 AS Date), 555555, 1, N'NV01', 1, N'71_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (90, CAST(0x51450B00 AS Date), 33, 1, N'NV01', 1, N'74_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (91, CAST(0x51450B00 AS Date), 10, 1, N'NV01', 1, N'73_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (92, CAST(0x51450B00 AS Date), 10000, 1, N'NV01', 1, N'Xe1')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (93, CAST(0x51450B00 AS Date), 2000, 1, N'NV01', 1, N'65_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (94, CAST(0x51450B00 AS Date), 12121, 1, N'NV01', 1, N'67_H11111')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (95, CAST(0x51450B00 AS Date), 1232, 1, N'NV01', 1, N'68_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (96, CAST(0x51450B00 AS Date), 300000, 1, N'NV01', 1, N'69_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (97, CAST(0x51450B00 AS Date), 100, 1, N'NV01', 1, N'66_H15169')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (98, CAST(0x51450B00 AS Date), 400, 1, N'NV01', 1, N'76_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (99, CAST(0x51450B00 AS Date), 1112121, 1, N'NV01', 1, N'72_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (100, CAST(0x51450B00 AS Date), 33, 0, N'NV01', 1, N'74_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (101, CAST(0x51450B00 AS Date), 555555, 1, N'NV01', 1, N'71_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (102, CAST(0x51450B00 AS Date), 99999, 1, N'NV01', 1, N'70_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (103, CAST(0x51450B00 AS Date), 10, 0, N'NV01', 1, N'73_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (104, CAST(0x51450B00 AS Date), 50, 0, N'NV01', 1, N'75_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (105, CAST(0x51450B00 AS Date), 333333, 0, N'NV01', 1, N'79_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (106, CAST(0x51450B00 AS Date), 111111, 0, N'NV01', 1, N'77_H15168')
INSERT [dbo].[DonDat] ([id], [NgayDat], [TongTien], [TrangThaiThanhToan], [MaNV], [MaKH], [MaXe]) VALUES (107, CAST(0x51450B00 AS Date), 222222, 0, N'NV01', 1, N'78_H15168')
SET IDENTITY_INSERT [dbo].[DonDat] OFF
SET IDENTITY_INSERT [dbo].[HinhAnh] ON 

INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (1, N'qqq.jfif', N'Xe1')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (4, N'car-1.jpg', N'65_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (7, N'car-10.jpg', N'66_H15169')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (8, N'car-11.jfif', N'67_H11111')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (9, N'car-11.jpg', N'69_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (10, N'car-12.jfif', N'70_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (11, N'car-12.jpg', N'71_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (12, N'car-13.jfif', N'72_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (13, N'car-14.jfif', N'73_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (14, N'car-15.jfif', N'74_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (15, N'car-2.jpg', N'75_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (16, N'car-3.jpg', N'76_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (17, N'car-4.jpg', N'77_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (18, N'car-5.jpg', N'78_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (19, N'car-6.jpg', N'79_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (20, N'car-7.jpg', N'80_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (21, N'car-8.jpg', N'68_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (22, N'car-100.jfif', N'100')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (23, N'car-20.jfif', N'81_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (24, N'car-21.jfif', N'82_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (25, N'car-22.jfif', N'83_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (26, N'car-23.jfif', N'84_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (27, N'car-24.jfif', N'85_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (28, N'car-25.jfif', N'86_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (29, N'car-26.jfif', N'87_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (30, N'car-27.jfif', N'88_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (31, N'car-28.jfif', N'89_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (32, N'car-29.jfif', N'90_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (33, N'car-30.jfif', N'91_H15168')
INSERT [dbo].[HinhAnh] ([id], [URL], [MaXe]) VALUES (34, N'car-31.jpg', N'92_H15168')
SET IDENTITY_INSERT [dbo].[HinhAnh] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [SDT], [Email], [TaiKhoan], [MatKhau]) VALUES (1, N'dsa', N'32131', N'ádsad', N'12323', N'tranphuongthai000@gmail.com', N'admin', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [SDT], [Email], [TaiKhoan], [MatKhau]) VALUES (2, N'wewqewqeqwe', N'213123123', N'213213', N'123123213', N'tranphuongthai000@gmail.com', N'qwerty', N'11111')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [SDT], [Email], [TaiKhoan], [MatKhau]) VALUES (3, N'aaa', N'3123123', N'231123', N'23112312', N'tranphuongthai000ds@gmail.com', N'123123', N'123123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [SDT], [Email], [TaiKhoan], [MatKhau]) VALUES (4, N'nguyen tan dai', N'123', N'3/2', N'0943946242', N'ndai6618@gmail.com', N'1', N'1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [SDT], [Email], [TaiKhoan], [MatKhau]) VALUES (5, N'tran thien dinh', N'9327323214', N'311 nguyen van cu ', N'0999999999', N'dinhb2008989@gmail.com', N'tran thien dinh', N'dinh123')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'1', N'1', N'1', N'User')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV001', N'Nguyen Tan Dai', N'12345', N'Admin')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV002', N'Nguyen Van B', N'345', N'User')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV003', N'Nguyễn Thanh Bình ', N'00', N'Admin')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV004', N'Nguyễn Công Danh', N'10', N'User')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV005', N'Dương Văn Hiếu ', N'20', N'User')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV006', N'Trần Kim Hanh', N'30', N'User')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'NV01', N'Nguyễn Văn A', N'12345', N'Admin')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'qqq', N'qqq', N'qqq', N'qqq')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [MatKhau], [QuyenSD]) VALUES (N'www', N'www', N'www', N'www')
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'100', N'Honda', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'65_H15168', N'Cheverolet', 6, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'66_H15169', N'Subaru', 8, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'67_H11111', N'Misubishi Xpander', 4, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'68_H15168', N'Mercedes Grand Sedan', 7, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'69_H15168', N'Huracan LP 580-2', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'70_H15168', N'Huracan Performante', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'71_H15168', N'Aventador S LP 700-4', 5, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'72_H15168', N'Urus', 7, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'73_H15168', N'BMW 3 Gran Turismo', 4, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'74_H15168', N'BMW 5 Series Sedan', 4, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'75_H15168', N' BMW 3 Series sedan', 6, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'76_H15168', N'BMW 1 Series 5 Door', 8, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'77_H15168', N'BMW 2 Series Gran Tourer', 6, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'78_H15168', N'Maybach', 4, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'79_H15168', N'G-Class', 4, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'80_H15168', N'V-Class', 5, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'81_H15168', N'KTM 200 Duke', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'82_H15168', N'Kawasaki W175 SE', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'83_H15168', N'Benelli Imperiale 400', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'84_H15168', N'Honda R15', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'85_H15168', N'Honda CB190R', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'86_H15168', N'Suzuki GSX R150', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'87_H15168', N'Yamaha R15 V3.0', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'88_H15168', N'Yamaha FZS V2.0', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'89_H15168', N'Yamaha FZ25', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'90_H15168', N'Honda CBF190 TR', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'91_H15168', N'Yamaha TFX 150', 2, 1)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'92_H15168', N'Honda Sonic 150R', 2, 0)
INSERT [dbo].[Xe] ([MaXe], [TenXe], [SoCho], [TrangThai]) VALUES (N'Xe1', N'Toyota', 4, 1)
ALTER TABLE [dbo].[ChiTietDonDat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDat_DichVu] FOREIGN KEY([idDV])
REFERENCES [dbo].[DichVu] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonDat] CHECK CONSTRAINT [FK_ChiTietDonDat_DichVu]
GO
ALTER TABLE [dbo].[ChiTietDonDat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDat_DonDat] FOREIGN KEY([idDonDat])
REFERENCES [dbo].[DonDat] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonDat] CHECK CONSTRAINT [FK_ChiTietDonDat_DonDat]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_DiaDiem] FOREIGN KEY([MaTinh])
REFERENCES [dbo].[DiaDiem] ([MaTinh])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_DiaDiem]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_Xe]
GO
ALTER TABLE [dbo].[DonDat]  WITH CHECK ADD  CONSTRAINT [FK_DonDat_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDat] CHECK CONSTRAINT [FK_DonDat_KhachHang]
GO
ALTER TABLE [dbo].[DonDat]  WITH CHECK ADD  CONSTRAINT [FK_DonDat_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonDat] CHECK CONSTRAINT [FK_DonDat_NhanVien]
GO
ALTER TABLE [dbo].[DonDat]  WITH CHECK ADD  CONSTRAINT [FK_DonDat_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[DonDat] CHECK CONSTRAINT [FK_DonDat_Xe]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_HinhAnh_Xe]
GO
USE [master]
GO
ALTER DATABASE [QL_DVThueXe] SET  READ_WRITE 
GO
