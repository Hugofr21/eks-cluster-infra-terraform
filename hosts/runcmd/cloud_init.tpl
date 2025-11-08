write_files:
- path: /home/${user}/.ssh/id_rsa
owner: ${user}:${user}
permissions: '0600'
content: |
${private_key}

- path: /home/${user}/.ssh/authorized_keys
owner: ${user}:${user}
permissions: '0644'
content: |
${public_key}

- path: /usr/local/bin/install.sh
owner: root:root
permissions: '0755'
content: |
${install_script}

runcmd:
- [ mkdir, -p, /home/${user}/.ssh ]
- [ chown, -R, "${user}:${user}", /home/${user}/.ssh ]
- [ chmod, 700, /home/${user}/.ssh ]
- /usr/local/bin/install.sh