# docker-sqldef

https://github.com/sqldef/sqldef

# Usage
```bash
# import
docker run --rm ghcr.io/amothic/mysqldef -u root -h hostname dbname --export > schema.sql

# export
docker run -i --rm ghcr.io/amothic/mysqldef -u root -h hostname dbname --dry-run < schema.sql
docker run -i --rm ghcr.io/amothic/mysqldef -u root -h hostname dbname < schema.sql
```
