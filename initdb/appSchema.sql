﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetRoles" (
        "Id" uniqueidentifier NOT NULL,
        "IsDeleted" bit NOT NULL,
        "Name" nvarchar(256) NULL,
        "NormalizedName" nvarchar(256) NULL,
        "ConcurrencyStamp" nvarchar(max) NULL,
        CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetUsers" (
        "Id" uniqueidentifier NOT NULL,
        "FirstName" nvarchar(max) NULL,
        "LastName" nvarchar(max) NULL,
        "FullName" nvarchar(max) NULL,
        "Address" nvarchar(max) NULL,
        "AdditionalEmail" nvarchar(max) NULL,
        "IsDeleted" bit NOT NULL,
        "CreatedById" uniqueidentifier NOT NULL,
        "CreatedDate" datetime2 NOT NULL,
        "UpdatedById" uniqueidentifier NOT NULL,
        "UpdatedDate" datetime2 NOT NULL,
        "UserName" nvarchar(256) NULL,
        "NormalizedUserName" nvarchar(256) NULL,
        "Email" nvarchar(256) NULL,
        "NormalizedEmail" nvarchar(256) NULL,
        "EmailConfirmed" bit NOT NULL,
        "PasswordHash" nvarchar(max) NULL,
        "SecurityStamp" nvarchar(max) NULL,
        "ConcurrencyStamp" nvarchar(max) NULL,
        "PhoneNumber" nvarchar(max) NULL,
        "PhoneNumberConfirmed" bit NOT NULL,
        "TwoFactorEnabled" bit NOT NULL,
        "LockoutEnd" datetimeoffset NULL,
        "LockoutEnabled" bit NOT NULL,
        "AccessFailedCount" int NOT NULL,
        CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetRoleClaims" (
        "Id" int NOT NULL,
        "RoleId" uniqueidentifier NOT NULL,
        "ClaimType" nvarchar(max) NULL,
        "ClaimValue" nvarchar(max) NULL,
        CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetUserClaims" (
        "Id" int NOT NULL,
        "UserId" uniqueidentifier NOT NULL,
        "ClaimType" nvarchar(max) NULL,
        "ClaimValue" nvarchar(max) NULL,
        "ApplicationUserId" uniqueidentifier NULL,
        CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_ApplicationUserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetUserLogins" (
        "LoginProvider" nvarchar(450) NOT NULL,
        "ProviderKey" nvarchar(450) NOT NULL,
        "ProviderDisplayName" nvarchar(max) NULL,
        "UserId" uniqueidentifier NOT NULL,
        "ApplicationUserId" uniqueidentifier NULL,
        CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey"),
        CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_ApplicationUserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetUserRoles" (
        "UserId" uniqueidentifier NOT NULL,
        "RoleId" uniqueidentifier NOT NULL,
        "Discriminator" nvarchar(max) NOT NULL,
        "UserId1" uniqueidentifier NULL,
        "RoleId1" uniqueidentifier NULL,
        CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId"),
        CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE,
        CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId1" FOREIGN KEY ("RoleId1") REFERENCES "AspNetRoles" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE,
        CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId1" FOREIGN KEY ("UserId1") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE TABLE "AspNetUserTokens" (
        "UserId" uniqueidentifier NOT NULL,
        "LoginProvider" nvarchar(450) NOT NULL,
        "Name" nvarchar(450) NOT NULL,
        "Value" nvarchar(max) NULL,
        "ApplicationUserId" uniqueidentifier NULL,
        CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name"),
        CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_ApplicationUserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" ("NormalizedName") WHERE [NormalizedName] IS NOT NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserClaims_ApplicationUserId" ON "AspNetUserClaims" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserLogins_ApplicationUserId" ON "AspNetUserLogins" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserRoles_RoleId1" ON "AspNetUserRoles" ("RoleId1");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserRoles_UserId1" ON "AspNetUserRoles" ("UserId1");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "EmailIndex" ON "AspNetUsers" ("NormalizedEmail");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" ("NormalizedUserName") WHERE [NormalizedUserName] IS NOT NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    CREATE INDEX "IX_AspNetUserTokens_ApplicationUserId" ON "AspNetUserTokens" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210822080458_InitDatabase') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210822080458_InitDatabase', '5.0.9');
    END IF;
END $$;
COMMIT;

