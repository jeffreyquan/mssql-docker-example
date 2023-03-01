BEGIN TRANSACTION;

IF NOT EXISTS (
  SELECT
    *
  FROM
    sys.schemas
  WHERE
    name = N'$(SCHEMA)'
) EXEC ('CREATE SCHEMA $(SCHEMA)');

GO
    COMMIT;
