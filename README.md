# Home-Server project

Release test.

This is my personal Home Server project. I use this project to learn more about Vagrant, Ansible and Docker.

## Howto
With this project you can build and manage a multistage (Dev, Test, Prod) home media server. The server runs various Docker containers for managing "media" files. I run the Dev environment with Vagrant on my laptop and the Test and Prod environments are running on a separate server with shared NFS storage.

### Bring up the Vagrant Development environment
```
vagrant up
```
I've deliberately removed the Ansible provider from the Vagrant file to have a transparent "multistage environment"
### Run Ansible per environment
```
ansible-playbook --ask-pass --user=vagrant --become -i provisioning/inventories/development provisioning/site.yml
```
### Run Ansible variables dump for debugging
```
ansible-playbook --ask-pass --user=vagrant --become -i provisioning/inventories/development provisioning/site.yml --tags dump-vars
```
Now you can log in to the target host and view all variables know to Ansible:
```
less /root/ansible.allvars
```


# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
