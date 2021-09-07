#!/usr/bin/env bash
 
cd ./Ephata.User.Data
 
echo "Please enter migration name:"
read migrationName
 
dotnet ef migrations add "${migrationName}" -c UserDbContext -p ./Ephata.User.Data -s ./Ephata.User.WebAPI