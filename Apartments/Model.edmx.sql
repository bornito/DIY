
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/18/2024 16:56:38
-- Generated from EDMX file: C:\Users\User\Desktop\projektno\ADPC_Exercise0506_Start\Apartments\Apartments\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DIYdb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [IDProject] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(50)  NOT NULL,
    [UserIDUser] int  NOT NULL
);
GO

-- Creating table 'UploadedProjects'
CREATE TABLE [dbo].[UploadedProjects] (
    [IDUploadedProject] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ContentType] nvarchar(20)  NOT NULL,
    [Content] varbinary(max)  NOT NULL,
    [ProjectIDProject] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [IDUser] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(20)  NOT NULL,
    [Password] nvarchar(20)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IDProject] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([IDProject] ASC);
GO

-- Creating primary key on [IDUploadedProject] in table 'UploadedProjects'
ALTER TABLE [dbo].[UploadedProjects]
ADD CONSTRAINT [PK_UploadedProjects]
    PRIMARY KEY CLUSTERED ([IDUploadedProject] ASC);
GO

-- Creating primary key on [IDUser] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([IDUser] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProjectIDProject] in table 'UploadedProjects'
ALTER TABLE [dbo].[UploadedProjects]
ADD CONSTRAINT [FK_ProjectUploadedProject]
    FOREIGN KEY ([ProjectIDProject])
    REFERENCES [dbo].[Projects]
        ([IDProject])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectUploadedProject'
CREATE INDEX [IX_FK_ProjectUploadedProject]
ON [dbo].[UploadedProjects]
    ([ProjectIDProject]);
GO

-- Creating foreign key on [UserIDUser] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_UserProject]
    FOREIGN KEY ([UserIDUser])
    REFERENCES [dbo].[Users]
        ([IDUser])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProject'
CREATE INDEX [IX_FK_UserProject]
ON [dbo].[Projects]
    ([UserIDUser]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------