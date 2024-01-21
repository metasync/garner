#!/bin/bash

# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-db.sql
