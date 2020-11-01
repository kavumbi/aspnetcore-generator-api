FROM mcr.microsoft.com/dotnet/core/sdk as build-env

WORKDIR /app

COPY "generator.sln" "generator.sln"
COPY "api/api.csproj" "api/api.csproj"

RUN dotnet restore

COPY . .

#RUN dotnet publish --no-restore -c Release -o /publish
RUN dotnet publish -c Release -o /publish

FROM mcr.microsoft.com/dotnet/core/aspnet
WORKDIR /publish 
COPY --from=build-env /publish .

ENTRYPOINT ["dotnet", "api.dll"]