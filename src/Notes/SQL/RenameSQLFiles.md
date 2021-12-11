# Rename sql file
```sql
use Master;
GO
ALTER DATABASE <Database Name> SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE <Database Name> SET OFFLINE
GO
```

Now go to powershell or windows eplorer and rename the files names

```sql
ALTER DATABASE <Database Name> MODIFY FILE 
(
    Name='<Database Name>', FILENAME='<FIle Path>\FileName.mdf'
)
GO
ALTER DATABASE <Database Name> MODIFY FILE
(
    Name='<Database Name>', FILENAME='<FIle Path>\FileName.ldf'
)
```

```sql
ALTER Database <Database Name> SET ONLINE

ALTER Database <Database Name> SET MULTI_USER
```

Now rename what you see in SMSS. 