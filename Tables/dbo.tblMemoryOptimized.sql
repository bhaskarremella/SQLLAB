CREATE TABLE [dbo].[tblMemoryOptimized]
(
[col1] [int] NOT NULL,
[col2] [float] NOT NULL,
[col3] [decimal] (10, 2) NOT NULL,
CONSTRAINT [PK_memoryoptimizedtable] PRIMARY KEY NONCLUSTERED  ([col1]),
INDEX [index2_name] NONCLUSTERED HASH ([col2]) WITH (BUCKET_COUNT=131072),
INDEX [col3_index] NONCLUSTERED ([col3])
)
WITH
(
MEMORY_OPTIMIZED = ON
)
GO
