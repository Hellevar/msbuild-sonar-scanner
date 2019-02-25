FROM microsoft/dotnet:2.2.104-sdk

ENV SONAR_SCANNER_MSBUILD_TOOL 4.6.0

# Install OpenJDK-8
RUN apt-get update && apt-get install --yes openjdk-8-jdk-headless

# Install sonar-scanner as dotnet tool
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --global dotnet-sonarscanner --version $SONAR_SCANNER_MSBUILD_TOOL

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install --yes nodejs
