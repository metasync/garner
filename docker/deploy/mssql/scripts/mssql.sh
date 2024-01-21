#!/bin/bash

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d $MSSQL_DATABASE
