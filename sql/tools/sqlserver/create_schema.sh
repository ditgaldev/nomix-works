#!/usr/bin/env bash

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -Q "CREATE DATABASE [nomix-works];
GO"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -d 'nomix-works' -i /tmp/schema.sql
