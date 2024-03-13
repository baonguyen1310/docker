FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
WORKDIR /src
COPY ./ManualDocker.csproj ./
RUN dotnet restore "ManualDocker.csproj"
COPY . .
RUN dotnet publish ./ManualDocker.csproj -c release -o /app/


FROM mcr.microsoft.com/dotnet/sdk:8.0 as final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "ManualDocker.dll"]