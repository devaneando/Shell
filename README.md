# Shell

My bash and other shell related settings, with aliases and other tweaks to make everyday life easier.

Basically, all you need is to clone the repository to the intended folder (I suggest ~/.Shell), execute the *install.sh* script and you're done.

### My other repositories

Those are mainly personal and you might not have access:
```
git clone --recursive git_psicofrenia:psicofrenia/Escritos.git ~/Things/Escritos
git clone --recursive git_psicofrenia:psicofrenia/Shell.git ~/.Shell
git clone --recursive git@gitlab.com:devaneando/Notas.git ~/Things/Notas
git clone --recursive git@gitlab.com:devaneando/Novels.git ~/Things/Novels
git clone --recursive git@git.cleverti.com:eduardo.fernandes/spindots.git ~/Things/Spindots
```

## Install

- Go to your home folder and clone the repository into the *~/.Shell* folder:

        git clone --recursive https://github.com/psicofrenia/Shell.git ~/.Shell

- If you failed to clone the repository with the *--recursive* parameter, execute the following code to update the submodules:

        git submodule update --init --recursive

- Execute the install script: 

        ./.Shell/install.sh

## Custom settings


- The *install.sh* script will create a *.bashPrivate* file in your home but, if it doesn't exist, copy it:

        cp ~/.Shell/Home/bashPrivate.bash ~/.bashPrivate

- Change the current values in this file and add any custom settings you want there. It will be executed last in the Bash initialization.

## My tweaks

### Disable password asking for sudo

- Execute the following command: 

        sudo visudo

- Add the following line to the end of your file

        your_user ALL=(ALL:ALL) NOPASSWD:ALL


### Disable IPV6 from your system

- Edit *sysctl.conf*: 

        sudo vi /etc/sysctl.conf

- Add the following lines to the end of the file

        # IPv6 disabled
        net.ipv6.conf.all.disable_ipv6 = 1
        net.ipv6.conf.default.disable_ipv6 = 1
        net.ipv6.conf.lo.disable_ipv6 = 1

- Restart sysctl:

        sudo sysctl -p


### Add Google DNS to your machine
- To bypass blocked DNS entries, set Google DNS servers in your network connections with your graphical network manager and add the following info:

        Static DNS 1: 8.8.8.8
        Static DNS 2: 8.8.4.4

- Edit *dhclient.conf*: 

        sudo vi /etc/dhcp/dhclient.conf

- After the *request line*, add the following one

        supersede domain-name-servers 8.8.8.8,8.8.4.4;
