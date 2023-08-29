# Домашнее задание к занятию "Установка Kubernetes"


### Цель задания

Установить кластер K8s.

### Чеклист готовности к домашнему заданию

1. Развернутые ВМ с ОС Ubuntu 20.04-lts


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
2. [Документация kubespray](https://kubespray.io/)

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

### Решение

-----
Создаем в yc 5 виртуальных машин и заходим на мастер

Скачиваем kubespray из репозитория

```bash
root@master:~# git clone https://github.com/kubernetes-sigs/kubespray
Cloning into 'kubespray'...
remote: Enumerating objects: 67498, done.
remote: Counting objects: 100% (222/222), done.
remote: Compressing objects: 100% (124/124), done.
remote: Total 67498 (delta 86), reused 197 (delta 80), pack-reused 67276
Receiving objects: 100% (67498/67498), 21.17 MiB | 16.67 MiB/s, done.
Resolving deltas: 100% (37986/37986), done.
root@master:~# ls -la
total 28
drwx------  5 root root 4096 Avg 29 10:19 .
drwxr-xr-x 18 root root 4096 Avg 29 10:09 ..
-rw-r--r--  1 root root 3106 Dec  5  2019 .bashrc
drwx------  2 root root 4096 Dec 14 10:02 .cache
drwxr-xr-x 17 root root 4096 Avg 29 10:19 kubespray
-rw-r--r--  1 root root  161 Dec  5  2019 .profile
drwx------  2 root root 4096 Avg 29 10:09 .ssh
```
Установка зависимостей
```bash
root@master:~/kubespray# pip3 install -r requirements.txt
Collecting ansible==5.7.1
  Downloading ansible-5.7.1.tar.gz (35.7 MB)
     |████████████████████████████████| 35.7 MB 6.9 kB/s
Collecting ansible-core==2.12.5
  Downloading ansible-core-2.12.5.tar.gz (7.8 MB)
     |████████████████████████████████| 7.8 MB 55 kB/s
Collecting cryptography==3.4.8
  Downloading cryptography-3.4.8-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (3.2 MB)
     |████████████████████████████████| 3.2 MB 69.8 MB/s
Collecting jinja2==2.11.3
  Downloading Jinja2-2.11.3-py2.py3-none-any.whl (125 kB)
     |████████████████████████████████| 125 kB 62.4 MB/s
Collecting jmespath==0.9.5
  Downloading jmespath-0.9.5-py2.py3-none-any.whl (24 kB)
Collecting MarkupSafe==1.1.1
  Downloading MarkupSafe-1.1.1-cp38-cp38-manylinux2010_x86_64.whl (32 kB)
Collecting netaddr==0.7.19
  Downloading netaddr-0.7.19-py2.py3-none-any.whl (1.6 MB)
     |████████████████████████████████| 1.6 MB 35.3 MB/s
Collecting pbr==5.4.4
  Downloading pbr-5.4.4-py2.py3-none-any.whl (110 kB)
     |████████████████████████████████| 110 kB 59.9 MB/s
Collecting ruamel.yaml==0.16.10
  Downloading ruamel.yaml-0.16.10-py2.py3-none-any.whl (111 kB)
     |████████████████████████████████| 111 kB 60.9 MB/s
Collecting ruamel.yaml.clib==0.2.7
  Downloading ruamel.yaml.clib-0.2.7-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl (555 kB)
     |████████████████████████████████| 555 kB 58.8 MB/s
Requirement already satisfied: PyYAML in /usr/lib/python3/dist-packages (from ansible-core==2.12.5->-r requirements.txt (line 2)) (5.3.1)
Collecting packaging
  Downloading packaging-23.1-py3-none-any.whl (48 kB)
     |████████████████████████████████| 48 kB 8.1 MB/s
Collecting resolvelib<0.6.0,>=0.5.3
  Downloading resolvelib-0.5.4-py2.py3-none-any.whl (12 kB)
Collecting cffi>=1.12
  Downloading cffi-1.15.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (442 kB)
     |████████████████████████████████| 442 kB 51.7 MB/s
Collecting pycparser
  Downloading pycparser-2.21-py2.py3-none-any.whl (118 kB)
     |████████████████████████████████| 118 kB 56 kB/s
Building wheels for collected packages: ansible, ansible-core
  Building wheel for ansible (setup.py) ... done
  Created wheel for ansible: filename=ansible-5.7.1-py3-none-any.whl size=61777681 sha256=c39acb4cce8d1e2f48f1179c5cfd04e5bf4b1a25eb1afa25f88827eef517b2ab
  Stored in directory: /root/.cache/pip/wheels/02/07/2a/7b3eb5d79e268b769b0910cded0d524b4647ae5bc19f3ebb70
  Building wheel for ansible-core (setup.py) ... done
  Created wheel for ansible-core: filename=ansible_core-2.12.5-py3-none-any.whl size=2077336 sha256=ca3c5793e41f733a42386312b2c82cc315b2cc6aed9d73c8e639213bae322fab
  Stored in directory: /root/.cache/pip/wheels/13/09/5b/799a6bc9ca05da9805eaee2afea07e7f63e2ff03b37799d930
Successfully built ansible ansible-core
Installing collected packages: pycparser, cffi, cryptography, MarkupSafe, jinja2, packaging, resolvelib, ansible-core, ansible, jmespath, netaddr, pbr, ruamel.yaml.clib, ruamel.yaml
  Attempting uninstall: cryptography
    Found existing installation: cryptography 2.8
    Not uninstalling cryptography at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'cryptography'. No files were found to uninstall.
  Attempting uninstall: MarkupSafe
    Found existing installation: MarkupSafe 1.1.0
    Not uninstalling markupsafe at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'MarkupSafe'. No files were found to uninstall.
  Attempting uninstall: jinja2
    Found existing installation: Jinja2 2.10.1
    Not uninstalling jinja2 at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'Jinja2'. No files were found to uninstall.
Successfully installed MarkupSafe-1.1.1 ansible-5.7.1 ansible-core-2.12.5 cffi-1.15.1 cryptography-3.4.8 jinja2-2.11.3 jmespath-0.9.5 netaddr-0.7.19 packaging-23.1 pbr-5.4.4 pycparser-2.21 resolvelib-0.5.4 ruamel.yaml-0.16.10 ruamel.ya
ml.clib-0.2.7
```

Подготовим файл host.yaml
```bash
root@master:~/kubespray# declare -a IPS=(10.1.2.15 10.1.2.19 10.1.2.5 10.1.2.29 10.1.2.18)
root@master:~/kubespray# CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
DEBUG: Adding group all
DEBUG: Adding group kube_control_plane
DEBUG: Adding group kube_node
DEBUG: Adding group etcd
DEBUG: Adding group k8s_cluster
DEBUG: Adding group calico_rr
DEBUG: adding host node1 to group all
DEBUG: adding host node2 to group all
DEBUG: adding host node3 to group all
DEBUG: adding host node4 to group all
DEBUG: adding host node5 to group all
DEBUG: adding host node1 to group etcd
DEBUG: adding host node2 to group etcd
DEBUG: adding host node3 to group etcd
DEBUG: adding host node1 to group kube_control_plane
DEBUG: adding host node2 to group kube_control_plane
DEBUG: adding host node1 to group kube_node
DEBUG: adding host node2 to group kube_node
DEBUG: adding host node3 to group kube_node
DEBUG: adding host node4 to group kube_node
DEBUG: adding host node5 to group kube_node
root@master:~/kubespray# nano inventory/mycluster/hosts.yaml
root@master:~/kubespray# cat inventory/mycluster/hosts.yaml
all:
  hosts:
    master:
      ansible_host: 10.1.2.15
      ip: 10.1.2.15
      access_ip: 10.1.2.15
      ansible_user: f1omactep
    worker1:
      ansible_host: 10.1.2.19
      ip: 10.1.2.19
      access_ip: 10.1.2.19
      ansible_user: f1omactep
    worker2:
      ansible_host: 10.1.2.5
      ip: 10.1.2.5
      access_ip: 10.1.2.5
      ansible_user: f1omactep
    worker3:
      ansible_host: 10.1.2.29
      ip: 10.1.2.29
      access_ip: 10.1.2.29
      ansible_user: f1omactep
    worker4:
      ansible_host: 10.1.2.18
      ip: 10.1.2.18
      access_ip: 10.1.2.18
      ansible_user: f1omactep
  children:
    kube_control_plane:
      hosts:
        master:
    kube_node:
      hosts:
        worker1:
        worker2:
        worker3:
        worker4:
    etcd:
      hosts:
        master:
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
```

Добавим `.ssh/id_rsa` на master чтобы ansible смог подключаться к worker node и запускаем playbook

```bash
root@master:~/kubespray# ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml -b -v
..................
.............
PLAY RECAP ********************************************************************************************************************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
master                 : ok=738  changed=146  unreachable=0    failed=0    skipped=1261 rescued=0    ignored=8   
worker1                    : ok=511  changed=93   unreachable=0    failed=0    skipped=774  rescued=0    ignored=1   
worker2                    : ok=511  changed=93   unreachable=0    failed=0    skipped=773  rescued=0    ignored=1   
worker3                    : ok=511  changed=93   unreachable=0    failed=0    skipped=773  rescued=0    ignored=1   
worker4                    : ok=511  changed=92   unreachable=0    failed=0    skipped=773  rescued=0    ignored=1   

Wednesday 19 April 2023  11:29:01 +0000 (0:00:00.107)       0:18:34.478 *******
===============================================================================
kubernetes/preinstall : Update package management cache (APT) --------------------------------------------------------------------------------------------------------------------------------------------------------------------- 54.04s 
network_plugin/calico : Wait for calico kubeconfig to be created ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 42.61s 
kubernetes/preinstall : Install packages requirements ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 42.33s 
kubernetes/kubeadm : Join to cluster ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 34.94s 
kubernetes/preinstall : Preinstall | wait for the apiserver to be running --------------------------------------------------------------------------------------------------------------------------------------------------------- 31.80s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 28.60s 
kubernetes/control-plane : kubeadm | Initialize first master ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 25.65s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 18.08s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 17.44s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 16.11s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 13.79s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 12.78s 
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- 12.56s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 12.30s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 10.97s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 10.26s 
network_plugin/calico : Calico | Copy calicoctl binary from download dir ---------------------------------------------------------------------------------------------------------------------------------------------------------- 10.21s 
download : download_container | Remove container image from cache ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 9.24s 
download : download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.03s 
etcd : reload etcd ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 8.98s 
```

Проверяем

```bash
root@master:~/kubespray# kubectl version
WARNING: This version information is deprecated and will be replaced with the output from kubectl version --short.  Use --output=yaml|json to get the full version.
Client Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.3", GitCommit:"9e644106593f3f4aa98f8a84b23db5fa378900bd", GitTreeState:"clean", BuildDate:"2023-03-15T13:40:17Z", GoVersion:"go1.19.7", Compiler:"gc", Platform:"linu
x/amd64"}
Kustomize Version: v4.5.7
Server Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.3", GitCommit:"9e644106593f3f4aa98f8a84b23db5fa378900bd", GitTreeState:"clean", BuildDate:"2023-03-15T13:33:12Z", GoVersion:"go1.19.7", Compiler:"gc", Platform:"linu
x/amd64"}
```

```bash
root@master:~/.kube# kubectl get nodes
NAME        STATUS   ROLES           AGE   VERSION
master   Ready    control-plane   19m   v1.26.3
worker1     Ready    <none>          17m   v1.26.3
worker2     Ready    <none>          17m   v1.26.3
worker3     Ready    <none>          17m   v1.26.3
worker4     Ready    <none>          17m   v1.26.3

root@master:~/.kube# kubectl create deploy nginx --image=nginx:latest --replicas=2
deployment.apps/nginx created

root@master:~/.kube# kubectl get pod -o wide
NAME                     READY   STATUS    RESTARTS   AGE   IP            NODE      NOMINATED NODE   READINESS GATES
nginx-454912c8cd-ffmlb   1/1     Running   0          45s   10.233.97.1   worker4   <none>           <none>
nginx-454912c8cd-wp45q   1/1     Running   0          45s   10.233.83.1   worker3   <none>           <none>
```

### Правила приема работы

1. Домашняя работа оформляется в своем Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl get nodes`, а также скриншоты результатов
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md