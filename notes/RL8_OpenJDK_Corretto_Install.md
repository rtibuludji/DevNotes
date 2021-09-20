### Install PostgreSQL on RHEL8/Rocky Linux

assume user is `root`

#### 0. Update Packages
Update the packages
```bash
dnf -y update
```

### 1 - Download Amazon Corretto (OpenJDK)

```bash
cd /tmp
curl -LO  https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.rpm
```

### 2 - Installing Amazon Corretto (OpenJDK)
dnf localinstall amazon-corretto-11-x64-linux-jdk.rpm
dnf install amazon-corretto-11-x64-linux-jdk.rpm
