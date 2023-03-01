# MS SQL Docker Customisation example

## Starting scripts

The following scripts run when starting the container (referenced in `configure-db.sh`):

- `create-db.sql` - creates the initial database named `DB_NAME`
- `drop-schema` - drops all existing tables and views
- `master.sql` - creates the schema and tables
- `seed.sql` - adds seed data

## Tables

- All scripts to create tables or views are stored under the `tables` folder.

## Seed

- Include any data you wish to populate table/s with on start up of container.
