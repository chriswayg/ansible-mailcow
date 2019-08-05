ansible-mailcow
=================

#### Ansible role for an initial install of the mailcow mailserver and groupware

- installs Docker and docker-compose
- installs and configures mailcow-dockerized
- option to install [RainLoop Webmail](https://www.rainloop.net/)
- option to install [NextCloud](https://nextcloud.com/)
- option to add mailserver firewall rules
- option to add a backup cron job

Details and documentation:
- https://github.com/mailcow/mailcow-dockerized
- https://mailcow.github.io/mailcow-dockerized-docs/
- https://mailcow.email/
- https://www.servercow.de/mailcow

Requirements
------------

- Debian 9 Stretch or Debian 10 Buster
- or [RancherOS](https://rancher.com/rancher-os/) with Alpine console
- 1.5 to 2 GB RAM

#### Info

- mailcow: dockerized requires some ports to be open for incoming connections, so make sure that your firewall is not blocking these.
- Make sure that no other application is interferring with mailcow's configuration, such as another mail service
- A correct DNS setup is crucial to every good mailserver setup, so please make sure you got at least the basics covered before you begin!
- Make sure that your system has a correct date and time setup. This is crucial for stuff like two factor TOTP authentication.

- Prerequisites: https://mailcow.github.io/mailcow-dockerized-docs/prerequesite-system/
- DNS: https://github.com/mailcow/mailcow/wiki/DNS-records

#### Moving IMAP mail from other servers

* [imapsync](https://github.com/imapsync/imapsync)

Role Variables
--------------

At a minimum set your Server IP, Fully Qualified Domain Name and Timezone in defaults/main.yml

Example hosts
-------------

    [servers]
    OnDebian    ansible_host=mail.example.org
    OnRancherOS ansible_ssh_host=mail.example.com ansible_ssh_user=rancher ansible_python_interpreter=/usr/bin/python3

Example mailcow playbook
----------------

    - hosts: servers
      user: root
      become: True
      roles:
         - ansible-mailcow


- For Debian or RancherOS: `ansible-playbook -v mailcow.yml`

License
-------

MIT

Author Information
------------------

Christian Wagner
