# gentoo-configs
This repo keeps all customized configuration files for running gentoo linux.

Execute archive.sh to backup all configuration files.

## Hyper-V Network Settings

### IP Table
192.168.77.1  Default GW
192.168.77.2  Gentoo64

(100.190.0.1)
(100.190.0.2)

### Port Forwarding
22 (nat-network) -> 192.168.77.2:22 TCP

### HOST Settings

Use the default vm-switch `Default Switch`.
``` powershell
New-NetIPAddress -ipaddress 192.168.77.1 -prefixlength 24 -interfaceAlias "vEthernet (Default Switch)"
New-NetNat -name "nat-network" -internalipinterfaceaddressprefix 192.168.77.0/24
```

Alternatively if you want to create a new vm-switch instead, use the following command.

``` powershell
New-VMSwitch -switchname "nat-switch" -switchtype internal
New-NetIPAddress -ipaddress 192.168.77.1 -prefixlength 24 -interfaceAlias "vEthernet (nat-switch)"
New-NetNat -name "nat-network" -internalipinterfaceaddressprefix 192.168.77.0/24
```

### VM Settings

```bash
cd /etc/init.d
ln -s net.lo net.eth0
```

```
#FILE: /etc/conf.d/net

# For static IP using CIDR notation
config_eth0="192.168.0.7/24"
routes_eth0="default via 192.168.0.1"
dns_servers_eth0="192.168.0.1 8.8.8.8"
  
# For static IP using netmask notation
config_eth0="192.168.0.7 netmask 255.255.255.0"
routes_eth0="default via 192.168.0.1"
dns_servers_eth0="192.168.0.1 8.8.8.8"
```

### Port Forwarding
```powershell
Add-NetNatStaticMapping -ExternalIPAddress "0.0.0.0/24" -ExternalPort 22 -Protocol TCP -InternalIPAddress "192.168.77.2" -InternalPort 22 -NatName "nat-network"
```

## Hyper-V Shared Folder
Enable sharing on the target folder from the Windows Host and make it allows
read and write. This shared folder must be created and owned by the adminstrator.

From the Linux guest, Install package `net-fs/cifs-utils` with the following USE flags.

```
net-fs/cifs-utils-6.11::gentoo  USE="pam -acl -ads -caps -creds -systemd"
```

Mount the shared folder through the following command as root. Here, the IP
address `192.168.77.1` is the default gateway.


```bash
mount -t cifs -o rw,noexec,async,nodev,nosuid,uid=emguy,gid=emguy,dir_mode=0755,file_mode=0644,credentials=/root/.smbcred //192.168.77.1/hyperv-share /home/emguy/share
```

This is the content of the file `/root/.smbcred`


```
username=root
password=3*****
```
