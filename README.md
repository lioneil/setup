# Web Development Environment Setup

## Installation

After cloning this repository, `cd` into and run:

> Note: before running `install.sh`, please review and edit the file to your liking.

```bash
chmod +x ./install.sh
sudo ./install.sh
```

<br>

---

## The installer.sh File

The file contains installation scripts for various development tools and packages.

The installer will attempt to install the following:

- LAMP Server
- The ppa:ondrej/php for PHP version management
- Composer Dependency Manager for PHP
- nvm for NodeJS version management
- script files (see bin folder and [Scripts](#scripts) section)

Please see `install.sh` for complete list.

<br>

---

## Post-installation

The following are post-installation steps that you may opt-in to setup.

### Add Virtual Hosts

```bash
mkdir ~/Code
# Backup the default 'html' folder
sudo mv /var/www/html /var/www/html.bk
sudo ln -s ~/Code /var/www/html
sudo usermod -a -G $USER www-data
```

If all goes well, remove the `html.bk` folder.

```bash
sudo rm /var/www/html.bk
```

### Setup SSH keys for Git

Generate private and public keys:
```bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-add ~/.ssh/<generated_ssh_id>
```

In-depth instructions can be found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

<br>

---

## Scripts

**Git Sync**

Copies files from a project into another.

```bash
gitsync /path/to/git/project/1 /path/to/git/project/2
```

<br>

**WWW Services**

Shortcut to perform start/stop/reset to apache2, mysql services.

```bash
sudo www-services start|stop|reset
```
