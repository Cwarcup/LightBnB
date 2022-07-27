- write all statements in the `01_schema.sql` file.
- The `01_schema.sql` file will end up containing the entire DDL for all of the tables in the ERD we designed in the [LighthouseBnB ERD Challenge](https://web.compass.lighthouselabs.ca/4c27ac2a-00af-4d5f-acaa-3b8270b3ac68).

![erd](https://i.imgur.com/H076NBv.png)

Create Database: `CREATE DATABASE IF NOT EXISTS lightbnb;`

```zsh
cd lightBnB

// enter postgresql
psql
```

Inside the psql terminal, enter the following commands:

```sql
\l           -- list all databases
\c lightbnb  -- connect to lightbnb database

```

In psql terminal, run the following to include the `01_schema.sql` file within the migration folder:

```sql
\i migrations/01_schema.sql
```

Should be able to see the new tables in the database.

```psql
lightbnb=# \dt
        List of relations
 Schema | Name  | Type  |  Owner  
--------+-------+-------+---------
 public | users | table | vagrant
(1 row)
```