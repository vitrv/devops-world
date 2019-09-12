FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS buildstage
WORKDIR /src
COPY ["DevopsWorld.Client/DevopsWorld.Client.csproj", "DevopsWorld.Client/"]
RUN dotnet restore "DevopsWorld.Client/DevopsWorld.Client.csproj"
COPY . .
WORKDIR /src/DevopsWorld.Client
RUN dotnet build "DevopsWorld.Client.csproj"

FROM buildstage AS publishstage
RUN dotnet publish "DevopsWorld.Client.csproj" --no-restore -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /deploy
COPY --from=publish /app .
CMD ["dotnet", "DevopsWorld.Client.dll"]

