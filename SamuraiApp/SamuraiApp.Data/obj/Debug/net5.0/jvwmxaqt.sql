IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Battles] (
    [BattleId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Battles] PRIMARY KEY ([BattleId])
);
GO

CREATE TABLE [Samurais] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Samurais] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [BattleSamuai] (
    [BattleId] int NOT NULL,
    [SamuraiId] int NOT NULL,
    [JoinDate] datetime2 NOT NULL DEFAULT (getdate()),
    CONSTRAINT [PK_BattleSamuai] PRIMARY KEY ([BattleId], [SamuraiId]),
    CONSTRAINT [FK_BattleSamuai_Battles_BattleId] FOREIGN KEY ([BattleId]) REFERENCES [Battles] ([BattleId]) ON DELETE CASCADE,
    CONSTRAINT [FK_BattleSamuai_Samurais_SamuraiId] FOREIGN KEY ([SamuraiId]) REFERENCES [Samurais] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Quotes] (
    [Id] int NOT NULL IDENTITY,
    [Text] nvarchar(max) NULL,
    [SamuraiId] int NOT NULL,
    CONSTRAINT [PK_Quotes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Quotes_Samurais_SamuraiId] FOREIGN KEY ([SamuraiId]) REFERENCES [Samurais] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_BattleSamuai_SamuraiId] ON [BattleSamuai] ([SamuraiId]);
GO

CREATE INDEX [IX_Quotes_SamuraiId] ON [Quotes] ([SamuraiId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210525063050_frechstart', N'5.0.6');
GO

COMMIT;
GO

