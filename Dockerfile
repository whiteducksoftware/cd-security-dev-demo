FROM mcr.microsoft.com/dotnet/sdk:8.0.300-jammy-amd64 AS build
WORKDIR /source

COPY . .
RUN dotnet publish -o /app


FROM mcr.microsoft.com/dotnet/aspnet:8.0.2-jammy-amd64
WORKDIR /app
COPY --from=build /app .

USER $APP_UID
ENTRYPOINT ["./sample-api"]
