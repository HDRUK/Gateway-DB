# HDR_Gateway_PostgreSQL_DB

This project creates and maintains the PostgreSQL Database for the HDR Gateway Project

## Setup Local Development

### Step 1

Install postgreSQL -> [PostgreSQL](https://www.postgresql.org/)

This will install a default user `postgres` -> **DON'T FORGET YOUR PASSWORD**

> (for local environment admin/ admin could be used BUTONLY FOR LOCAL DEVELOPMENT)

> If on windows add the applications bin directory to the path.

### Step 2

Using pgAdmin

Create a new Login / Group Role.

> #### HDR_DB_ACCESS
>
> create_db_user.sql
>
> **YOU WILL NEED THE PASSWORD FOR THE NODEJS GRAPHQL ENVIRONMENT VARIABLES**

### Step 3

Using pgAdmin

Create a new database

> #### HDR_GATEWAY_DB
>
> create_db.sql

with the owner being the Login / Group create in step 2

### Step 4

Create the required trigger functions

> create_db_triggers.sql

### Step 5

create the required tables and associated triggers

> create_search_audit.sql
