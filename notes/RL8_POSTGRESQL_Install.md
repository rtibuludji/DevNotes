### Install PostgreSQL on Rocky Linux 8

assume user is `root`

#### 0. Update Packages
Update the packages
```bash
dnf -y update
```

### 1 - Installing PostgreSQL
Verify version of postgreSQL
```bash
dnf module list postgresql
```

enable PostgreSQL version 13
```bash
dnf module enable postgresql:13
```

install PosgreSQL Server
```bash
dnf install postgresql-server
```

### 2 - Creating a New PostgreSQL Database Cluster
Init DB
```bash
postgresql-setup --initdb
```
Enable on systemctl
```bash
systemctl start postgresql
systemctl enable postgresql
```

### Using PostgreSQL Roles and Databases
```bash
sudo -u postgres psql
```

```SQL
CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```
