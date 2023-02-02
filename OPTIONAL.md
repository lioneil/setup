If you are on WSL, you may change the `hostname` by creating/updating the `/etc/wsl.conf` file.

```bash
sudo nano /etc/wsl.conf
```

Add the following lines:

```conf
[network]
hostname = ubuntu<or whatever name you want>
generateHosts = false
```

Update `hosts` file:

```bash
sudo nano /etc/hosts
```

Change `ubuntu` with whatever hostname you picked in wsl.conf:

```
127.0.0.1       localhost
127.0.1.1       ubuntu. ubuntu
::1     localhost
127.0.0.1       localhost
0.0.0.0 localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
