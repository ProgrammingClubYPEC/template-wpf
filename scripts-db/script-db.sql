GO
/****** Object:  Table [dbo].[login]    Script Date: 03.12.2021 11:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 03.12.2021 11:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[login] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](300) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[midname] [nvarchar](300) NULL,
	[bithday] [datetime] NULL,
	[code_role] [bigint] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_confidential_data]    Script Date: 03.12.2021 11:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_confidential_data](
	[login] [nvarchar](50) NOT NULL,
	[passport_series] [int] NOT NULL,
	[passport_id] [int] NOT NULL,
	[insurance_policy_number] [nvarchar](300) NOT NULL,
	[insurance_policy_type] [nvarchar](300) NOT NULL,
	[insurance_company_code] [bigint] NOT NULL,
 CONSTRAINT [PK_user_confidential_data] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_contact]    Script Date: 03.12.2021 11:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_contact](
	[login] [nvarchar](50) NOT NULL,
	[phone] [nchar](30) NULL,
	[email] [nvarchar](100) NULL,
 CONSTRAINT [PK_user_contact] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 03.12.2021 11:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[code_role] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED 
(
	[code_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friendship]    Script Date: 03.12.2021 11:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friendship](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[login_sender] [nvarchar](50) NOT NULL,
	[login_recirver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_friendship] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_login] FOREIGN KEY([login])
REFERENCES [dbo].[login] ([login])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_login]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_user_role] FOREIGN KEY([code_role])
REFERENCES [dbo].[user_role] ([code_role])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_user_role]
GO
ALTER TABLE [dbo].[user_confidential_data]  WITH CHECK ADD  CONSTRAINT [FK_user_confidential_data_user] FOREIGN KEY([login])
REFERENCES [dbo].[user] ([login])
GO
ALTER TABLE [dbo].[user_confidential_data] CHECK CONSTRAINT [FK_user_confidential_data_user]
GO
ALTER TABLE [dbo].[user_contact]  WITH CHECK ADD  CONSTRAINT [FK_user_contact_user] FOREIGN KEY([login])
REFERENCES [dbo].[user] ([login])
GO
ALTER TABLE [dbo].[user_contact] CHECK CONSTRAINT [FK_user_contact_user]
GO
ALTER TABLE [dbo].[friendship]  WITH CHECK ADD  CONSTRAINT [FK_friendship_contact_user_sender] FOREIGN KEY([login_sender])
REFERENCES [dbo].[user] ([login])
GO
ALTER TABLE [dbo].[friendship]  WITH CHECK ADD  CONSTRAINT [FK_friendship_contact_user_recirver] FOREIGN KEY([login_recirver])
REFERENCES [dbo].[user] ([login])
GO