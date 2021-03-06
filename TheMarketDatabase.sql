USE [master]
GO
/****** Object:  Database [TheMarket]    Script Date: 11/29/2020 9:08:23 PM ******/
CREATE DATABASE [TheMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TheMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TheMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TheMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheMarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [TheMarket] SET  MULTI_USER 
GO
ALTER DATABASE [TheMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheMarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TheMarket', N'ON'
GO
ALTER DATABASE [TheMarket] SET QUERY_STORE = OFF
GO
USE [TheMarket]
GO
/****** Object:  Table [dbo].[Categorie_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie_Detail](
	[CategorieID] [int] IDENTITY(1,1) NOT NULL,
	[CategorieName] [varchar](100) NULL,
	[CategorieType] [varchar](100) NULL,
	[IsAvilable] [bit] NULL,
	[CategoriPopularity] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_User_New2] PRIMARY KEY CLUSTERED 
(
	[CategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdList]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdList](
	[Last_Used_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategorieID] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[ProductType] [varchar](20) NULL,
	[ProductCategorie] [varchar](50) NULL,
	[UserId] [int] NULL,
	[IsAvailable] [bit] NULL,
	[ProductRiviews] [varchar](max) NULL,
	[ProductCost] [varchar](100) NULL,
	[IsNew] [bit] NULL,
	[AdditionalInformation] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedDate] [datetime] NULL,
	[ImageCount] [int] NULL,
	[Cart] [varchar](max) NULL,
	[ImageID] [int] NULL,
 CONSTRAINT [PK_User_New1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Detail](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[DealerId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](20) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[ZipId] [varchar](5) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](10) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](150) NULL,
	[UserTypeId] [smallint] NOT NULL,
	[DisableUser] [bit] NULL,
	[ReasonId] [smallint] NULL,
	[DateModify] [datetime] NULL,
	[StatusId] [smallint] NOT NULL,
	[Lastlogintime] [datetime] NULL,
	[IsActive] [bit] NULL,
	[BuyFlagsCount] [int] NULL,
	[SellFlagsCount] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Cart] [varchar](max) NULL,
	[Electronics] [int] NULL,
	[Sports] [int] NULL,
	[Appliances] [int] NULL,
	[Vehicles] [int] NULL,
	[Home] [int] NULL,
	[Clothing] [int] NULL,
	[Entertainment] [int] NULL,
	[Beauty] [int] NULL,
	[Outdoors] [int] NULL,
	[Suggested] [varchar](max) NULL,
 CONSTRAINT [PK_User_New6] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMissedProduct_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMissedProduct_Detail](
	[UniqueMissedId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CategorieId] [int] NULL,
	[Reason] [varchar](max) NULL,
	[PostUserId] [int] NULL,
	[BroughtUserId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsSuccess] [bit] NULL,
	[DealMissedDate] [datetime] NULL,
	[SuccessDate] [datetime] NULL,
 CONSTRAINT [PK_User_New4] PRIMARY KEY CLUSTERED 
(
	[UniqueMissedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSales_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSales_Detail](
	[UserSaleId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CategorieId] [int] NULL,
	[PostUserId] [int] NULL,
	[BroughtUserId] [int] NULL,
	[DealCost] [varchar](200) NULL,
	[IsSuccess] [bit] NULL,
	[ReasonforCancel] [varchar](max) NULL,
	[DealPlace] [varchar](max) NULL,
	[DealCreatedDate] [datetime] NULL,
	[CanceledDate] [datetime] NULL,
	[DealDoneDate] [datetime] NULL,
 CONSTRAINT [PK_User_New3] PRIMARY KEY CLUSTERED 
(
	[UserSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Get_Products]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE Procedure [dbo].[Get_Products]  

AS  
BEGIN  
  
Select  
	ProductID, 
	ProductName,
	ProductCategorie,
	UserId,
	ProductCost,
	AdditionalInformation,
	CreatedDate
  
      From Product_Detail 
  
END
GO
/****** Object:  StoredProcedure [dbo].[Get_User_detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE Procedure [dbo].[Get_User_detail]  
AS  
BEGIN  
  
Select  UserId, UserName,  
      DealerId,  
      FirstName,  
      MiddleName,  
      LastName,  
      Address,  
      ZipId,  
      City,  
      State,  
      Phone,  
      Email,  
      UserTypeId, 
	  Latitude,
	  Longitude,
      CreatedDate,
	  Cart,
	  Suggested
  
      From User_Detail  
  
END


  
GO
/****** Object:  StoredProcedure [dbo].[Insert_Update_Product_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Update_Product_Detail]  
(
  @ProductID int,   
  @ProductName varchar(100)='',  
  @ProductCategorie varchar(100)='',  
  @UserId int=0,  
  @ProductCost varchar(100)='',  
  @AdditionalInformation varchar(100)='',  
  @CreatedDate varchar(100)='',
  @ImageCount int=0,
  @ImageID int=0,
  @IsAvailable bit=true
  )
AS
BEGIN
	IF EXISTS (SELECT  1 from Product_Detail where ProductID=@ProductID)            
        BEGIN
	
	Update
	Product_Detail set ProductName= @ProductName,
	ProductCategorie = @ProductCategorie,
	ProductCost= @ProductCost,
	AdditionalInformation= @AdditionalInformation,
	CreatedDate = GETDATE(),
	ImageCount = @ImageCount,
	IsAvailable = @IsAvailable

	Where ProductID=@ProductID

	End
	Else
	Begin

	Insert into Product_Detail (
	ProductName,
	ProductCategorie,
	UserId,
	ProductCost,
	AdditionalInformation,
	CreatedDate,
	ImageCount,
	ImageID,
	IsAvailable

	)
	Values(
	@ProductName,
	@ProductCategorie,
	@UserId,
	@ProductCost,
	@AdditionalInformation,
	GETDATE(),
	@ImageCount,
	@ImageID,
	@IsAvailable
	)
	END

END

select top 10 * from Product_Detail order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[Insert_Update_User_Detail]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[Insert_Update_User_Detail]            
(            
  @UserId int,   
  @UserName varchar(100)='',  
  @Password varchar(100)='',  
  @DealerId int=0,  
  @FirstName varchar(100)='',  
  @MiddleName varchar(100)='',  
  @LastName varchar(100)='',  
  @Address varchar(100)='',  
  @ZipId varchar(5)='',  
  @City varchar(100)='',  
  @State varchar(10)='',  
  @Phone varchar(20)='',  
  @Email varchar(20)='',  
  @UserTypeId int=0,  
  @DisableUser bit=0,  
  @ReasonId int=0,  
  @StatusId int=0,  
  @IsActive bit=0,
  @Longitude varchar(50),
  @Latitude varchar(50),
  @Cart varchar(MAX),
  @Electronics int=0,
  @Sports int=0,
  @Appliances int=0,
  @Vehicles int=0,
  @Home int=0,
  @Clothing int=0,
  @Entertainment int=0,
  @Beauty int=0,
  @Outdoors int=0,
  @Suggested varchar(MAX)=''

)            
as             
begin            
    IF EXISTS (SELECT  1 from User_Detail where UserId=@UserId)            
        BEGIN            
            
    Update   
    User_Detail set UserName= @UserName,  
    Password=@Password,  
    DealerId = @DealerId,  
    FirstName=@FirstName,  
    MiddleName=@MiddleName,  
    LastName=@LastName,  
    Address= @Address,  
    ZipId=@ZipId,  
    City=@City,  
    State= @State,  
    Phone=@Phone,  
    Email=@Email,  
    UserTypeId=@UserTypeId,  
    DisableUser=@DisableUser,  
    ReasonId=@ReasonId,  
    DateModify= GETDATE(),  
    StatusId=@StatusId,  
    IsActive=@IsActive,  
	Longitude=@Longitude,
	Latitude=@Latitude,
	Cart=@Cart,
	Electronics=@Electronics,
	Sports=@Sports,
	Appliances=@Appliances,
	Vehicles=@Vehicles,
	Home=@Home,
	Clothing=@Clothing,
	Entertainment=@Entertainment,
	Beauty=@Beauty,
	Outdoors=@Outdoors,
	Suggested=@Suggested
      
    Where userid=@UserId  
   
        END            
    ELSE            
        BEGIN            
                 
      Insert into User_Detail (  
      UserName,  
      Password,  
      DealerId,  
      FirstName,  
      MiddleName,  
      LastName,  
      Address,  
      ZipId,  
      City,  
      State,  
      Phone,  
      Email,  
      UserTypeId,  
      DisableUser,  
      ReasonId,  
      StatusId,  
      IsActive,  
	  Longitude,
	  Latitude,
      CreatedDate,
	  Cart,
	  Electronics,
	  Sports,
	  Appliances,
	  Vehicles,
	  Home,
	  Clothing,
	  Entertainment,
	  Beauty,
	  Outdoors,
	  Suggested

      )  
      Values(  
        
      @UserName,  
      @Password,  
      @DealerId,  
      @FirstName,  
      @MiddleName,  
      @LastName,  
      @Address,  
      @ZipId,  
      @City,  
      @State,  
      @Phone,  
      @Email,  
      @UserTypeId,  
      @DisableUser,  
      @ReasonId,  
      @StatusId,  
      @IsActive,
	  @Longitude,
	  @Latitude,
      GETDATE(),
	  @Cart,
	  @Electronics,
	  @Sports,
	  @Appliances,
	  @Vehicles,
	  @Home,
	  @Clothing,
	  @Entertainment,
	  @Beauty,
	  @Outdoors,
	  @Suggested
      )  
        END            
end

select top 10 * from User_Detail order by 1 desc

--sp_helptext Verify_User_LoginDetails
--sp_helptext Get_User_detail

GO
/****** Object:  StoredProcedure [dbo].[Verify_User_LoginDetails]    Script Date: 11/29/2020 9:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE Procedure [dbo].[Verify_User_LoginDetails]  
(
@UserName varchar(100)='',  
@Password varchar(100)=''
  )
AS  
BEGIN  
  
Select  UserId, UserName,  
      DealerId,  
      FirstName,  
      MiddleName,  
      LastName,  
      Address,  
      ZipId,  
      City,  
      State,  
      Phone,  
      Email,  
      UserTypeId,  
      CreatedDate  
  
      From User_Detail where UserName=@UserName and Password=@Password
  
END
  
GO
USE [master]
GO
ALTER DATABASE [TheMarket] SET  READ_WRITE 
GO
