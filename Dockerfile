# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln .
COPY ./*/*.csproj ./*/
# RUN for file in $(ls *.csproj); do mkdir -p /${file%.*}/ && mv $file /${file%.*}/; done
COPY ./Ephata.User.Data/ ./Ephata.User.Data/
COPY ./Ephata.User.DomainLayer/ ./Ephata.User.DomainLayer/
COPY ./Ephata.User.Service/ ./Ephata.User.Service/
COPY ./Ephata.User.WebAPI/ ./Ephata.User.WebAPI/
RUN dotnet restore

# Copy everything else and build
COPY . .
RUN dotnet publish ./Ephata.User.WebAPI/Ephata.User.WebAPI.csproj -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /usr/lib/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /usr/lib/ssl/openssl.cnf
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "Ephata.User.WebAPI.dll"]