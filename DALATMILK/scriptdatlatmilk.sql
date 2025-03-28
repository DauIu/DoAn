USE [master]
GO
/****** Object:  Database [QuanLyBanHang]    Script Date: 12/03/2023 21:07:40 ******/
CREATE DATABASE [QuanLyBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyBanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyBanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyBanHang] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyBanHang', N'ON'
GO
ALTER DATABASE [QuanLyBanHang] SET QUERY_STORE = OFF
GO
USE [QuanLyBanHang]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[NoidungBL] [nvarchar](max) NULL,
	[MaThanhVien] [int] NULL,
	[MaSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDDh] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[TenSP] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDDh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPN] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [int] NULL,
	[MaSP] [int] NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[MaKH] [int] NULL,
	[UuDai] [int] NULL,
	[DaHuy] [bit] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[MaThanhVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](150) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien_Quyen]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien_Quyen](
	[MaLoaiTV] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiThanhVien_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[Fax] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](250) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhat] [datetime] NULL,
	[Chitiet] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[LuotBinhLuan] [int] NULL,
	[SoLuotMua] [int] NULL,
	[Moi] [int] NULL,
	[MaNCC] [int] NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [bit] NULL,
	[HinhAnh1] [nvarchar](max) NULL,
	[HinhAnh2] [nvarchar](max) NULL,
	[HinhAnh3] [nvarchar](max) NULL,
	[HinhAnh4] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 12/03/2023 21:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](150) NULL,
	[MatKhau] [nvarchar](150) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[MaLoaiTV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDh], [MaDDH], [MaSP], [TenSP], [SoLuong], [Dongia]) VALUES (1, 1, 1, N'Alienware M15 R1', 2, CAST(35000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] ON 

INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (3, 7, 1, CAST(20000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (4, 8, 1, CAST(20000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (5, 8, 2, CAST(25000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (6, 8, 5, CAST(30000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (7, 9, 1, CAST(20000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (8, 10, 2, CAST(25000000 AS Decimal(18, 0)), 12)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (9, 11, 1, CAST(35000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (10, 12, 1, CAST(35000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (11, 13, 4, CAST(50000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (12, 14, 2, CAST(34000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (13, 15, 3, CAST(30000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (14, 16, 5, CAST(27000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (15, 17, 6, CAST(27000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (16, 18, 7, CAST(34000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (17, 19, 8, CAST(27000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (18, 20, 9, CAST(34000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (19, 21, 10, CAST(30000000 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (1, CAST(N'2021-04-11T23:22:38.417' AS DateTime), 0, NULL, 0, 10, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1, N'Nguyễn văn A', N'123 Bùi đình túy, Q BT, TPHCM', N'vana@gmail.com', N'01235475231', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (2, N'Đỗ Văn B', N'23 XVNT, Q.BT, TPHCM', N'Dob@gmail.com', N'01234324232', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (3, N'Phạm Thế C', N'763 Đồng khởi, Q1, TPHCM', N'TheC@gmail.com', N'04349954312', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (4, N'Nguyễn văn D', N'123 Bùi đình túy, Q BT, TPHCM', N'vana@gmail.com', N'01235475231', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (5, N'Đỗ Văn E', N'23 XVNT, Q.BT, TPHCM', N'Dob@gmail.com', N'01234324232', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (6, N'Phạm Thế F', N'763 Đồng khởi, Q1, TPHCM', N'TheC@gmail.com', N'04349954312', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (7, N'Nguyễn văn G', N'123 Bùi đình túy, Q BT, TPHCM', N'vana@gmail.com', N'01235475231', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (8, N'Đỗ Văn H', N'23 XVNT, Q.BT, TPHCM', N'Dob@gmail.com', N'01234324232', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (9, N'Phạm Thế I', N'763 Đồng khởi, Q1, TPHCM', N'TheC@gmail.com', N'04349954312', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (10, N'xxx', N'vvv', N'asdda@gmail.com', N'0123456789', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (11, N'xxxxx', N'vvvv', N'admin@gmail.com', N'0123456789', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (12, N'xxxxxxxxxxx', N'vvvv', N'giahuyle1@gmail.com', N'0123456789', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (13, N'xxxxxxxxxxxxxxx', N'vvvvv', N'giahuyle1@gmail.com', N'0123456789', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (14, N'xxxx', N'vv', N'giahuyle1@gmail.com', N'0123456789', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (15, N'xxxxx', N'vvvv', N'giahuyle1@gmail.com', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (16, N'xxxx', N'vvvvvvv', N'giahuyle1@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Sữa Thanh trùng', N'Sữa Thanh trùng', N'Sữa Thanh trùng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Sữa Tiệt Trùng', N'Sữa Tiệt Trùng', N'Sữa Tiệt Trùng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (3, N'Sữa Chua Ăn', N'Sữa Chua Ăn', N'Sữa Chua Ăn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (4, N'Sữa Chua Uống', N'Sữa Chua Uống', N'Sữa Chua Uống')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (5, N'Sữa Chua Lên Men', N'Sữa Chua Lên Men', N'Sữa Chua Lên Men')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (6, N'Khác', N'Khác', N'Khác')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (7, N'Khuyễn mãi', N'Khuyễn mãi', N'Khuyễn mãi')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'Admin', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'Staff', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (3, N'Khách Thường', 5)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (4, N'Khách Vip', 10)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
GO
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'DangNhap', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLy', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTriWeb', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'DangNhap', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'QuanLy', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (3, N'DangNhap', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (4, N'DangNhap', NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'vietcargo', N'180/17 Nguyễn Hữu Cảnh, phường 22, Bình Thạnh,TP.HCM', N'contact@vietcargo.vn', N'0931620000', N'02866567777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'ezitrans', N'79/14 Dương Quảng Hàm, Cầu Giấy, Hà Nội', N'contact@ezitrans.com', N'0867503500', N'0389118500')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (3, N'PAKAGO', N'14/16A Thân Nhân Trung, P.13, Q. Tân Bình, HCM', N'hotro@pakago.com', N'0886788247', N'02866567777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (4, N'Indochinapost', N'167 Quang Trung, Đống Đa, Hà Nội', N'lienhe@indochinapost.com', N'0931620000', N'02866567777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (5, N'tantrieuexpress', N'39 Hồng Hà, P.2, Q. Tân Bình, HCM', N'tantrieuexpress@gmail.com', N'0905620000', N'02863569777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (6, N'cargoexpress', N'158/2 Hoàng Hoa Thám, P.12, Q. Tân Bình, Tp. HCM', N'contact@cargoexpress.vn', N'02822537487', N'02863569777')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (1, N'AN THỊNH PHÁT', N'anthinhphat@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (2, N'NPP UTN', N'npp@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (3, N'LẠT SƠN', N'son@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (4, N'SONG NGỌC', N'Biti''sk@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (5, N'NPP PHƯƠNG KHOA', N'MSI_Pro@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (6, N'​CÔNG TY TNHH X Y DỰNG TM PNP', N'Puma@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (7, N'​CÔNG TY TNHH DỊCH VỤ DŨNG MINH', N'Lenovo_Pro@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (8, N'NPP TƯỜNG HUY', N'huy@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (9, N'​NPP NGỌC QUỲNH DAO', N'Balenciaga@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (10, N'​NPP ANH HÀO', N'hao@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (11, N'Fila', N'Fila@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (12, N'Fhhlen', N'Fhhlen_Pro@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (13, N'Corsair', N'Corsair_Pro@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (14, N'SteelSeries', N'SteelSeries_Pro@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (15, N'Vietnam', N'Vietnam@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin]) VALUES (16, N'Hanquoc', N'Hanquoc@gmail.com')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (1, 1, NULL, 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (2, 1, NULL, 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (3, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (4, 2, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (5, 3, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (7, 1, NULL, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (8, 1, NULL, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (9, 1, NULL, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (10, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (11, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (12, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (13, 3, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (14, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (15, 6, CAST(N'2021-04-25T01:18:31.977' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (16, 6, CAST(N'2021-04-25T01:22:20.483' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (17, 6, CAST(N'2021-04-25T01:25:06.517' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (18, 1, CAST(N'2021-04-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (19, 6, CAST(N'2021-04-25T15:25:38.263' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (20, 1, CAST(N'2021-04-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (21, 6, CAST(N'2021-04-25T15:35:07.850' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangNhap', N'Đăng nhập')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLy', N'Quản lý')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTriWeb', N'Quản trị web')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (1, N'Sữa Thanh Trùng Chocolate 180ml', CAST(56000 AS Decimal(18, 0)), NULL, N'Giá sản phẩm phu thuộc vào số lượng sản phẩm, vui lòng tham khảo chi tiết bảng trên.', N'<p><strong>Sản phẩm sữa thanh tr&ugrave;ng Chocolate Dalatmilk</strong>&nbsp;được chế biến từ sữa b&ograve; tươi nguy&ecirc;n chất từ cao nguy&ecirc;n L&acirc;m Đồng &ndash; nơi c&oacute; nguồn nguy&ecirc;n liệu sữa tươi chất lượng cao được vắt từ những giống b&ograve; sữa tốt nhất trong điều kiện kh&iacute; hậu trung b&igrave;nh từ 15 &ndash; 25oC v&agrave; độ cao tr&ecirc;n 1000 m.</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'683453216a390bd87b27cba95bbc458d.jpg_720x720q80.jpg', 23, 2, 0, 0, 3, 1, 5, 2, 1, 0, N'STTT-Huong-socola-180ml-1 (1).jpg', N'STTT-Huong-socola-180ml-1.jpg', N'683453216a390bd87b27cba95bbc458d.jpg_720x720q80.jpg', N'683453216a390bd87b27cba95bbc458d.jpg_720x720q80.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (2, N'5 Hũ Sữa Chua Ăn Có Đường Hũ 100g', CAST(78000 AS Decimal(18, 0)), NULL, N'Sữa chua ăn có đường Dalatmilk giàu canxi và các chất dinh dưỡng từ sữa tươi nguyên chất hỗ trợ cho sự phát triển trưởng thành của trẻ, nhất là chiều cao.', N'<p>C&ocirc;ng nghệ l&ecirc;n men tự nhi&ecirc;n với&nbsp;<strong>chủng men sống L. Bulgaricus</strong>&nbsp;hỗ trợ hệ ti&ecirc;u h&oacute;a gi&uacute;p trẻ em lu&ocirc;n năng động, mạnh khỏe mỗi ng&agrave;y.</p>
<p>&bull; Sữa chua ăn c&oacute; đường Dalatmilk l&agrave; sản phẩm l&ecirc;n men tự nhi&ecirc;n từ sữa tươi nguy&ecirc;n chất đ&atilde; được thanh tr&ugrave;ng ở nhiệt độ th&iacute;ch hợp, dịch sữa sau l&ecirc;n men kh&ocirc;ng qua qu&aacute; tr&igrave;nh xử l&yacute; nhiệt để giữ lại chủng vi sinh vật c&oacute; lợi L. Bulgaricus.</p>
<p>&bull; Sữa chua ăn Dalatmilk l&agrave; sản phẩm l&ecirc;n men tự nhi&ecirc;n từ sữa tươi nguy&ecirc;n chất đ&atilde; được thanh tr&ugrave;ng ở nhiệt độ th&iacute;ch hợp, dịch sữa sau l&ecirc;n men kh&ocirc;ng qua qu&aacute; tr&igrave;nh xử l&yacute; nhiệt để giữ lại chủng vi sinh vật c&oacute; lợi L. Bulgaricus.</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'SCA-Dao-100g-1.jpg', 9, 12, 0, 0, 3, 1, 1, 2, 1, 0, N'SCA-Dao-100g-1.jpg', N'SCA-CD-100g-1.jpg', N'SCA-CD-100g-1.jpg', N'SCA-CD-100g-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (3, N'Sữa Chua Lên Men Đào Cool C 450ml', CAST(67000 AS Decimal(18, 0)), CAST(N'2023-03-12T00:00:00.000' AS DateTime), N'Sữa Chua Lên Men Đào – Cool C 450ml với thành phần chủ yếu từ sữa bò tươi nguyên chất Dalatmilk và nước cốt đào. Bổ sung vitamin C cho cơ thể, mang lại sự sảng khoái mà còn tăng cường sức đề kháng cho cơ thể của bạn với lợi khuẩn LH – BO2 (lợi khuẩn kích thích quá trình hấp thu chất dinh dưỡng cho cơ thể).', N'<p>Sử dụng nước &eacute;p đ&agrave;o nguy&ecirc;n chất mang đến một sản phẩm kh&aacute;c biệt ho&agrave;n to&agrave;n với c&aacute;c loại nước tr&aacute;i c&acirc;y pha hương liệu hiện c&oacute; tr&ecirc;n thị trường. Cool C cung cấp đầy đủ dưỡng chất v&agrave; l&agrave; sản phẩm đặc biệt c&oacute; thể thay thế nước tr&aacute;i c&acirc;y h&agrave;ng ng&agrave;y.</p>
<p>Sữa Chua L&ecirc;n Men Đ&agrave;o gi&uacute;p tăng cường sức đề kh&aacute;ng cho cơ thể với 36,0mg Vitamin C. Sản phẩm c&oacute; &iacute;t chất b&eacute;o, kh&ocirc;ng sử dụng chất bảo quản v&agrave; hương vị tự nhi&ecirc;n ph&ugrave; hợp với bữa ăn gia đ&igrave;nh, d&ugrave;ng thay nước giải kh&aacute;t h&agrave;ng ng&agrave;y.</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', 8, 50, 0, 0, 3, 1, 1, 2, 1, 0, N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422133699.jpg', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422133699.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (4, N'Sữa Thanh Trùng Không Đường 950ml', CAST(89000 AS Decimal(18, 0)), NULL, N'Sản phẩm sữa thanh trùng không đường Dalatmilk 950ml được chế biến từ sữa bò tươi nguyên chất từ cao nguyên Lâm Đồng – nơi có nguồn nguyên liệu sữa tươi chất lượng cao được vắt từ những giống bò sữa tốt nhất trong điều kiện khí hậu trung bình từ 15 – 25oC và độ cao trên 1000 m.', N'<p><strong>Sản phẩm sữa thanh tr&ugrave;ng kh&ocirc;ng đường Dalatmilk 950ml</strong>&nbsp;được chế biến từ sữa b&ograve; tươi nguy&ecirc;n chất từ cao nguy&ecirc;n L&acirc;m Đồng &ndash; nơi c&oacute; nguồn nguy&ecirc;n liệu sữa tươi chất lượng cao được vắt từ những giống b&ograve; sữa tốt nhất trong điều kiện kh&iacute; hậu trung b&igrave;nh từ 15 &ndash; 25oC v&agrave; độ cao tr&ecirc;n 1000 m.</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 14, 12, 0, 0, 3, 1, 1, 2, 1, 0, N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (5, N'Sữa Thanh Trùng Không Đường 180ml', CAST(89000 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Không Đường 180ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Thanh Tr&ugrave;ng Kh&ocirc;ng Đường 180ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', 9, 12, 0, 0, 3, 1, 1, 2, 1, 0, N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'a2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (6, N'Sữa Thanh Trùng Có Đường 180ml', CAST(69000 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Có Đường 180ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Thanh Tr&ugrave;ng C&oacute; Đường 180ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', 9, 12, 0, 0, 3, 1, 1, 1, 1, 0, N'a002.jpg', N'a004.jpg', N'a003.jpg', N'a001.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (7, N'Sữa Thanh Trùng Có Đường 180ml', CAST(890000 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Có Đường 180ml', N'<p>&nbsp;</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 14, 12, 0, 0, 3, 1, 1, 1, 1, 0, N'aa.jpg', N'aa.jpg', N'aa.jpg', N'aa.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (8, N'Sữa Thanh Trùng Có Đường 180ml', CAST(67900 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Có Đường 180ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Thanh Tr&ugrave;ng C&oacute; Đường 180ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 9, 12, 0, 0, 3, 1, 1, 1, 1, 0, N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (9, N'Sữa Thanh Trùng Có Đường 180ml', CAST(570000 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Có Đường 180ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Thanh Tr&ugrave;ng C&oacute; Đường 180ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 9, 12, 0, 0, 3, 1, 2, 1, 1, 0, N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (10, N'Sữa Thanh Trùng Có Đường 180ml', CAST(670000 AS Decimal(18, 0)), NULL, N'Sữa Thanh Trùng Có Đường 180ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Thanh Tr&ugrave;ng C&oacute; Đường 180ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', 9, 12, 0, 0, 3, 1, 1, 1, 2, 0, N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg', N'sua-chua-len-men-dalat-milk-cool-c-dao-hop-450ml-201911131422119939.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (12, N'Sữa Tươi Tiệt Trùng Dalatmilk', CAST(56000 AS Decimal(18, 0)), NULL, N'Sữa Tươi Tiệt Trùng- Có Đường 180ml | Dalatmilk là dòng sản phẩm mới nhất được chế biến từ 100% sữa tươi chất lượng cao. Được vắt từ những giống bò sữa tốt nhất.', N'<p><strong>Sữa Tươi Tiệt Tr&ugrave;ng- C&oacute; Đường 180ml | Dalatmilk</strong>&nbsp;l&agrave; d&ograve;ng sản phẩm mới nhất được chế biến từ 100% sữa tươi chất lượng cao. Được vắt từ những giống b&ograve; sữa tốt nhất.</p>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'da-lat-milk-it-duong-hop-180-ml.jpg', 4, 12, 0, 0, 3, 1, 2, 1, 2, 0, N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop (1).jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop (1).jpg', N'da-lat-milk-it-duong-hop-180-ml.jpg', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop (1).jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (13, N'Sữa Tươi Tiệt Trùng Dalatmilk- Có Đường 220ml | Thùng', CAST(870000 AS Decimal(18, 0)), NULL, N'Sữa Tươi Tiệt Trùng Dalatmilk- Có Đường 220ml | Thùng', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Tươi Tiệt Tr&ugrave;ng Dalatmilk- C&oacute; Đường 220ml | Th&ugrave;ng</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-tuoi-tiet-trung-dalat-milk-co-duong-180ml-loc-4-hop (1).jpg', 4, 12, 0, 0, 3, 1, 3, 1, 2, 0, N'da-lat-milk-it-duong-hop-180-ml.jpg', N'da-lat-milk-it-duong-hop-180-ml.jpg', N'da-lat-milk-it-duong-hop-180-ml.jpg', N'da-lat-milk-it-duong-hop-180-ml.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (32, N'5 Hũ Sữa Chua Ăn Có Đường Hũ 100g', CAST(78000 AS Decimal(18, 0)), NULL, N'5 Hũ Sữa Chua Ăn Có Đường Hũ 100g', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">5 Hũ Sữa Chua Ăn C&oacute; Đường Hũ 100g</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 4, 12, 0, 0, 3, 1, 1, 1, 3, 0, N'images (19).jpg', N'images (22).jpg', N'images (21).jpg', N'images (21).jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (37, N'Sữa Chua Uống – Có Đường 500ml', CAST(890000 AS Decimal(18, 0)), NULL, N'Sữa Chua Uống – Có Đường 500ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Uống &ndash; C&oacute; Đường 500ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'loc_sc_thanh_trung_co_duong_81df9a7a4f4d4db09e752a028f18909c_grande.png', 4, 12, 0, 0, 3, 1, 1, 1, 4, 0, N'422e6e8a4e8bd2bd78cc565ea5607044.jpg', N'images (1).jpg', N'images.jpg', N'images (1).jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (100, N'Sữa Chua Uống – Có Đường 500ml', CAST(1500000 AS Decimal(18, 0)), NULL, N'Sữa Chua Uống – Có Đường 500ml', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Uống &ndash; C&oacute; Đường 500ml</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'z2122091637955_90635dfe7db5e3205739cb72a8a775b6-scaled.jpg', 4, 12, 0, 0, 3, 1, 1, 3, 7, 0, N'z2122091637955_90635dfe7db5e3205739cb72a8a775b6-scaled.jpg', N'z2122091637955_90635dfe7db5e3205739cb72a8a775b6-scaled.jpg', N'z2122091637955_90635dfe7db5e3205739cb72a8a775b6-scaled.jpg', N'z2122091637955_90635dfe7db5e3205739cb72a8a775b6-scaled.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (101, N'Sữa Chua Ăn Có Đường Hũ 500g', CAST(78000 AS Decimal(18, 0)), NULL, N'Sữa Chua Ăn Có Đường Hũ 500g', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Ăn C&oacute; Đường Hũ 500g</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', 4, 12, 0, 0, 3, 1, 1, 3, 7, 0, N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (102, N'Sữa Chua Ăn Có Đường Hũ 500g', CAST(66900 AS Decimal(18, 0)), NULL, N'Sữa Chua Ăn Có Đường Hũ 500g', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Ăn C&oacute; Đường Hũ 500g</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg', 4, 12, 0, 0, 3, 1, 1, 3, 7, 0, N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (103, N'Sữa Chua Ăn Có Đường Hũ 500g', CAST(1400000 AS Decimal(18, 0)), NULL, N'Sữa Chua Ăn Có Đường Hũ 500g', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Ăn C&oacute; Đường Hũ 500g</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua_chua_an_trang_co_duong_dalat_milk__hop_500gr__59a2786096a04305b4265b001cf25553_grande.png', 4, 12, 0, 0, 3, 1, 1, 3, 7, 0, N'sua_chua_an_trang_co_duong_dalat_milk__hop_500gr__59a2786096a04305b4265b001cf25553_grande.png', N'sua_chua_an_trang_co_duong_dalat_milk__hop_500gr__59a2786096a04305b4265b001cf25553_grande.png', N'images (4).jpg', N'giay-nu-giay-sneaker-nu-giay-the-thao-nu-de-don-pha-mau-sieu-dep-1626263448176_6.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Chitiet], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLuotMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4]) VALUES (104, N'Sữa Chua Ăn Có Đường Hũ 500g', CAST(2600000 AS Decimal(18, 0)), NULL, N'Sữa Chua Ăn Có Đường Hũ 500g', N'<h1 class="gb-headline gb-headline-95186c53 gb-headline-text">Sữa Chua Ăn C&oacute; Đường Hũ 500g</h1>
<p><iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="https://www.ciuvo.com/ciuvo/globalstorage?version=2.1.4"></iframe></p>', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', 4, 12, 0, 0, 3, 1, 1, 3, 7, 0, N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg', N'sua-chua-co-duong-dalat-milk-hop-500g-202202221009313435.jpg', N'e3bb8b8f055f45b9a95b90ad6a91e411_tn.jpg')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (1, N'admin', N'123456', N'Quản trị viên', N'100 Nguyễn Huệ, Q1, TPHCM', N'admin@gmail.com', N'0123456789', N'Vật nuôi mà bạn yêu thích là gì?', N'HuyAdmin', 1)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (2, N'staff1', N'123456', N'Nhân viên 1', NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (5, N'asida118', N'123', N'Lê Gia Huy', N'100 Nguyễn Huệ, Q1, TPHCM', N'giahuyle1@gmail.com', NULL, N'who is your daddy', N'Huy', 3)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (7, N'asida111', N'123', N'hồ thị như loằn', N'123 ádasd', N'asd@gmail.com', N'0123456789', N'Họ tên người cha bạn là gì?', N'Huy', 3)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (8, N'asida111123', N'123', N'ád', N'100 Nguyễn Huệ, Q1, TPHCM', N'asd@gmail.com', N'0123456789', N'Vật nuôi mà bạn yêu thích là gì?', N'Huy', 3)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (9, N'staff2', N'123456', N'nhân viên 2', N'100 Nguyễn Huệ, Q1, TPHCM', N'admin@gmail.com', N'0123456789', N'Sở thích của bạn là gì', N'Huy', 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (11, N'staff3', N'123456', N'nhân viên 3', N'100 Nguyễn Huệ, Q1, TPHCM', N'giahuyle1@gmail.com', N'0123456789', N'Họ tên người cha bạn là gì?', N'Huy', 2)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_ThanhVien]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ToTable] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ToTable]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_ToTable] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_ToTable]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_ToTable] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_ToTable]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanHang] SET  READ_WRITE 
GO
