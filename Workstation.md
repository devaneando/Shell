## Development workstation

These are the steps to configure a development workstation

### General system settings

```
cd /etc
sudo mv sysctl.conf sysctl.conf.ori
sudo cp ~/.Shell/Workstation/sysctl.conf .
sudo sysctl -p


cd /etc/security/
sudo mv limits.conf limits.conf.ori
sudo cp ~/.Shell/Workstation/limits.conf .

cd /etc/logrotate.d/
sudo cp sudo cp ~/.Shell/Workstation/Logrotation/devaneando .

```

### Nginx settings

```
sudo service nginx stop

cd /etc/nginx/
sudo mv nginx.conf nginx.conf.ori
sudo ln -s ~/.Shell/Workstation/Ngix/nginx.conf
```

### PHP settings

```
sudo service php7.0-fpm stop

cd /etc/php/7.0/cli/
sudo mv php.ini php.ini.ori
sudo ln -s ~/.Shell/Workstation/PHP/7.0/cli/php.ini

cd etc/php/7.0/fpm
sudo mv php.ini php.ini.ori
sudo mv php-fpm.conf php-fpm.conf.ori
sudo ln -s ~/.Shell/Workstation/PHP/7.0/fpm/php.ini
sudo ln -s ~/.Shell/Workstation/PHP/7.0/fpm/php-fpm.conf

cd /etc/php/7.0/fpm/pool.d
sudo mv www.conf www.conf.ori
sudo ln -s ~/.Shell/Workstation/PHP/7.0/fpm/pool.d/devaneando.conf

sudo service php7.0-fpm start
```