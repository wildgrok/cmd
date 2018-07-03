fsutil fsinfo drives


wmic logicaldisk get description,name | findstr /C:"Local"