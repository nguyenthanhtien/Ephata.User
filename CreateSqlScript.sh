#!/usr/bin/env bash
 
cd ./Ephata.User.Data
 
dotnet ef migrations script -i -o ./initdb/appSchema.sql -c UserDbContext -p ./Ephata.User.Data -s ./Ephata.User.WebAPI
 
perl -e 's/\xef\xbb\xbf//;' -pi~ ./initdb/appSchema.sql
 
perl -e 's/\x08//;' -pi~ ./initdb/appSchema.sql
 
rm ./initdb/appSchema.sql~