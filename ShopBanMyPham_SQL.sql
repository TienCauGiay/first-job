USE [master]
GO
/****** Object:  Database [ShopBanMyPham]    Script Date: 04/22/2023 17:46:23 ******/
CREATE DATABASE [ShopBanMyPham]

ALTER DATABASE [ShopBanMyPham] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBanMyPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBanMyPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopBanMyPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBanMyPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBanMyPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopBanMyPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBanMyPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopBanMyPham] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBanMyPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBanMyPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBanMyPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBanMyPham] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopBanMyPham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopBanMyPham] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopBanMyPham] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopBanMyPham] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopBanMyPham]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CustomerName] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EmployeeName] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](200) NULL,
	[Birthday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedBack] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](3000) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedBack] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[OrderStatus] [bit] NULL,
	[TotalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SellNumber] [int] NULL,
	[ShippingCost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](200) NULL,
	[Description] [nvarchar](3000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[TotalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetail](
	[ReceiptDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SellNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiptDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUser]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUser](
	[TypeUserID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/22/2023 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[TypeUserID] [int] NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Chống nắng da mặt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Kem dưỡng')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Sửa rửa mặt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Serum dưỡng tóc')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Son')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Sữa tắm')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [UserID], [EmployeeName], [Address], [Email], [PhoneNumber], [Birthday]) VALUES (1, 2, N'ROBOT', N'Address ROBOT', N'robot@gmail.com', N'0123456789', CAST(N'2023-04-22' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [EmployeeName], [Address], [Email], [PhoneNumber], [Birthday]) VALUES (2, 3, N'Bùi Ngọc Tiến', N'Thanh Hóa', N'tien@gmail.com', N'04328273', CAST(N'2001-05-17' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (1, 1, N'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml', 10, 399000, N'kcn1.png', N'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (2, 1, N'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 60ml', 15, 459000, N'kcn2.jpg', N'"Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu Bảo Vệ Hoàn Hảo là sản phẩm chống nắng phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp, giúp chống lại tác hại của tia UV & bụi mịn tối ưu dưới mọi điều kiện sinh hoạt, kể cả thời tiết khắc nghiệt nhất. Sản phẩm đặc biệt phù hợp với làn da thiên dầu.

Anessa Perfect UV Sunscreen Skincare Milk N SPF50+ PA++++ ứng dụng công nghệ Auto Booster và Very Water Resistant độc quyền từ thương hiệu ANESSA, giúp cho lớp màng chống UV trở nên bền vững hơn khi gặp NHIỆT ĐỘ CAO - ĐỘ ẨM - MỒ HÔI - NƯỚC - MA SÁT, đồng thời chống trôi trong nước lên đến 80 phút, chống bụi mịn PM.25 và chống dính cát. Ngoài ra, sự bổ sung của phức hợp 50% thành phần dưỡng da giúp ngăn ngừa lão hoá do tia UV hiệu quả và nuôi dưỡng da ẩm mịn."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (3, 1, N'Sữa Chống Nắng Anessa Cho Da Nhạy Cảm & Trẻ Em 60ml', 10, 459000, N'kcn3.jpg', N'"Sữa Chống Nắng Anessa Perfect UV Sunscreen Mild Milk SPF50+/ PA++++ là dòng sản phẩm chống nắng đến từ thương hiệu Anessa (thuộc tập đoàn Shiseido) - thương hiệu chống nắng được yêu thích hàng đầu tại Nhật Bản trong suốt 20 năm liền. Sản phẩm giúp bảo vệ da tối ưu với kết cấu mỏng nhẹ và thành phần 5 Không (không màu, không mùi, không cồn, không dầu khoáng và không paraben), phù hợp cho cả da nhạy cảm và da trẻ em từ 1 tuổi. Đặc biệt, công thức chứa 50% thành phần dưỡng da giúp bảo vệ da khỏi thương tổn do tia UV và hạt siêu vi trong không khí.

Sữa Chống Nắng Dưỡng Da Dịu Nhẹ Cho Da Nhạy Cảm & Trẻ Em Anessa Perfect UV Sunscreen Mild Milk SPF50+/ PA++++ đang có mặt tại Hasaki với 2 dung tích: 20ml và 60ml."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (4, 1, N'Kem Chống Nắng MartiDerm Phổ Rộng Bảo Vệ Toàn Diện 40ml', 10, 799000, N'kcn4.png', N'"Kem Chống Nắng MartiDerm The Originals Proteos Screen SPF50+ Fluid Cream đến từ thương hiệu dược mỹ phẩm Martiderm của Tây Ban Nha là dòng kem chống nắng dạng lỏng dễ hấp thụ với chỉ số SPF 50+ giúp ngăn ngừa và sửa chữa các dấu hiệu lão hoá da sớm. Sản phẩm cung cấp màng lọc chống nắng phổ rộng chống lại các tia UVA, UVB, IR (hồng ngoại), HEV (ánh sáng xanh). Sự kết hợp của Proteoglycans, phức hợp Spectrum Complex, phức hợp Hyaluronic Acid & Silicon Complex giúp giữ cho làn da trẻ trung, tươi tắn và đều màu. Kết cấu dạng cream-to-powder độc đáo mang lại cảm giác mượt mà, mỏng nhẹ tựa ""vô hình"" trên da.

Kem Chống Nắng Phổ Rộng Toàn Diện Ngừa Lão Hóa, Phòng Chống Nám Quay Lại MartiDerm The Originals Proteos Screen SPF50+ Fluid Cream 40ml hiện đã có mặt tại Hasaki."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (5, 1, N'Sữa Chống Nắng Sunplay Bảo Vệ Vượt Trội SPF81 PA++++ 70g', 5, 146000, N'kcn5.png', N'Với khí hậu oi bức ở Việt Nam, đặc biệt là trong những ngày hè tiết trời nắng nóng, ánh nắng chói chang, bỏng rát như thế này thì việc sử dụng kem chống nắng khi ra ngoài là điều vô cùng cần thiết. Thoa kem chống nắng là một trong những bước quan trọng trong quy trình chăm sóc, làm đẹp và bảo vệ làn da giúp da chống lại những tác động xấu của ánh nắng mặt trời, không những thế ánh nắng mặt trời còn là nguyên nhân gây nên các bệnh ung thư da cực kỳ nguy hiểm. Hasaki.vn xin giới thiệu Sữa chống nắng cực mạnh Sunplay Super Block với SPF81 và PA++++ đến từ thương hiệu quen thuộc Sunplay.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (6, 2, N'Gel Dưỡng Megaduo Gel Giảm Mụn, Mờ Thâm 15g', 20, 120000, N'kd1.png', N'"Gel Dưỡng Megaduo Giảm Mụn, Mờ Thâm 15g là sản phẩm gel dưỡng giảm mụn đến từ thương hiệu Gamma Chemicals của Việt Nam, với khả năng làm giảm tình trạng mụn đồng thời ngăn hình thành các vết thâm sau mụn và làm mờ các đốm thâm hiệu quả, an toàn lành tính cho mọi loại da. 

Hiện sản phẩm Gel Dưỡng Megaduo Giảm Mụn, Mờ Thâm 15g đang có mặt tại Hasaki với 2 loại: 

Megaduo Plus Gel 

Megaduo Gel 

1. Gel Dưỡng Gamma Megaduo Plus Giảm Mụn, Giảm Thâm 15g
Gel Dưỡng Gamma Megaduo Plus Giảm Mụn, Giảm Thâm 15g với thành phần chính là Retinal 1.0 và AHA giúp xua tan nỗi lo về mụn và vết thâm, ngăn ngừa mụn trứng cá, mụn đầu đen, mụn đầu trắng, mụn kèm theo viêm bội nhiễm từ trung bình đến nặng và dưỡng da.

Hiện sản phầm Gel Dưỡng Gamma Megaduo Plus Gel 15g đã có mặt tại Hasaki."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (7, 2, N'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60ml', 35, 367000, N'kd2.jpg', N'Kem Dưỡng Ẩm, Làm Dịu Da Ban Đêm Midnight Blue Calming Cream là kem dưỡng dành cho da nhạy cảm đến từ thương hiệu Dear, Klairs trực thuộc By Wishtrend. Với thành phần Guaiazulene được chiết xuất từ dầu hoa cúc tạo màu xanh dịu mát tự nhiên, giúp làm dịu da kích ứng vô cùng hiệu quả, kết hợp cùng chiết xuất rau má cấp ẩm, làm dịu da và hỗ trợ phục hồi da mụn rất tốt.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (8, 2, N'Kem Dưỡng Obagi Retinol 0.5% Ngăn Ngừa Lão Hoá Da 28g', 24, 1149000, N'kd3.jpg', N'"Obagi 360 Retinol Cream là sản phẩm kem dưỡng da trẻ hoá, ngừa mụn nổi tiếng từ thương hiệu dược mỹ phẩm Obagi Medical. Công thức với hàm lượng Retinol 0.5% / Retinol 1% hoạt động hiệu quả trên mọi làn da, đặc biệt là da dầu, giúp cải thiện các vấn đề về da như mụn, dầu thừa, lão hoá; mang đến cho bạn làn da mịn màng và tươi trẻ.

Retinol là một dạng dẫn xuất của vitamin A (Retinoid) nổi tiếng với khả năng ngừa lão hóa, làm trẻ hoá làn da và giảm mụn. Đây được xem là giải pháp lý tưởng dành cho những làn da nhăn nheo, sạm nám, kém sức sống do lão hóa và chịu tổn thương từ tác động môi trường.

Dòng sản phẩm kem dưỡng Obagi 360 Retinol chứa thành phần Retinol tinh khiết ở nồng độ tối ưu 0.5% - 1% có khả năng thúc đẩy tuần hoàn máu, tái tạo và sửa chữa tế bào bị oxy hóa, giúp làn da được cải thiện rõ rệt. Những nếp nhăn, dấu chân chim sẽ dần được lấp đầy và biến mất, mặt khác những đốm nâu li ti gây tối màu da cũng mờ đi để nhường chỗ cho làn da tươi sáng, đều màu và căng mịn."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (9, 2, N'Kem Dưỡng Ẩm Neutrogena Cấp Nước Cho Da Dầu 50g', 10, 259000, N'kd4.jpg', N'"Kem Dưỡng Ẩm Neutrogena Hydro Boost Water Gel 50g là kem dưỡng ẩm đến từ thương hiệu mỹ phẩm Neutrogena của Mỹ, bảo vệ độ ẩm cho da mạnh hơn 80% cùng với công thức 1% các yếu tố giữ ẩm tự nhiên chứa Hyaluronic Acid, Axit Amin và chất điện giải. Kết cấu nhẹ thích hợp sử dụng hàng ngày.

Với công thức chăm sóc da cải tiến và đã qua kiểm nghiệm da liễu, Kem Dưỡng Ẩm Neutrogena Hydro Boost Water Gel 50g giúp kích hoạt khả năng tiềm ẩn của làn da - tự sản sinh ra hàm lượng Hyaluronic Acid tự nhiên của hàng triệu tế bào da, từ đó mang lại độ ẩm dồi dào và dài lâu hơn, duy trì làn da thật ẩm mịn và căng mướt. Sản phẩm phù hợp cho cả nam lẫn nữ và đặc biệt lý tưởng cho làn da từ thường đến dầu, da đang gặp tình trạng thiếu nước.

 "')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (10, 2, N'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da 40ml', 8, 292000, N'kd5.jpg', N'Kem Dưỡng La Roche-Posay Cicaplast Baume B5 Soothing Repairing Balm là sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da. Sản phẩm được khuyên dùng sau các liệu trình điều trị thẩm mỹ & kích ứng da nhẹ ở người lớn, trẻ em và trẻ sơ sinh.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (11, 3, N'Gel Rửa Mặt Cosrx Tràm Trà, 0.5% BHA Có Độ pH Thấp 150ml', 31, 123000, N'srm1.jpg', N'"Gel Rửa Mặt Cosrx Tràm Trà, 0.5% BHA Có Độ pH Thấp là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Cosrx của Hàn Quốc, với độ pH lý tưởng 4.5 - 5.5 sản phẩm an toàn và dịu nhẹ trên mọi làn da ngay cả làn da nhạy cảm và da mụn. Gel rửa mặt chứa 0,5% BHA tự nhiên và chiết xuất tràm trà làm sạch sâu lỗ chân lông, hỗ trợ kháng khuẩn, làm sạch mụn đồng thời tẩy da chết nhẹ nhàng.

Hiện sản phẩm Gel Rửa Mặt Cosrx Low pH Good Morning Gel Cleanser đã có mặt tại Hasaki với 2 dung tích: 

20ml (HSD: 09/2023)

150ml  "')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (12, 3, N'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 400ml', 45, 476000, N'srm2.png', N'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (13, 3, N'Sữa Rửa Mặt Simple Giúp Da Sạch Thoáng 150ml', 50, 87000, N'srm3.jpg', N'Sữa Rửa Mặt Simple Refreshing Facial Wash là sản phẩm sữa rửa mặt dạng gel dành cho mọi loại da nổi tiếng của thương hiệu mỹ phẩm Simple. Với công thức dịu nhẹ không chứa xà phòng cùng thành phần Pro-Vitamin B5 và Vitamin E, sản phẩm giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác mà không gây kích ứng, cho da mềm mịn, đồng thời mang lại cảm giác tươi mát và sạch thoáng cho da.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (14, 3, N'Sữa Rửa Mặt Naruko Dạng Bùn Tràm Trà 120ml', 25, 165000, N'srm4.jpg', N'"Sữa Rửa Mặt NARUKO 120ml là dòng sản phẩm đến từ thương hiệu mỹ phẩm thiên nhiên NARUKO nổi tiếng của Đài Loan, giúp làm sạch sâu lỗ chân lông và loại bỏ các tạp chất tồn đọng trên da, đồng thời chăm sóc da mặt dịu nhẹ cùng các chiết xuất tự nhiên như Tràm Trà, Hoa Hồng Nhung Rừng, Bạch Ngọc Lan, Ý Dĩ Nhân Đỏ,... 

Hằng ngày da mặt chúng ta phải tiếp xúc nhiều với bụi bẩn, ít nhiều đã ảnh hưởng xấu đến da, khiến cho da trở nên nhờn bóng và kém sạch. Bụi bẩn còn khiến cho da chúng ta nhiều mụn hơn. Vì thế, việc giúp da sạch sẽ và thông thoáng hơn với sữa rửa mặt hàng ngày việc không thể gác bỏ được nhé. Là dòng sữa rửa mặt có các thành phần tự nhiên chứa nhiều vitamin và dưỡng chất tốt cho da, Sữa Rửa Mặt NARUKO 120ml bao gồm nhiều loại sữa rửa mặt khác nhau sẽ không chỉ giúp làm sạch được bụi bẩn và tẩy được tế bào da chết mà còn cung cấp thêm dưỡng chất giúp hỗ trợ tái tạo, hỗ trợ làm chậm tiến trình lão hóa và chăm sóc da hiệu quả. Sản phẩm hiện đã có mặt tại Hasaki với các phân loại sau cho bạn lựa chọn:

Tea Tree Purifying Clay Mask & Cleanser In 1 - sữa rửa mặt và mặt nạ 2 trong 1 dạng bùn chiết xuất Tràm Trà, thích hợp cho làn da dầu & mụn.

Rose & Botanic HA Aqua Cubic Foaming Wash EX - sữa rửa mặt cấp ẩm cho da chiết xuất Hoa Hồng Nhung Rừng, thích hợp cho làn da khô, thiếu nước.

Magnolia Brightening And Firming Cream Wash EX - sữa rửa mặt làm sáng, tăng độ đàn hồi chiết xuất Bạch Ngọc Lan, thích hợp cho làn da xỉn màu, có dấu hiệu lão hóa.

Raw Jobs Tears Supercritical CO2 Pore Minimizing & Brightening Foaming Wash - sữa rửa mặt làm sáng, se lỗ chân lông chiết xuất Ý Dĩ Nhân Đỏ, thích hợp cho làn da xỉn màu, lỗ chân lông to."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (15, 3, N'Bộ Đôi La Roche-Posay Giảm Mụn Và Ngừa Thâm Trong 12H', 23, 359000, N'srm5.jpg', N'"Bộ Đôi La Roche-Posay Giảm Mụn Và Ngừa Thâm Trong 12H bao gồm 2 món:

01 x Kem dưỡng giảm mụn, ngăn ngừa vết thâm và ngăn mụn tái phát La Roche-Posay Effaclar Duo+ 40ml

01 x Gel rửa mặt tạo bọt làm sạch & giảm nhờn cho da dầu nhạy cảm La Roche-Posay Effaclar Purifying Foaming Gel 50ml"')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (16, 4, N'Dầu Dưỡng Tóc LOreal Tinh Dầu Hoa Tự Nhiên 100ml', 30, 195000, N'dt1.jpg', N'"Hasaki hiện đang có 2 loại Dầu Dưỡng Tóc LOreal Paris Elseve Extraodinary Oil cho bạn lựa chọn:

Dầu Dưỡng Tóc LOreal Tinh Dầu Hoa Tự Nhiên 100ml - Elseve Extraordinary Oil Serum With 6 Precious Floral Oil

Dầu Dưỡng Tóc L’Oréal Chiết Xuất Hoa Hồng 100ml - Elseve Extraordinary Oil Serum With French Rose Oil

1. Dầu Dưỡng Tóc LOreal Tinh Dầu Hoa Tự Nhiên
Dầu Dưỡng Chiết Xuất Tinh Dầu Hoa Tự Nhiên LOreal Paris Elseve Extraodinary Oil là sản phẩm dầu dưỡng tóc đến từ thương hiệu mỹ phẩm LOreal Paris của Pháp, với thành phần được chiết xuất từ 6 loại hoa thiên nhiên giúp nuôi dưỡng mái tóc từ sâu bên trong, cho tóc suôn mượt, mềm mại, chắc khỏe. Sản phẩm có hương thơm dịu nhẹ của các loài hoa thiên nhiên sẽ tạo cho bạn cảm giác thư giãn. Thành phần an toàn, không gây kích ứng da đầu."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (17, 4, N'Serum LOréal Professionnel Kích Thích Mọc Tóc 90ml', 12, 1270000, N'dt2.jpg', N'"Tinh Chất LOréal Professionnel Kích Thích Mọc Tóc 90ml là dòng tinh chất chăm sóc tóc đến từ thương hiệu mỹ phẩm cao cấp LOréal Professionnel trực thuộc tập đoàn L’Oréal Việt Nam, với phân tử kích thích tóc mọc độc quyền Stemoxydine giúp mọc 1000 sợi tóc chỉ sau 6 tuần sử dụng, nuôi dưỡng nang tóc khỏe mạnh hỗ trợ mọc tóc nhanh chóng, mang đến mái tóc chắc khỏe, bồng bềnh.

Hiện sản phẩm Tinh Chất LOréal Professionnel Kích Thích Mọc Tóc 90ml đã có mặt tại Hasaki."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (18, 4, N'Serum Dưỡng Tóc TRESemmé Vào Nếp Bóng Mượt 97ml', 25, 134000, N'dt3.jpg', N'"Tóc bạn không còn suôn mượt vào nếp sau cả ngày dài hay dù có thử mọi cách nhưng cũng không thể đẹp như ở salon? Bí quyết của chuyên gia cho mái tóc được giữ vào nếp bóng mượt dài lâu như ở salon chính là luôn kết thúc bằng vài giọt serum dưỡng tóc! Tuy nhiên, thay vì phải ra salon thường xuyên mất nhiều thời gian và chi phí, TRESemmé đem lại cho bạn bí quyết xịt dưỡng tóc từ các chuyên gia tạo mẫu tóc trên thế giới, cho mái tóc của bạn đẹp chuẩn salon ngay tại nhà với SERUM DƯỠNG TÓC BÓNG MƯỢT TRESEMMÉ KERATIN SMOOTH!

Serum Dưỡng Tóc TRESemmé Keratin Smooth Shine Serum với 5 công dụng tuyệt vời trong cùng bộ sản phẩm: giúp tóc vào nếp, bóng mượt, mềm mại, giảm xơ và gỡ rối sẽ mang lại cho bạn mái tóc đẹp chuẩn sàn diễn mỗi ngày. Công thức chứa Tinh dầu dưỡng tóc Marula cùng dưỡng chất Keratin được các chuyên gia tin dùng trong việc tạo kiểu bởi khả năng giúp tóc vào nếp nhanh chóng, kết hợp với công nghệ chuyên sâu Pro Technology System cung cấp dưỡng chất chuyên biệt cho tóc mềm mại bóng mượt đến 72H.

Các chuyên gia khuyên dùng kết hợp trọn bộ sản phẩm TREsemme để mang lại hiệu quả cao nhất."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (19, 4, N'Nước Xịt Dưỡng Tóc Double Rich Cho Tóc Khô Xơ, Hư Tổn 250ml', 45, 60000, N'dt4.png', N'"Nước Dưỡng Tóc Double Rich Balancing Water là dòng sản phẩm xịt dưỡng tóc công thức mới cải tiến đến từ Double Rich - thương hiệu chăm sóc tóc được tin dùng tại thị trường Việt Nam hơn 19 năm. Sản phẩm giúp nuôi dưỡng cho mái tóc mềm mượt và bóng khỏe, bảo vệ tóc khỏi chẻ ngọn do tác động bởi nhiệt độ cao / tia UV.

Dòng sản phẩm bao gồm 2 phân loại cho bạn lựa chọn, hiện đã có mặt tại Hasaki:

Double Rich Balancing Water Double Repair UV Protection (Pink): nước dưỡng tóc chăm sóc tóc khô xơ và hư tổn.

Double Rich Balancing Water Extra Double Repair Color Protection (Gold): nước dưỡng tóc chăm sóc tóc chuyên sâu dành cho tóc nhuộm."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (20, 4, N'Serum Dưỡng Tóc Ellips Vitamin Phục Hồi Hư Tổn Hũ 50 viên', 33, 193000, N'dt5.jpg', N'"Serum Dưỡng Tóc Ellips Hair Vitamin Moroccan Oil là sản phẩm dầu dưỡng tóc dạng viên độc đáo đến từ thương hiệu chăm sóc tóc Ellips của Indonesia. Công thức chứa hàm lượng dồi dào các dưỡng chất có lợi như Vitamin A,C,E, & Pro Vit B-5 cùng tinh dầu Moroccan Oil quý giá, giúp nuôi dưỡng cho mái tóc thật khoẻ mạnh và bóng mượt, hỗ trợ giảm thiểu các tổn thương gây ra do tác động của nhiệt độ cao.

Tinh dầu Moroccan Oil còn được gọi là tinh dầu Argan, là một loại dầu tự nhiên có nguồn gốc từ vương quốc Morocco thuộc vùng Bắc Phi. Tinh dầu Argan chứa hàm lượng dồi dào các vitamin và chất chống oxy hóa, là một bí mật làm đẹp cổ truyền của người dân địa phương. Tinh dầu Moroccan oil được biết đến nhiều nhất với công dụng cải thiện mái tóc hư tổn, khô xơ và chẻ ngọn. Vì thế, hãy giữ cho mái tóc của bạn được nuôi dưỡng và sáng bóng với dòng sản phẩm Ellips Hair Vitamin Moroccan Oil bạn nhé!"')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (21, 5, N'Son Lì Shu Uemura Matte OR570 Màu Đỏ Cam 3g', 20, 575000, N's1.jpg', N'Son Lì Shu Uemura Rouge Unlimited Matte 3g từ thương hiệu Shu Uemura của Nhật Bản là dòng son trang điểm môi cao cấp với sự kết hợp hoàn mỹ giữa chất son lì thượng hạng và kết cấu mịn nhẹ như nhung, cho sắc son được bền màu mà vẫn duy trì cảm giác thoải mái, nhẹ nhàng suốt ngày dài. Đặc biệt, công nghệ khuếch tán hạt sắc tố màu mang lại màu sắc thuần túy, cho đôi môi bùng nổ màu sắc đầy cá tính khiến các nàng không khỏi ngất ngây.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (22, 5, N'Son Thỏi Lì 3CE Vỏ Trong Suốt Red Muse - Đỏ Tươi 3.5g', 15, 304000, N's2.jpg', N'Son Thỏi Lì 3CE Vỏ Trong Suốt 3.5g là sản phẩm son môi đến từ thương hiệu mỹ phẩm 3CE của Hàn Quốc, kết cấu son mềm mại và nhẹ môi cùng sắc tố cao giúp lên màu chuẩn sắc ngay từ lần đầu tiên. Sản phẩm với thiết kế vỏ trong suốt độc đáo, lạ mắt và ấn tượng giúp bạn quan sát được màu son bên trong.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (23, 5, N'Son Lì Maybelline Mịn Môi Siêu Nhẹ 799 Cam Ngả Đất 1.7g', 20, 172000, N's3.jpg', N'"Son Lì Mịn Môi Siêu Nhẹ Maybelline Color Sensational Ultimatte là dòng son lì cao cấp mới nhất từ thương hiệu Maybelline New York, cho bạn 3 tính năng vượt trội ""Mịn - Mờ - Nhẹ tênh"". Với công nghệ làm mờ rãnh môi mang đến lớp finish mịn mờ sang trọng kết hợp công nghệ ultrafine powder cho son mịn lì nhẹ tênh. Thiết kế đầu son hình giọt sương nhỏ giúp son dễ dàng lướt nhẹ và chuẩn màu trên môi bạn. Đặc biệt, vỏ son “mảnh mai thon gọn” cùng màu sắc bắt mắt, khơi gợi hơi thở sang trọng, thời thượng và trẻ trung.

"')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (24, 5, N'Son Lì Shu Uemura Matte CR342 Màu Cam Hồng San Hô 3g', 27, 668000, N's4.jpg', N'Son Lì Shu Uemura Rouge Unlimited Matte 3g từ thương hiệu Shu Uemura của Nhật Bản là dòng son trang điểm môi cao cấp với sự kết hợp hoàn mỹ giữa chất son lì thượng hạng và kết cấu mịn nhẹ như nhung, cho sắc son được bền màu mà vẫn duy trì cảm giác thoải mái, nhẹ nhàng suốt ngày dài. Đặc biệt, công nghệ khuếch tán hạt sắc tố màu mang lại màu sắc thuần túy, cho đôi môi bùng nổ màu sắc đầy cá tính khiến các nàng không khỏi ngất ngây.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (25, 5, N'Son Thỏi Lì 3CE 227 Benchmark - Cam Đỏ Cháy 3.5g', 30, 303000, N's5.jpg', N'Son Thỏi Lì 3CE Matte Lip Color 3.5g là sản phẩm son môi đến từ thương hiệu mỹ phẩm 3CE của Hàn Quốc, kết cấu son mềm mại, mỏng mịn, độ lên màu chuẩn và bám chặt vào môi, lưu giữ màu son trong nhiều giờ. Sản phẩm với thiết kế vỏ màu gold rose sang trọng và thời thượng.')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (26, 6, N'Sữa Tắm Hatomugi Chiết Xuất Ý Dĩ Làm Sáng Da 800ml', 60, 85000, N'st1.jpg', N'"Sữa Tắm Hatomugi Dưỡng Sáng Da 800g đến từ thương hiệu HATOMUGI thường xuyên lọt vào top sữa tắm được yêu thích của các tạp chí làm đẹp hàng đầu tại Nhật, với thành phần chiết xuất hạt ý dĩ giàu dưỡng chất, không chỉ giúp làm sạch da mà còn dưỡng ẩm cho da, nuôi dưỡng cho làn da sáng mịn từ bên trong.

Hiện sản phẩm Sữa Tắm Hatomugi Moisturizing & Washing 800ml đã có mặt tại Hasaki."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (27, 6, N'Sữa Tắm Nước Hoa Tesori dOriente Hương Hoa Sen 500ml', 20, 219000, N'st2.png', N'"Sữa Tắm Nước Hoa Tesori dOriente là sản phẩm sữa tắm đến từ thương hiệu Tesori dOriente của Ý, với các thành phần từ thiên nhiên có khả năng làm sạch bụi bẩn, loại bỏ dầu thừa, bã nhờn và dưỡng da ẩm mịn, mềm mại. Đặc biệt sữa tắm nước hoa Tesori dOriente được nhập khẩu từ Ý nổi tiếng với hương thơm đa dạng và lưu giữ lâu đến 8 tiếng trên da giúp bạn tự tin suốt cả ngày.

Hiện sản phẩm Sữa Tắm Tesori dOriente 300g đã có mặt tại Hasaki với 6 mùi hương và 2 dung tích:

Sữa Tắm Nước Hoa Tesori dOriente Hương Hoa Sen 250ml; 500ml: Hương thơm ngọt ngào, nữ tính.

Sữa Tắm Nước Hoa Tesori Doriente Hy Lạp Cổ Đại 250ml; 500ml: Hương thơm quyến rũ, ngọt ngào.

Sữa Tắm Nước Hoa Tesori Doriente Hoàng Gia Yemen 250ml: Hương thơm thư giãn, sang trọng.

Sữa Tắm Nước Hoa Tesori Doriente Hương Thanh Long 250ml; 500ml: Hương thơm gợi cảm, quyến rũ.

Sữa Tắm Nước Hoa Tesori dOriente Thảo Mộc Ai Cập 250ml: Hương thơm huyền bí, hấp dẫn.

Sữa Tắm Nước Hoa Tesori dOriente Hương Ayurveda 250ml; 500ml: Hương thơm tươi mát, thư giãn.

Sữa Tắm Nước Hoa Tesori dOriente Tinh Dầu Macca 500ml: Hương thơm ngọt ngào mềm mại, nơi trái tim gừng cay nhẹ được sưởi ấm bởi hương thơm quyến rũ của Vani."')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (28, 6, N'Sữa Tắm Gội Cetaphil Dịu Lành Cho Bé 400ml', 30, 249000, N'st3.jpg', N'"Sữa tắm gội dịu nhẹ Cetaphil Baby Wash & Shampoo with Organic Calendula là sản phẩm tắm gội 2 trong 1 cho bé thuộc thương hiệu Cetaphil, giúp nâng niu làn da nhạy cảm của bé. Công thức không gây cay mắt bé, giúp chăm sóc và làm sạch làn da mỏng manh của trẻ sơ sinh từ tóc đến toàn thân, đồng thời giúp duy trì độ ẩm cho da bé đến 8h và bảo vệ da hàng ngày, giúp cho da bé phát triển khỏe mạnh.

Với chiết xuất từ hoa cúc Calendula hữu cơ lành tính, sữa tắm gội Cetaphil Baby Wash & Shampoo with Organic Calendula sẽ giúp làm dịu, dưỡng ẩm & làm mềm làn da nhạy cảm của bé, kết hợp với các thành phần dịu lành như hạnh nhân, bơ hạt mỡ, sản phẩm còn giúp bạn bảo vệ da em bé với 5 điều dịu lành: lành tính, mềm mịn, giữ ẩm, không gây kích ứng và che chở màn ẩm tự nhiên. Sản phẩm đã được chứng minh lâm sàng là dịu nhẹ với làn da nhạy cảm & được tin dùng bởi các bác sĩ da liễu.

Hiện sản phẩm Sữa Tắm Và Gội Cetaphil Baby Wash & Shampoo Calendula đã có mặt tại Hasaki với 3 dung tích:

50ml

230ml

400ml"')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (29, 6, N'Sữa Tắm St.Ives Dưỡng Ẩm Da Yến Mạch & Bơ Hạt Mỡ 650ml', 15, 165000, N'st4.jpg', N'"Sữa Tắm St.Ives Dưỡng Da Body Wash là dòng sữa tắm đến từ thương hiệu chăm sóc da St.Ives nổi tiếng xuất xứ từ Mỹ, với thành phần chiết xuất từ thiên nhiên giúp làm sạch bụi bẩn, nhẹ nhàng lấy đi tế bào chết đồng thời bổ sung các dưỡng chất dưỡng ẩm làm mềm mịn da. Ngoài ra, mỗi sản phẩm với các thành phần tự nhiên khác nhau mang lại hương thơm riêng biệt phù hợp cho mọi đối tượng.

Hiện sản phẩm Sữa Tắm St.Ives Dưỡng Da đã có mặt tại Hasaki với 5 loại và 2 dung tích khác nhau:

Sữa Tắm St.Ives Chiết Xuất Cam Chanh Làm Sáng Da: 473ml; 650ml

Sữa Tắm St.Ives Yến Mạch & Bơ Hạt Mỡ Dưỡng Ẩm Da: 473ml; 650ml

Sữa Tắm St.Ives Chiết Xuất Muối Biển Làm Sạch Sâu: 473ml; 650ml

Sữa Tắm St.Ives Chiết Xuất Mơ Tẩy Tế Bào Chết: 473ml 

Sữa Tắm St.Ives Chiết Xuất Hoa Hồng & Lô Hội Tươi Mới Da: 650ml"')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [Price], [Image], [Description]) VALUES (30, 6, N'Sữa Tắm Some By Mi AHA-BHA-PHA Làm Giảm Mụn 400g', 15, 257000, N'st5.jpg', N'"Sữa Tắm Some By Mi Làm Giảm Mụn AHA-BHA-PHA 400g là dòng sữa tắm đến từ thương hiệu Some By Mi của Hàn Quốc, chứa thành phần AHA, BHA, PHA giúp làm sạch lỗ chân lông và kiểm soát dầu cùng với chiết xuất từ tràm trà, bạch đàn giúp ngăn ngừa và cải thiện tình trạng mụn xuất hiện trên các vùng cơ thể. 

Hiện sản phẩm Sữa Tắm Some By Mi AHA-BHA-PHA 30 Days Miracle Acne Clear Body Cleanser 400g đã có mặt tại Hasaki."')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeUser] ON 

INSERT [dbo].[TypeUser] ([TypeUserID], [Description]) VALUES (1, N'Quản trị viên')
INSERT [dbo].[TypeUser] ([TypeUserID], [Description]) VALUES (2, N'Nhân viên bán hàng')
INSERT [dbo].[TypeUser] ([TypeUserID], [Description]) VALUES (3, N'Khách hàng')
SET IDENTITY_INSERT [dbo].[TypeUser] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [TypeUserID], [Username], [Password], [CreatedDate]) VALUES (1, 1, N'admin', N'123', CAST(N'2023-04-21' AS Date))
INSERT [dbo].[User] ([UserID], [TypeUserID], [Username], [Password], [CreatedDate]) VALUES (2, 2, N'robot', N'1', CAST(N'2023-04-21' AS Date))
INSERT [dbo].[User] ([UserID], [TypeUserID], [Username], [Password], [CreatedDate]) VALUES (3, 2, N'bnt', N'1', CAST(N'2023-04-21' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [UQ__Customer__1788CCADCF0CDFD3]    Script Date: 04/22/2023 17:46:24 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Employee__1788CCAD70B75DE4]    Script Date: 04/22/2023 17:46:24 ******/
ALTER TABLE [dbo].[Employee] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E40ED703EC]    Script Date: 04/22/2023 17:46:24 ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [Birthday]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [TotalMoney]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((1)) FOR [SellNumber]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [ShippingCost]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Receipt] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Receipt] ADD  DEFAULT ((0)) FOR [TotalMoney]
GO
ALTER TABLE [dbo].[ReceiptDetail] ADD  DEFAULT ((1)) FOR [SellNumber]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_customer_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_customer_user]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_employee_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fk_employee_user]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [fk_feedback_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [fk_feedback_user]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_order_customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_order_customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_order_employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_order_employee]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_product_category]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [fk_receipt_employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [fk_receipt_employee]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [fk_receipt_provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [fk_receipt_provider]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [fk_receiptdetail_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [fk_receiptdetail_product]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [fk_receiptdetail_receipt] FOREIGN KEY([ReceiptID])
REFERENCES [dbo].[Receipt] ([ReceiptID])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [fk_receiptdetail_receipt]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [fk_user_typeuser] FOREIGN KEY([TypeUserID])
REFERENCES [dbo].[TypeUser] ([TypeUserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [fk_user_typeuser]
GO
USE [master]
GO
ALTER DATABASE [ShopBanMyPham] SET  READ_WRITE 
GO
