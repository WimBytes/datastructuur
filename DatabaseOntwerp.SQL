USE Master
GO
CREATE DATABASE [DatabaseOntwerp]
GO
USE [DatabaseOntwerp]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Members]') AND type in (N'U'))
    DROP TABLE [dbo].[Members]
GO
CREATE TABLE [dbo].[Members] (
[memberID] int  NOT NULL  
, [userID] int  NULL  
, [studyID] char(10)  NULL  
, [studentType] int  NOT NULL  
, [studentNumber] int  NOT NULL  
, [startLevel] char(10)  NULL  
, [accountNumber] varchar(64)  NOT NULL  
, [accountHolder] varchar(128)  NOT NULL  
, [allowAutomatictransfer] real  NOT NULL  
, [memberTypeID] int  NOT NULL  
, [photo] int  NULL  
, [isAnonymous] bit  NULL  
, [remarks] varchar(256)  NULL  
)
GO

ALTER TABLE [dbo].[Members] ADD CONSTRAINT [Members_PK] PRIMARY KEY CLUSTERED (
[memberID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberPeriod]') AND type in (N'U'))
    DROP TABLE [dbo].[MemberPeriod]
GO
CREATE TABLE [dbo].[MemberPeriod] (
[periodID] int  NOT NULL  
, [memberID] int  NOT NULL  
, [subscriptionDate] datetime  NOT NULL  
, [unsubscriptionDate] datetime  NOT NULL  
)
GO

ALTER TABLE [dbo].[MemberPeriod] ADD CONSTRAINT [MemberPeriod_PK] PRIMARY KEY CLUSTERED (
[periodID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rights]') AND type in (N'U'))
    DROP TABLE [dbo].[Rights]
GO
CREATE TABLE [dbo].[Rights] (
[rightID] int  NOT NULL  
, [name] varchar(32)  NOT NULL  
, [description] varchar(128)  NULL  
)
GO

ALTER TABLE [dbo].[Rights] ADD CONSTRAINT [Rights_PK] PRIMARY KEY CLUSTERED (
[rightID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
    DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[userID] int  NOT NULL  
, [username] varchar(16)  NOT NULL  
, [passwordHash] varchar(64)  NOT NULL  
, [lastLogin] datetime  NULL  
, [numberOfLogins] char(10)  NULL  
, [numberOfFailedLogins] int  NULL  
, [lastLoginAttempt] timestamp  NULL  
)
GO

ALTER TABLE [dbo].[Users] ADD CONSTRAINT [Users_PK] PRIMARY KEY CLUSTERED (
[userID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Levels]') AND type in (N'U'))
    DROP TABLE [dbo].[Levels]
GO
CREATE TABLE [dbo].[Levels] (
[levelID] int  NOT NULL  
, [parentID] int  NULL  
, [name] varchar(32)  NULL  
, [description] text  NULL  
)
GO

ALTER TABLE [dbo].[Levels] ADD CONSTRAINT [Levels_PK] PRIMARY KEY CLUSTERED (
[levelID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetOfRights_MemberGroups]') AND type in (N'U'))
    DROP TABLE [dbo].[SetOfRights_MemberGroups]
GO
CREATE TABLE [dbo].[SetOfRights_MemberGroups] (
[userGroupID] int  NOT NULL  
, [setID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[SetOfRights_MemberGroups] ADD CONSTRAINT [SetOfRights_MemberGroups_PK] PRIMARY KEY CLUSTERED (
[userGroupID]
, [setID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rights_SetOfRights]') AND type in (N'U'))
    DROP TABLE [dbo].[Rights_SetOfRights]
GO
CREATE TABLE [dbo].[Rights_SetOfRights] (
[rightID] int  NOT NULL  
, [setID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Rights_SetOfRights] ADD CONSTRAINT [Rights_SetOfRights_PK] PRIMARY KEY CLUSTERED (
[rightID]
, [setID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
    DROP TABLE [dbo].[Courses]
GO
CREATE TABLE [dbo].[Courses] (
[courseID] int  NOT NULL  
, [remarks] text  NULL  
, [startDate] date  NULL  
, [endDate] date  NULL  
, [levelID] int  NOT NULL  
, [locationID] int  NULL  
, [startTime] time(7)  NULL  
, [endTime] time(7)  NULL  
)
GO

ALTER TABLE [dbo].[Courses] ADD CONSTRAINT [Courses_PK] PRIMARY KEY CLUSTERED (
[courseID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
    DROP TABLE [dbo].[Locations]
GO
CREATE TABLE [dbo].[Locations] (
[locationID] int  NOT NULL  
, [name] varchar(32)  NULL  
, [address] varchar(max)  NULL  
, [zipCode] varchar(10)  NULL  
, [city] varchar(max)  NULL  
, [telephoneNumber] varchar(16)  NULL  
, [mobileNumber] varchar(16)  NULL  
, [description] text  NULL  
)
GO

ALTER TABLE [dbo].[Locations] ADD CONSTRAINT [Locations_PK] PRIMARY KEY CLUSTERED (
[locationID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalData]') AND type in (N'U'))
    DROP TABLE [dbo].[PersonalData]
GO
CREATE TABLE [dbo].[PersonalData] (
[memberID] int  NOT NULL  
, [initials] varchar(10)  NULL  
, [lastName] varchar(max)  NULL  
, [firstName] varchar(max)  NULL  
, [namePrefix] varchar(10)  NULL  
, [gender] char(1)  NULL  
, [address] varchar(max)  NULL  
, [zip] varchar(10)  NULL  
, [city] varchar(32)  NULL  
, [country] varchar(32)  NULL  
, [fixedPhone] varchar(16)  NULL  
, [mobilePhone] varchar(16)  NULL  
, [email] char(10)  NULL  
, [dateOfBirth] date  NULL  
)
GO

ALTER TABLE [dbo].[PersonalData] ADD CONSTRAINT [PersonalData_PK] PRIMARY KEY CLUSTERED (
[memberID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
    DROP TABLE [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles] (
[roleID] int  NOT NULL  
, [name] varchar(32)  NULL  
, [description] char(10)  NULL  
)
GO

ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [Roles_PK] PRIMARY KEY CLUSTERED (
[roleID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[memberType]') AND type in (N'U'))
    DROP TABLE [dbo].[memberType]
GO
CREATE TABLE [dbo].[memberType] (
[memberTypeID] int  NOT NULL  
, [name] varchar(32)  NULL  
, [description] text  NULL  
)
GO

ALTER TABLE [dbo].[memberType] ADD CONSTRAINT [memberType_PK] PRIMARY KEY CLUSTERED (
[memberTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Studies]') AND type in (N'U'))
    DROP TABLE [dbo].[Studies]
GO
CREATE TABLE [dbo].[Studies] (
[studyID] char(10)  NOT NULL  
, [name] char(10)  NOT NULL  
, [institute] char(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Studies] ADD CONSTRAINT [Studies_PK] PRIMARY KEY CLUSTERED (
[studyID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentTypes]') AND type in (N'U'))
    DROP TABLE [dbo].[StudentTypes]
GO
CREATE TABLE [dbo].[StudentTypes] (
[studentType] int  NOT NULL  
, [code] varchar(64)  NOT NULL  
, [description] text  NULL  
)
GO

ALTER TABLE [dbo].[StudentTypes] ADD CONSTRAINT [StudentTypes_PK] PRIMARY KEY CLUSTERED (
[studentType]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles_SetOfRights]') AND type in (N'U'))
    DROP TABLE [dbo].[Roles_SetOfRights]
GO
CREATE TABLE [dbo].[Roles_SetOfRights] (
[roleID] int  NOT NULL  
, [setID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Roles_SetOfRights] ADD CONSTRAINT [Roles_SetOfRights_PK] PRIMARY KEY CLUSTERED (
[roleID]
, [setID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
    DROP TABLE [dbo].[Groups]
GO
CREATE TABLE [dbo].[Groups] (
[GroupID] int  NOT NULL  
, [name] char(32)  NOT NULL  
, [groupTypeID] int  NOT NULL  
, [courseID] int  NULL  
, [parentID] int  NULL  
, [isArchived] bit  NULL  
, [email] varchar(max)  NULL  
)
GO

ALTER TABLE [dbo].[Groups] ADD CONSTRAINT [Groups_PK] PRIMARY KEY CLUSTERED (
[GroupID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetOfRights]') AND type in (N'U'))
    DROP TABLE [dbo].[SetOfRights]
GO
CREATE TABLE [dbo].[SetOfRights] (
[setID] int  NOT NULL  
, [name] varchar(32)  NOT NULL  
, [description] varchar(128)  NULL  
)
GO

ALTER TABLE [dbo].[SetOfRights] ADD CONSTRAINT [SetOfRights_PK] PRIMARY KEY CLUSTERED (
[setID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Members_Groups]') AND type in (N'U'))
    DROP TABLE [dbo].[Members_Groups]
GO
CREATE TABLE [dbo].[Members_Groups] (
[memberID] int  NOT NULL  
, [roleID] int  NULL  
, [GroupID] int  NOT NULL  
, [partnerID] int  NULL  
, [isAssistent] bit  NULL  
)
GO

ALTER TABLE [dbo].[Members_Groups] ADD CONSTRAINT [Members_Groups_PK] PRIMARY KEY CLUSTERED (
[memberID]
, [GroupID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupTypes]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupTypes]
GO
CREATE TABLE [dbo].[GroupTypes] (
[groupTypeID] int  NOT NULL  
, [name] varchar(32)  NOT NULL  
, [description] text  NULL  
)
GO

ALTER TABLE [dbo].[GroupTypes] ADD CONSTRAINT [GroupTypes_PK] PRIMARY KEY CLUSTERED (
[groupTypeID]
)
GO
GO

ALTER TABLE [dbo].[Members] WITH CHECK ADD CONSTRAINT [Users_Members_FK1] FOREIGN KEY (
[userID]
)
REFERENCES [dbo].[Users] (
[userID]
)
ALTER TABLE [dbo].[Members] WITH CHECK ADD CONSTRAINT [memberType_Members_FK1] FOREIGN KEY (
[memberTypeID]
)
REFERENCES [dbo].[memberType] (
[memberTypeID]
)
ALTER TABLE [dbo].[Members] WITH CHECK ADD CONSTRAINT [StudentTypes_Members_FK1] FOREIGN KEY (
[studentType]
)
REFERENCES [dbo].[StudentTypes] (
[studentType]
)
ALTER TABLE [dbo].[Members] WITH CHECK ADD CONSTRAINT [Studies_Members_FK1] FOREIGN KEY (
[studyID]
)
REFERENCES [dbo].[Studies] (
[studyID]
)
GO

ALTER TABLE [dbo].[MemberPeriod] WITH CHECK ADD CONSTRAINT [Members_MemberPeriod_FK1] FOREIGN KEY (
[memberID]
)
REFERENCES [dbo].[Members] (
[memberID]
)
GO

GO

GO

GO

ALTER TABLE [dbo].[SetOfRights_MemberGroups] WITH CHECK ADD CONSTRAINT [Groups_SetOfRights_MemberGroups_FK1] FOREIGN KEY (
[userGroupID]
)
REFERENCES [dbo].[Groups] (
[GroupID]
)
ALTER TABLE [dbo].[SetOfRights_MemberGroups] WITH CHECK ADD CONSTRAINT [SetOfRights_SetOfRights_MemberGroups_FK1] FOREIGN KEY (
[setID]
)
REFERENCES [dbo].[SetOfRights] (
[setID]
)
GO

ALTER TABLE [dbo].[Rights_SetOfRights] WITH CHECK ADD CONSTRAINT [SetOfRights_Rights_SetOfRights_FK1] FOREIGN KEY (
[setID]
)
REFERENCES [dbo].[SetOfRights] (
[setID]
)
ALTER TABLE [dbo].[Rights_SetOfRights] WITH CHECK ADD CONSTRAINT [Rights_Rights_SetOfRights_FK1] FOREIGN KEY (
[rightID]
)
REFERENCES [dbo].[Rights] (
[rightID]
)
GO

ALTER TABLE [dbo].[Courses] WITH CHECK ADD CONSTRAINT [Levels_Courses_FK1] FOREIGN KEY (
[levelID]
)
REFERENCES [dbo].[Levels] (
[levelID]
)
ALTER TABLE [dbo].[Courses] WITH CHECK ADD CONSTRAINT [Locations_Courses_FK1] FOREIGN KEY (
[locationID]
)
REFERENCES [dbo].[Locations] (
[locationID]
)
GO

GO

ALTER TABLE [dbo].[PersonalData] WITH CHECK ADD CONSTRAINT [Members_PersonalData_FK1] FOREIGN KEY (
[memberID]
)
REFERENCES [dbo].[Members] (
[memberID]
)
GO

GO

GO

GO

GO

ALTER TABLE [dbo].[Roles_SetOfRights] WITH CHECK ADD CONSTRAINT [Roles_Roles_SetOfRights_FK1] FOREIGN KEY (
[roleID]
)
REFERENCES [dbo].[Roles] (
[roleID]
)
ALTER TABLE [dbo].[Roles_SetOfRights] WITH CHECK ADD CONSTRAINT [SetOfRights_Roles_SetOfRights_FK1] FOREIGN KEY (
[setID]
)
REFERENCES [dbo].[SetOfRights] (
[setID]
)
GO

ALTER TABLE [dbo].[Groups] WITH CHECK ADD CONSTRAINT [GroupTypes_Groups_FK1] FOREIGN KEY (
[groupTypeID]
)
REFERENCES [dbo].[GroupTypes] (
[groupTypeID]
)
ALTER TABLE [dbo].[Groups] WITH CHECK ADD CONSTRAINT [Courses_Groups_FK1] FOREIGN KEY (
[courseID]
)
REFERENCES [dbo].[Courses] (
[courseID]
)
GO

GO

ALTER TABLE [dbo].[Members_Groups] WITH CHECK ADD CONSTRAINT [Members_Members_Groups_FK1] FOREIGN KEY (
[memberID]
)
REFERENCES [dbo].[Members] (
[memberID]
)
ALTER TABLE [dbo].[Members_Groups] WITH CHECK ADD CONSTRAINT [Roles_Members_Groups_FK1] FOREIGN KEY (
[roleID]
)
REFERENCES [dbo].[Roles] (
[roleID]
)
ALTER TABLE [dbo].[Members_Groups] WITH CHECK ADD CONSTRAINT [Groups_Members_Groups_FK1] FOREIGN KEY (
[GroupID]
)
REFERENCES [dbo].[Groups] (
[GroupID]
)
GO

GO

