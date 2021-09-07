﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetRoles" (
        "Id" uuid NOT NULL,
        "IsDeleted" boolean NOT NULL,
        "Name" character varying(256) NULL,
        "NormalizedName" character varying(256) NULL,
        "ConcurrencyStamp" text NULL,
        CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetUsers" (
        "Id" uuid NOT NULL,
        "FirstName" text NULL,
        "LastName" text NULL,
        "FullName" text NULL,
        "Address" text NULL,
        "AdditionalEmail" text NULL,
        "IsDeleted" boolean NOT NULL,
        "CreatedById" uuid NOT NULL,
        "CreatedDate" timestamp without time zone NOT NULL,
        "UpdatedById" uuid NOT NULL,
        "UpdatedDate" timestamp without time zone NOT NULL,
        "UserName" character varying(256) NULL,
        "NormalizedUserName" character varying(256) NULL,
        "Email" character varying(256) NULL,
        "NormalizedEmail" character varying(256) NULL,
        "EmailConfirmed" boolean NOT NULL,
        "PasswordHash" text NULL,
        "SecurityStamp" text NULL,
        "ConcurrencyStamp" text NULL,
        "PhoneNumber" text NULL,
        "PhoneNumberConfirmed" boolean NOT NULL,
        "TwoFactorEnabled" boolean NOT NULL,
        "LockoutEnd" timestamp with time zone NULL,
        "LockoutEnabled" boolean NOT NULL,
        "AccessFailedCount" integer NOT NULL,
        CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetRoleClaims" (
        "Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "RoleId" uuid NOT NULL,
        "ClaimType" text NULL,
        "ClaimValue" text NULL,
        CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetUserClaims" (
        "Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "UserId" uuid NOT NULL,
        "ClaimType" text NULL,
        "ClaimValue" text NULL,
        "ApplicationUserId" uuid NULL,
        CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetUserLogins" (
        "LoginProvider" text NOT NULL,
        "ProviderKey" text NOT NULL,
        "ProviderDisplayName" text NULL,
        "UserId" uuid NOT NULL,
        "ApplicationUserId" uuid NULL,
        CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey"),
        CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetUserRoles" (
        "UserId" uuid NOT NULL,
        "RoleId" uuid NOT NULL,
        "Discriminator" text NOT NULL,
        "UserId1" uuid NULL,
        "RoleId1" uuid NULL,
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
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE TABLE "AspNetUserTokens" (
        "UserId" uuid NOT NULL,
        "LoginProvider" text NOT NULL,
        "Name" text NOT NULL,
        "Value" text NULL,
        "ApplicationUserId" uuid NULL,
        CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name"),
        CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers" ("Id") ON DELETE RESTRICT,
        CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" ("NormalizedName");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserClaims_ApplicationUserId" ON "AspNetUserClaims" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserLogins_ApplicationUserId" ON "AspNetUserLogins" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserRoles_RoleId1" ON "AspNetUserRoles" ("RoleId1");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserRoles_UserId1" ON "AspNetUserRoles" ("UserId1");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "EmailIndex" ON "AspNetUsers" ("NormalizedEmail");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" ("NormalizedUserName");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    CREATE INDEX "IX_AspNetUserTokens_ApplicationUserId" ON "AspNetUserTokens" ("ApplicationUserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210907071128_InitDb') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210907071128_InitDb', '5.0.9');
    END IF;
END $$;
COMMIT;

