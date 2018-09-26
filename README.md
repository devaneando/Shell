# Shell

My Bash settings.

## Install

```bash
cd
git clone --recursive https://github.com/devaneando/Shell.git ~/Shell
./Shell/install.bash
```

## Link Configuration

```bash
rm -Rf ~/.bashrc
ln -s ~/Shell/App/Bash/bashrc.bash .bashrc
rm -Rf ~/.config/geany
ln -s ~/Shell/App/Geany/ ~/.config/geany
```

## Add google DNS

Add Google DNS to your machine
To bypass blocked DNS entries, set Google DNS servers in your network connections with your graphical network manager and add the following info:

  Static DNS 1: 8.8.8.8
  Static DNS 2: 8.8.4.4
Edit dhclient.conf:

  sudo vi /etc/dhcp/dhclient.conf
After the request line, add the following one

  supersede domain-name-servers 8.8.8.8,8.8.4.4;
