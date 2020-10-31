FROM microsoft/aspnetcore-build:2

WORKDIR /api

COPY . . 

RUN dotnet restore

RUN dotnet publish -O /publish

WORKDIR /publish
ENTRYPOINT ["dotnet", "/publish/api.dll"]