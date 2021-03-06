USE [BT_DB]
GO
/****** Object:  Table [dbo].[bt_account_type]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_account_type](
	[type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NULL,
	[type_description] [varchar](200) NULL,
 CONSTRAINT [PK_bt_account_type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bt_b_transactions]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_b_transactions](
	[transaction_id] [decimal](28, 0) IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NULL,
	[txn_amount] [decimal](18, 2) NULL,
	[txn_date_time] [datetime] NULL,
	[txn_status] [tinyint] NULL,
	[txn_lock_datetime] [datetime] NULL,
	[challenge_id] [bigint] NULL,
 CONSTRAINT [PK_bt_b_transactions] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bt_challengers]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_challengers](
	[challenger_id] [bigint] IDENTITY(1,1) NOT NULL,
	[challenger_name] [varchar](100) NULL,
	[challenger_desc] [varchar](150) NULL,
	[challeger_image_path] [varchar](50) NULL,
	[challenge_id] [bigint] NULL,
	[created_on] [datetime] NULL,
	[created_by] [datetime] NULL,
	[updated_on] [datetime] NULL,
	[updated_by] [datetime] NULL,
 CONSTRAINT [PK_bt_challengers] PRIMARY KEY CLUSTERED 
(
	[challenger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bt_trd_transactions]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_trd_transactions](
	[transaction_id] [decimal](28, 0) NULL,
	[account_id] [bigint] NULL,
	[txn_amount] [decimal](18, 2) NULL,
	[txt_date_time] [datetime] NULL,
	[txt_status] [tinyint] NULL,
	[txn_lock_datetime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bt_user_account]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_user_account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[account_type] [int] NULL,
	[account_type_info] [varchar](150) NULL,
	[main_balance] [decimal](10, 2) NULL,
	[pending_balance] [decimal](10, 2) NULL,
	[currency_type] [nchar](10) NULL,
 CONSTRAINT [PK_bt_user_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bt_users]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bt_users](
	[user_id] [uniqueidentifier] NOT NULL,
	[user_name] [varchar](50) NULL,
	[pwd_hash] [varchar](100) NULL,
	[email_address] [varchar](100) NULL,
	[is_email_confirmed] [bit] NULL,
	[date_created] [datetime] NULL,
	[date_updated] [datetime] NULL,
	[profile_photo] [varchar](150) NULL,
	[is_active] [bit] NULL,
	[warning_level] [int] NULL,
	[full_name] [varchar](50) NULL,
	[date_of_birth] [datetime] NULL,
 CONSTRAINT [PK_bt_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[challenges]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[challenges](
	[challege_id] [bigint] IDENTITY(1,1) NOT NULL,
	[challenge_name] [nchar](10) NULL,
	[is_one_v_one] [bit] NULL,
	[is_completed] [bit] NULL,
	[created_on] [datetime] NULL,
	[updated_on] [datetime] NULL,
	[created_by] [datetime] NULL,
	[updated_by] [datetime] NULL,
 CONSTRAINT [PK_challenges] PRIMARY KEY CLUSTERED 
(
	[challege_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bt_account_type] ON 

INSERT [dbo].[bt_account_type] ([type_id], [type_name], [type_description]) VALUES (1, N'Real Account', N'Main Account with real money')
INSERT [dbo].[bt_account_type] ([type_id], [type_name], [type_description]) VALUES (2, N'Demo Account', N'Demo Account of practice')
SET IDENTITY_INSERT [dbo].[bt_account_type] OFF
ALTER TABLE [dbo].[bt_challengers]  WITH CHECK ADD  CONSTRAINT [FK_bt_challengers_challenges] FOREIGN KEY([challenge_id])
REFERENCES [dbo].[challenges] ([challege_id])
GO
ALTER TABLE [dbo].[bt_challengers] CHECK CONSTRAINT [FK_bt_challengers_challenges]
GO
/****** Object:  StoredProcedure [dbo].[PlaceBet]    Script Date: 10/28/2020 10:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PlaceBet]
	@user_id varchar(40),
	@account_type int,
	@challenge_id bigint,
	@challenger_id bigint,
	@bet_amount DECIMAL(18,2)
AS
BEGIN	
	SET NOCOUNT ON;
	DECLARE @account_id BIGINT;
	--STEP-1: 
	
	SET @account_id=(SELECT account_id FROM bt_user_account WHERE user_id=@user_id AND account_type=@account_type)

	--STEP-2: Insert data in transaction table.
	INSERT INTO bt_b_transactions
                         (account_id, txn_amount, txn_date_time, txn_status, txn_lock_datetime, challenge_id)
VALUES        (@account_id,@bet_amount, GETUTCDATE(), 1,NULL,@challenge_id)

	--STEP-3: Log if there is any kind of error.
	
END
GO
