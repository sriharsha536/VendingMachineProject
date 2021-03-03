# SnackTrust

An online vending machine

This application has been developed using Angular 9 as the front-end user interface. The user interface talks to a WEBAPI implemented using .Net Core. The data for this web application is supplied by using an Azure-based SQL Server instance.

# How to Run the application:

# Prerequisites

1. You'll need an active internet connection.
2. Install a .Net Core SDK 3.1 from https://dotnet.microsoft.com/download/dotnet/3.1
3. Download and Install Visual Studio Code from https://code.visualstudio.com/?wt.mc_id=vscom_downloads
4. Install a SQL Server (mssql) extension in Visual Code.
5. Install NPM from https://nodejs.org/en/download/

# Setting up database schema and data

1. Under the mssql extension in VS Code, run the schema_and_data.sql from \VendingMachineProject\VendingMachineProject\Scripts

# Running the WEB API

1. Open the VendingMachineProject directory from Visual Studio Code.
2. Click the debugger tab, you’ll be prompted to install an vs-studio-code debug and run extension.
3. Just hit ok and you shall see a .Net Core Web Launch configuration.
4. Run the configuration. This will start your WEB API.
5. You will see Swagger documentation on https://localhost:5001/ and https://localhost:5000/ (This means your API is up and running)

# Running the Angular web app

1. Open another instance of Visual Studio Code and open just the ClientApp folder from the repo
2. Run npm install (this will install all the angular dependencies from package.json that are needed to run the UI).
3. Once done, run npm start/ng serve (This will take few minutes for the first time you launch the app).
4. You will see Angular Live Development Server is listening on http://localhost:4200/ (This means your Angular app is up and running)

# Reports

1. Run the reports.sql from \VendingMachineProject\VendingMachineProject\Scripts for the below reports.
   a. Day by Day sales for the previous 30 days
   b. 10 most popular items for the previous week

# Known Issues

Images used in the website are not proprietary to me. Please do not use them for any personal usage.
