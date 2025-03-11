# SSH Remote Server Setup

## Requirements

- A device with openssh installed
- A remote server running linux

## Server Seup

I used AWS to spin up a virtual server using the steps highlighted below

- Login to console
- Select EC2 under service
- Click Launch Instance
- Give the server a name
- Select Ubuntu Server as OS Image
- Instance type: t3 micro
- Create new key pair. Give it a name and the file will be downloaded to your machine.
- Accept defualts for the other sections and launch instance

## Create SSH Keys

- This command will create private and public keys and stored in the path provided on your device.
```console
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_key1
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_key2
```

## Copy the public SSH Keys to the server

- On a windows machine, you might have to copy the keys manually to the server, because the ssh-copy-id command doesn't work
```console
ssh-copy-id -i ~/.ssh/id_rsa_key1.pub username@server-ip
ssh-copy-id -i ~/.ssh/id_rsa_key2.pub username@server-ip
```
- To copy the public key manually, connect to the serve from the admin console and copy the content of '~/.ssh/id_rsa_key1.pub' to ~/.ssh/authorized_keys
- Repeat the same step for the second key.

After you verify that the public key is on the server:
- Open SSH configuration file
```console
sudo nano /etc/ssh/sshd_config
```
- Remove the comment on the following lines
```console
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

- Restart SSH service
```console
sudo systemctl restart ssh 
```

## Connect to server with SSH keys

- From your terminal run the command below to connect to the server with the private key on your device.
```console
ssh -i <path-to-privatekey> username@server-ip
```
- Replace <path-to-keypair> with actual path to where the keypair was saved, server username and IP address
- You should see an interface like this 
![Server Image](server-landing.png)


## Connect to server with alias




Project URL: https://roadmap.sh/projects/ssh-remote-server-setup