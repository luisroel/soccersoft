USE [Credentials]
GO

INSERT INTO [dbo].[tbSecurity_Menu] ([Name], [Description], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate])
VALUES ('Catalogs'		, 'Catalogs Menu'				, 20, 1, 1, GETDATE(), 1, GETDATE())				-- #3
GO
INSERT INTO [dbo].[tbSecurity_Menu] ([Name], [Description], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate])
VALUES ('Data'			, 'Data Menu'					, 30, 1, 1, GETDATE(), 1, GETDATE())				-- #3
GO

INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Markets'		, 'Markets Catalog'				, 3, 2010, 1, 1, GETDATE(), 1, GETDATE())		-- #7
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Countries'		, 'Countries Catalog'			, 3, 2020, 1, 1, GETDATE(), 1, GETDATE())		-- #8
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Confederations'	, 'Confederations Catalog'	, 3, 2030, 1, 1, GETDATE(), 1, GETDATE())		-- #9
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Associations'	, 'Associations Catalog'		, 3, 2040, 1, 1, GETDATE(), 1, GETDATE())		-- #10
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Positions'		, 'Player Positions Catalog'	, 3, 2050, 1, 1, GETDATE(), 1, GETDATE())		-- #11
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Referees'		, 'Referees Catalog'			, 3, 2060, 1, 1, GETDATE(), 1, GETDATE())		-- #12
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Players'		, 'Players Catalog'				, 3, 2070, 1, 1, GETDATE(), 1, GETDATE())		-- #13
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Teams'			, 'Teams Positions Catalog'		, 3, 2080, 1, 1, GETDATE(), 1, GETDATE())		-- #14
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Fixtures Types', 'Fixtures Types Catalog'		, 3, 2090, 1, 1, GETDATE(), 1, GETDATE())		-- #15
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Phases'		, 'Tournament Phases Catalog'	, 3, 2100, 1, 1, GETDATE(), 1, GETDATE())		-- #16
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Tournament Types'	, 'Tournament Types Catalog'		, 3, 2110, 1, 1, GETDATE(), 1, GETDATE())		-- #17
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Stadiums'		, 'Stadiums Catalog'			, 3, 2120, 1, 1, GETDATE(), 1, GETDATE())		-- #18
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Tournaments'	, 'Tournaments Catalog'			, 3, 2130, 1, 1, GETDATE(), 1, GETDATE())		-- #19
GO
INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Stats'			, 'Stats Catalog'				, 3, 2140, 1, 1, GETDATE(), 1, GETDATE())		-- #20
GO

INSERT INTO [dbo].[tbSecurity_Module] ([Name], [Description], [MenuId], [Order], [IsActive], [EntryUserId], [EntryDate], [ModUserId], [ModDate]) 
VALUES ('Schedules'			, 'Schedules'				, 4, 3010, 1, 1, GETDATE(), 1, GETDATE())		-- #21
GO

INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 7, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 8, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 9, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 10, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 11, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 12, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 13, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 14, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 15, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 16, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 17, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 18, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 19, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 20, 1, 1, 1)
GO
INSERT INTO [dbo].[tbSecurity_RoleModule] ([RoleId], [ModuleId], [IsCreated], [IsUpdated], [IsDeleted]) VALUES(1, 21, 1, 1, 1)
GO
