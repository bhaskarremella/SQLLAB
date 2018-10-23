CREATE TABLE [dbo].[tblEmployeeInfo]
(
[pkID] [int] NOT NULL IDENTITY(1, 1),
[SSN] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS MASKED WITH (FUNCTION = 'partial(0, "XXX-XXX-", 4)') NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salary] [numeric] (18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmployeeInfo] ADD CONSTRAINT [PK_tblEmployeeInfo] PRIMARY KEY CLUSTERED  ([pkID]) ON [PRIMARY]
GO
