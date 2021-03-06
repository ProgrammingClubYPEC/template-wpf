USE [template-database]
GO
/****** Object:  Table [dbo].[friendship]    Script Date: 25.12.2021 16:45:12 ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 25.12.2021 16:45:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 25.12.2021 16:45:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_confidential_data]    Script Date: 25.12.2021 16:45:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_contact]    Script Date: 25.12.2021 16:45:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 25.12.2021 16:45:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'jrestill1', N'sjansik2')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'jrestill1', N'awhetton3')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'jrestill1', N'itemperley4')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'jrestill1', N'slisle5')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'jrestill1', N'ipetracek6')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'sjansik2', N'jrestill1')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'sjansik2', N'rgoodwins9')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'sjansik2', N'lflannigana')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'sjansik2', N'tcreddonb')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'sjansik2', N'thunnawillc')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'itemperley4')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'slisle5')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'ipetracek6')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'tbonnar7')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'acaurah8')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'lflannigana', N'rgoodwins9')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'ipetracek6')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'tbonnar7')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'acaurah8')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'rgoodwins9')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'lflannigana')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'tcreddonb')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'dwyvilld', N'thunnawillc')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'itemperley4', N'lflannigana')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'itemperley4', N'jrestill1')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'acaurah8', N'lflannigana')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'acaurah8', N'dwyvilld')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'tbonnar7', N'dwyvilld')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'tbonnar7', N'lflannigana')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'thunnawillc', N'dwyvilld')
INSERT [dbo].[friendship] ([login_sender], [login_recirver]) VALUES (N'thunnawillc', N'sjansik2')
GO
INSERT [dbo].[login] ([login], [password]) VALUES (N'acaurah8', N'z7c39bK')
INSERT [dbo].[login] ([login], [password]) VALUES (N'awhetton3', N'TKJnqj1PqT')
INSERT [dbo].[login] ([login], [password]) VALUES (N'dwyvilld', N'25OI9n')
INSERT [dbo].[login] ([login], [password]) VALUES (N'gdunkerly0', N'IGU2Q1qifXuf')
INSERT [dbo].[login] ([login], [password]) VALUES (N'ipetracek6', N'lsQzhOfw3')
INSERT [dbo].[login] ([login], [password]) VALUES (N'itemperley4', N'gt0FCfi')
INSERT [dbo].[login] ([login], [password]) VALUES (N'jrestill1', N'sqIBkp')
INSERT [dbo].[login] ([login], [password]) VALUES (N'lflannigana', N'WhmVUqH')
INSERT [dbo].[login] ([login], [password]) VALUES (N'rgoodwins9', N'LFDOoiJWa')
INSERT [dbo].[login] ([login], [password]) VALUES (N'sjansik2', N'cDS8tAke')
INSERT [dbo].[login] ([login], [password]) VALUES (N'slisle5', N'VBNKKHrdx')
INSERT [dbo].[login] ([login], [password]) VALUES (N'tbonnar7', N'UKkYVs')
INSERT [dbo].[login] ([login], [password]) VALUES (N'tcreddonb', N'3H2lFqg1TD')
INSERT [dbo].[login] ([login], [password]) VALUES (N'thunnawillc', N'qvKPlGtAV')
GO
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'acaurah8', N'Alexi', N'Caurah', NULL, CAST(N'1973-08-20T05:53:00.000' AS DateTime), 1)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'awhetton3', N'Analise', N'Whetton', NULL, CAST(N'1985-11-05T01:22:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'dwyvilld', N'Delora', N'Wyvill', NULL, CAST(N'1996-11-23T20:30:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'gdunkerly0', N'Glyn', N'Dunkerly', NULL, CAST(N'2047-04-22T04:17:00.000' AS DateTime), 1)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'ipetracek6', N'Ignacius', N'Petracek', NULL, CAST(N'1980-07-19T02:26:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'itemperley4', N'Ingra', N'Temperley', NULL, CAST(N'1954-08-24T19:14:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'jrestill1', N'Jeanne', N'Restill', NULL, CAST(N'1983-06-08T13:57:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'lflannigana', N'Lanna', N'Flannigan', NULL, CAST(N'1977-06-02T03:40:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'rgoodwins9', N'Roi', N'Goodwins', NULL, CAST(N'1952-06-01T12:40:00.000' AS DateTime), 1)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'sjansik2', N'Sibyl', N'Jansik', NULL, CAST(N'1999-07-26T06:32:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'slisle5', N'Sarine', N'Lisle', NULL, CAST(N'1956-02-02T07:37:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'tbonnar7', N'Talbert', N'Bonnar', NULL, CAST(N'2047-07-07T13:50:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'tcreddonb', N'Thorn', N'Creddon', NULL, CAST(N'1971-10-13T04:51:00.000' AS DateTime), 2)
INSERT [dbo].[user] ([login], [surname], [name], [midname], [bithday], [code_role]) VALUES (N'thunnawillc', N'Tracy', N'Hunnawill', NULL, CAST(N'1965-07-09T18:37:00.000' AS DateTime), 2)
GO
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'acaurah8', 6221, 854506, N'87971120', N'oms', 9)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'awhetton3', 4273, 568590, N'19655901', N'oms', 4)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'dwyvilld', 8679, 752088, N'95518385', N'oms', 14)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'gdunkerly0', 9091, 129038, N'93766273', N'oms', 1)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'ipetracek6', 7259, 742978, N'4936948', N'oms', 7)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'itemperley4', 8846, 364469, N'79494920', N'oms', 5)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'jrestill1', 4446, 615819, N'92610882', N'oms', 2)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'lflannigana', 3596, 609928, N'24833900', N'dms', 11)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'rgoodwins9', 2487, 888610, N'23339661', N'oms', 10)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'sjansik2', 4525, 970451, N'69326881', N'dms', 3)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'slisle5', 8593, 425286, N'18681906', N'dms', 6)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'tbonnar7', 2796, 776164, N'25625555', N'oms', 8)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'tcreddonb', 8249, 496591, N'27787565', N'oms', 12)
INSERT [dbo].[user_confidential_data] ([login], [passport_series], [passport_id], [insurance_policy_number], [insurance_policy_type], [insurance_company_code]) VALUES (N'thunnawillc', 6516, 163876, N'92825057', N'dms', 13)
GO
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'acaurah8', N'+234 (400) 963-5392           ', N'acaurah8@dagondesign.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'awhetton3', N'+51 (566) 226-0569            ', N'awhetton3@msn.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'dwyvilld', N'+46 (763) 475-5404            ', N'dwyvilld@unc.edu')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'gdunkerly0', N'+86 (106) 695-3205            ', N'gdunkerly0@ted.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'ipetracek6', N'+998 (712) 864-4246           ', N'ipetracek6@chronoengine.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'itemperley4', N'+46 (719) 769-5445            ', N'itemperley4@goo.ne.jp')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'jrestill1', N'+234 (336) 298-8675           ', N'jrestill1@feedburner.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'lflannigana', N'+57 (611) 136-1977            ', N'lflannigana@hexun.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'rgoodwins9', N'+52 (671) 148-2835            ', N'rgoodwins9@zimbio.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'sjansik2', N'+62 (203) 110-2483            ', N'sjansik2@dedecms.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'slisle5', N'+256 (976) 102-2075           ', N'slisle5@mayoclinic.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'tbonnar7', N'+86 (135) 626-5960            ', N'tbonnar7@bizjournals.com')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'tcreddonb', N'+7 (718) 627-3155             ', N'tcreddonb@yandex.ru')
INSERT [dbo].[user_contact] ([login], [phone], [email]) VALUES (N'thunnawillc', N'+385 (951) 836-4242           ', N'thunnawillc@bloglovin.com')
GO
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([code_role], [name]) VALUES (1, N'moderator')
INSERT [dbo].[user_role] ([code_role], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
ALTER TABLE [dbo].[friendship]  WITH CHECK ADD  CONSTRAINT [FK_friendship_contact_user_recirver] FOREIGN KEY([login_recirver])
REFERENCES [dbo].[user] ([login])
GO
ALTER TABLE [dbo].[friendship] CHECK CONSTRAINT [FK_friendship_contact_user_recirver]
GO
ALTER TABLE [dbo].[friendship]  WITH CHECK ADD  CONSTRAINT [FK_friendship_contact_user_sender] FOREIGN KEY([login_sender])
REFERENCES [dbo].[user] ([login])
GO
ALTER TABLE [dbo].[friendship] CHECK CONSTRAINT [FK_friendship_contact_user_sender]
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
