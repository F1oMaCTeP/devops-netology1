Vector
=========

This role can install and configure Vector for Clickhouse on Centos 8

Role Variables
--------------

| vars | Description | Value | Location |
|------|------------|---|---|
| vector_version | Vector version to install | 0.22.1 | defaults/main.yml |
| vector_clickhouse_ip | Addres of Clickhouse instance | localhost | defaults/main.yml |
| clickhouse_db_name | Clickhouse DB where to store logs |"logs"  | defaults/main.yml |
| clickhouse_table_name | Clickhouse table name to write logs | "data_logs" | defaults/main.yml |
| vector_url | URL for Vector download |  <https://packages.timber.io/vector/>{{ vector_version }}/vector-{{ vector_version }}-1.x86_64.rpm | vars/main.yml |
| vector_config_dir | Vector config file location | "/etc/vector" | vars/main.yml |
| vector_config | Vector config file | value below | default/main.yml |

`vector_config`

```text
  sources:
    demo_logs:
      type: demo_logs
      format: syslog
  sinks:
    to_clickhouse:
      type: clickhouse
      inputs:
        - demo_logs
      database: "{{ clickhouse_db_name }}"
      endpoint: "http://{{ vector_clickhouse_ip }}:8123"
      table: "{{ clickhouse_table_name }}"
      compression: gzip
      healthcheck: true
      skip_unknown_fields: true
```

You can replace `Vector` config with your own

Example Playbook
----------------

```yml
    - name: Install Vector
      hosts: servers
      roles:
        - vector
```

License
-------

MIT

Author Information
------------------

Artem Soldatkin

Lighthouse
=========

This role can install and configure [Lighthouse](https://github.com/VKCOM/lighthouse.git) on Centos 8

Requirements
------------

You neeed to install and configure `git` and `NGINX` (or another web server) before run this role.

Role Variables
--------------

| vars | Description | Value | Location |
|------|------------|---|---|
| lighthouse_dir | Where to store Lighthouse files | "/home/{{ ansible_user_id }}/lighthouse" | defaults/main.yml |
| lighthouse_url | URL of Clickhouse repo | "https://github.com/VKCOM/lighthouse.git" | vars/main.yml |

Example Playbook
----------------

```yml
- name: Install lighthouse
  hosts: lighthouse
  handlers:
    - name: Nginx reload
      become: true
      ansible.builtin.service:
        name: nginx
        state: restarted
  pre_tasks:
    - name: Lighthouse | Install git
      become: true
      ansible.builtin.yum:
        name: git
        state: present
    - name: Lighhouse | Install nginx
      become: true
      ansible.builtin.yum:
        name: nginx
        state: present
    - name: Lighthouse | Apply nginx config
      become: true
      ansible.builtin.template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf
        mode: 0644
  roles:
    - lighthouse
  post_tasks:
    - name: Lighthouse | Apply config
      become: true
      ansible.builtin.template:
        src: lighthouse_nginx.conf.j2
        dest: /etc/nginx/conf.d/lighthouse.conf
        mode: 0644
        notify: Nginx reload 
```

License
-------

MIT

Author Information
------------------

Artem Soldatkin