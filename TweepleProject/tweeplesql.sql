USE [master]
GO
/****** Object:  Database [Tweeple]    Script Date: 07/20/2016 17:17:21 ******/
CREATE DATABASE [Tweeple] ON  PRIMARY 
( NAME = N'Tweeple', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Tweeple.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tweeple_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Tweeple_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tweeple] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tweeple].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tweeple] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Tweeple] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Tweeple] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Tweeple] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Tweeple] SET ARITHABORT OFF
GO
ALTER DATABASE [Tweeple] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Tweeple] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Tweeple] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Tweeple] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Tweeple] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Tweeple] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Tweeple] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Tweeple] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Tweeple] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Tweeple] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Tweeple] SET  DISABLE_BROKER
GO
ALTER DATABASE [Tweeple] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Tweeple] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Tweeple] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Tweeple] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Tweeple] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Tweeple] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Tweeple] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Tweeple] SET  READ_WRITE
GO
ALTER DATABASE [Tweeple] SET RECOVERY FULL
GO
ALTER DATABASE [Tweeple] SET  MULTI_USER
GO
ALTER DATABASE [Tweeple] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Tweeple] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tweeple', N'ON'
GO
USE [Tweeple]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 07/20/2016 17:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[user_id] [varchar](25) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[MobileNo] [varchar](30) NULL,
	[joined] [datetime] NULL,
	[active] [bit] NOT NULL,
	[UserImage] [varbinary](max) NULL,
 CONSTRAINT [cnpk] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tweet]    Script Date: 07/20/2016 17:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tweet](
	[Tweet_Id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](25) NULL,
	[Message] [varchar](130) NOT NULL,
	[Created] [datetime] NULL,
	[TweepleImage] [varbinary](max) NULL,
	[TweetDate] [datetime] NULL,
 CONSTRAINT [pk_tweetid] PRIMARY KEY CLUSTERED 
(
	[Tweet_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_update]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_update]
@user varchar(50),
@password varchar(50),
@email varchar(50),
@mobileno varchar(50),
@uimage varbinary(max)
AS
BEGIN
update UserDetail set 
password=@password, Email=@email,MobileNo=@mobileno,UserImage=@uimage where user_id=@user;
END
GO
/****** Object:  Table [dbo].[Following]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Following](
	[user_id] [varchar](25) NULL,
	[following_id] [varchar](25) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[insertSignUpData]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertSignUpData] @userid varchar(25),@psw varchar(50),@frstname varchar(30),@lstname varchar(30),@email varchar(50),@city varchar(30),
@mobileno varchar(30)
as
begin
insert into UserDetail([user_id],[password],FirstName,LastName,Email,City,MobileNo)
values(@userid,@psw,@frstname,@lstname,@email,@city,@mobileno)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_deactivate]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_deactivate]
@user varchar(30)
as
begin
update UserDetail set active = 0 where user_id=@user;
end
GO
/****** Object:  StoredProcedure [dbo].[insertTweet]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertTweet] @user_id varchar(25),@Message varchar(130)
as
begin
insert into Tweet([user_id],[Message])
values
(@user_id,@Message);
end
GO
/****** Object:  StoredProcedure [dbo].[followingProcedure]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[followingProcedure] @userid varchar(25),@followingid varchar(25)
as
begin
insert into Following([user_id] ,following_id)
values(@userid,@followingid)
end
GO
/****** Object:  StoredProcedure [dbo].[findSuggestion]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[findSuggestion] @asd varchar(20)
as
 begin
select * from UserDetail where [user_id] 
not in (select following_id from Following 
where [user_id]=@asd ) and [user_id] !=@asd and active=1
end
GO
/****** Object:  StoredProcedure [dbo].[findOutTweets]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[findOutTweets] @asd varchar(20)
as
begin
select * from Tweet where user_id in (select following_id from Following where [user_id]=@asd) or user_id=@asd
order by TweetDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[findFollowings]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[findFollowings] @asd varchar(20)
as 
begin
select * from (select following_id from Following where [user_id]=@asd) F join UserDetail U on  f.following_id=U.[user_id]
end
GO
/****** Object:  StoredProcedure [dbo].[findFollowers]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[findFollowers] @asd varchar(20)
as
begin
select * from UserDetail where user_id in (select user_id from Following WHERE following_id=@asd)
end
GO
/****** Object:  StoredProcedure [dbo].[countFollowers]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countFollowers] @asd varchar(20)
as 
begin
select Count(*) from Following WHERE following_id=@asd
end
GO
/****** Object:  StoredProcedure [dbo].[proc_unfollow]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_unfollow]
@user varchar(20),
@follow varchar(30)
as
begin
delete from Following where user_id=@user and following_id=@follow
end
GO
/****** Object:  StoredProcedure [dbo].[proc_search]    Script Date: 07/20/2016 17:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_search]
@user varchar(20),
@term varchar(20)
as 
begin
select * from UserDetail where user_id not in 
(select following_id from Following where user_id=@user) and user_id <> @user and FirstName like @term + '%'
end
GO
/****** Object:  Default [DF__UserDetai__joine__25869641]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[UserDetail] ADD  DEFAULT (sysdatetime()) FOR [joined]
GO
/****** Object:  Default [DF__UserDetai__activ__267ABA7A]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[UserDetail] ADD  DEFAULT ((1)) FOR [active]
GO
/****** Object:  Default [DF__UserDetai__UserI__276EDEB3]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[UserDetail] ADD  DEFAULT (NULL) FOR [UserImage]
GO
/****** Object:  Default [DF__Tweet__Created__31EC6D26]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[Tweet] ADD  DEFAULT (sysdatetime()) FOR [Created]
GO
/****** Object:  Default [DF__Tweet__TweepleIm__32E0915F]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[Tweet] ADD  DEFAULT (NULL) FOR [TweepleImage]
GO
/****** Object:  Default [DF__Tweet__TweetDate__4D94879B]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[Tweet] ADD  DEFAULT (getdate()) FOR [TweetDate]
GO
/****** Object:  Check [chk_Mobile]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [chk_Mobile] CHECK  (([MobileNo]>=(7000000000.) AND [MobileNo]<=(9999999999.)))
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [chk_Mobile]
GO
/****** Object:  ForeignKey [fk_tweetuserid]    Script Date: 07/20/2016 17:17:22 ******/
ALTER TABLE [dbo].[Tweet]  WITH CHECK ADD  CONSTRAINT [fk_tweetuserid] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserDetail] ([user_id])
GO
ALTER TABLE [dbo].[Tweet] CHECK CONSTRAINT [fk_tweetuserid]
GO
/****** Object:  ForeignKey [fk_followingid]    Script Date: 07/20/2016 17:17:24 ******/
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [fk_followingid] FOREIGN KEY([following_id])
REFERENCES [dbo].[UserDetail] ([user_id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [fk_followingid]
GO
/****** Object:  ForeignKey [fk_userid]    Script Date: 07/20/2016 17:17:24 ******/
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [fk_userid] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserDetail] ([user_id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [fk_userid]
GO
