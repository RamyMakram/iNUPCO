# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["PO/iNUPCO.PO/iNUPCO.PO.csproj", "PO/iNUPCO.PO/"]
COPY ["PO/iNUPCO.PO.DTOs/iNUPCO.PO.DTOs.csproj", "PO/iNUPCO.PO.DTOs/"]
COPY ["PO/iNUPCO.PO.Service/iNUPCO.PO.Service.csproj", "PO/iNUPCO.PO.Service/"]
COPY ["PO/iNUPCO.PO.Data/iNUPCO.PO.Data.csproj", "PO/iNUPCO.PO.Data/"]
COPY ["PO/iNUPCO.PO.Repo/iNUPCO.PO.Repo.csproj", "PO/iNUPCO.PO.Repo/"]
RUN dotnet restore "./PO/iNUPCO.PO/iNUPCO.PO.csproj"
COPY . .
WORKDIR "/src/PO/iNUPCO.PO"
RUN dotnet build "./iNUPCO.PO.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./iNUPCO.PO.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "iNUPCO.PO.dll"]