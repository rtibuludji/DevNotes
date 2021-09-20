### Install NGINX on RHEL8/Rocky Linux

assume user is `root`

#### 0. Update Packages
Update the packages
```bash
dnf -y update
```

### 1 - Installing NGINX

```bash
dnf install nginx

systemctl start nginx
systemctl enable nginx
```

### 2 - Setting Firewall
firewall-cmd --permanent --add-service=http,https
firewall-cmd --permanent --list-all
firewall-cmd --reload

https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-8
