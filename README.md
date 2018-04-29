chriswayg.mailcow
=================

#### Ansible role for an initial install of the mailcow mailserver and groupware

Details and documentation:
- https://github.com/mailcow/mailcow-dockerized
- https://mailcow.github.io/mailcow-dockerized-docs/
- https://mailcow.email/
- https://www.servercow.de/mailcow

Requirements
------------

- Debian 9 stretch
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

Set your Server IP, Fully Qualified Domain Name and Timezone in defaults/main.yml


Example Playbook
----------------

    - hosts: servers
      user: root
      roles:
         - chriswayg.mailcow

`$ ansible-playbook -v mailcow.yml`

License
-------

MIT

Author Information
------------------

Christian Wagner
