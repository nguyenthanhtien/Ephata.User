-Using this command to create file migration
dotnet ef migrations script -p ./Ephata.User.WebAPI -o Migrations.sql

-Update database
dotnet-ef database update -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj

-Create Migration
dotnet-ef migration [MigrationName] -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj

# User Service Sample

This repository contains samples of user service. We are working on integrating these templates into Visaul Studio as well.

local - running the application through an IDE
- running the app locally requires you to first startup the docker-compose file in order to setup infrastructure items such as databases, redis, etc.
		
- the local settings files will then point to these infrastructure items running in docker-compose

Using this command to create file migration
```` 
```
dotnet ef migrations script -p ./Ephata.User.WebAPI -o Migrations.sql
```
````

Update database
```` 
```
dotnet-ef database update -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj
```
````

Create Migration
```` 
```
dotnet-ef migration [MigrationName] -s ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -p ./Ephata.User.Data/Ephata.User.Data.csproj
```
````

## Contributing

We would love community contributions here.

See [CONTRIBUTING.md](CONTRIBUTING.md) for information on contributing to this project.

This project has adopted the code of conduct defined by the [Contributor Covenant](http://contributor-covenant.org/) 
to clarify expected behavior in our community. For more information, see the [.NET Foundation Code of Conduct](http://www.dotnetfoundation.org/code-of-conduct).

## License

This project is licensed with the [MIT license](LICENSE).

## Related Projects

You should take a look at these related projects:

- [Template Engine](https://github.com/dotnet/templating/)
- [.NET Core](https://github.com/dotnet/core)
- [ASP.NET](https://github.com/aspnet)
- [Mono](https://github.com/mono)
1
