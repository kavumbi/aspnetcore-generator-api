FROM mcr.microsoft.com/dotnet/core/sdk as build-env

WORKDIR /generator

# restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# copy src
COPY . .

# test
#ENV TEAMCITY_PROJECT_NAME=fake
RUN dotnet test tests/tests.csproj

# publish
RUN dotnet publish api/api.csproj -o /publish

FROM mcr.microsoft.com/dotnet/core/aspnet
WORKDIR /publish 
COPY --from=build-env /publish .

ENTRYPOINT ["dotnet", "api.dll"]