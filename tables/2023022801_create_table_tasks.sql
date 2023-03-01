BEGIN TRANSACTION;
IF OBJECT_ID (N'$(SCHEMA).tasks', 'U') IS NULL
BEGIN
CREATE TABLE [$(SCHEMA)].[tasks](
  [id] [int] NOT NULL IDENTITY,
  [description] [text] NOT NULL,
  [is_completed] [bit] DEFAULT 0,
  [created_at] [datetimeoffset] NOT NULL DEFAULT (getutcdate())
)
END

IF OBJECT_ID (N'$(SCHEMA).tasks_pk', 'PK') IS NULL
BEGIN
ALTER TABLE [$(SCHEMA)].[tasks] ADD CONSTRAINT [tasks_pk] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
END
COMMIT;
