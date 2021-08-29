-Using this command to create file migration
dotnet ef migrations script -p ./Ephata.User.WebAPI -o Migrations.sql

-Update database
dotnet-ef database update -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj

-Create Migration
dotnet-ef migration [MigrationName] -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj