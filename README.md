# devops-netology

Будут игнорироваться все файлы, каталоги с именем **/.terraform/*

Будут игнорироваться все файлы с окончанием *.tfstate

Будут игнорироваться все файлы с наименованием *.tfstate*

Будет игнорироваться файл с наименованием crash.log

# 2.4 Инструменты Git
1)Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea

Command git show

aefead2207ef7e2aa5dc81a34aedf0cad4c32545

commit - Update CHANGELOG.md

2)Какому тегу соответствует коммит 85024d3?

Command git show -s --oneline

TAG - tag: v0.12.23

3)Сколько родителей у коммита b8d720? Напишите их хеши.

Command git show --pretty=%P

56cd7859e05c36c06b56d013b55a252d0bb7e158

9ea88f22fc6269854151c571162c5bcf958bee2b

4)Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

Command git show -s --oneline v0.12.23..v0.12.24

3ff1c03b (tag: v0.12.24) v0.12.24

b14b74c49 [Website] vmc provider links

3f235065b Update CHANGELOG.md

6ae64e247 registry: Fix panic when server is unreachable

5c619ca1b website: Remove links to the getting started guide's old location

06275647e Update CHANGELOG.md

d5f9411f5 command: Fix bug when using terraform login on Windows

4b6d06cc5 Update CHANGELOG.md

dd01a3507 Update CHANGELOG.md

225466bc3 Cleanup after v0.12.23 release

5)Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).

Command git log -S"func providerSource(" --oneline

8c928e835

6)Найдите все коммиты в которых была изменена функция globalPluginDirs.

Commands git grep "func globalPluginDirs(" ; git log -s -L :globalPluginDirs:plugins.go --oneline

78b122055 Remove config.go and update things using its aliases

52dbf9483 keep .terraform.d/plugins for discovery

41ab0aef7 Add missing OS_ARCH dir to global plugin paths

66ebff90c move some more plugin search path logic to command

8364383c3 Push plugin discovery down into command package

7)Кто автор функции synchronizedWriters?

Commands git log -S"func synchronizedWriters(" --oneline ; git show 5ac311e2a -s --pretty=format:%an

5ac311e2a - Martin Atkins mart@degeneration.co.uk

# Домашнее задание к занятию "3.1. Работа в терминале, лекция 1"

5)
По умолчанию выдано 2 CPU и 1024 MB RAM

6)
Необходимо изменить конфиг файл vagrantfile
v.memory = ~
v.cpus = ~

8)
HISTSIZE - 862 строкa
HISTFILESIZE - 846 строкa
ignorespace и ignoredups, в истории не будут сохранятся команды, совпадающие с предыдущей, а также начинающиеся на пробел.

9)
Строка 257, когда список должен будет выполнять в текущем контексте интерпретатора

10)
touch {1..100000}
300000 не получится - Argument list too long

11)
Выводит 0 или 1

Вернётся 0 так как директория /tmp существует, echo $~ вернёт [[ -d /tmp ]]

12)
mkdir /tmp/new_path_directory 
cp /bin/bash /tmp/new_path_directory/
PATH=/tmp/new_path_directory/bash:$PATH
echo $PATH
type -a bash

13)
Команда at используется для назначения одноразового задания на заданное время, а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше 1.5.

# Домашнее задание к занятию "3.2. Работа в терминале, лекция 2"

1)Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.

Команда cd мне кажется относится к типам stdin stdout так как может и быть потоком ввода, также и вывода, если нед допустимой директории.

(Доработка - cd is a shell builtin вызывается напрямую в оболочку, еслиб не вызывалась напрямую, то создавался бы отдельный демон.

2)Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.

grep <some_string> <some_file> -c

3)Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?

systemd

4)Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

ls /root 2>/dev/pts/~

5)Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

cat omg
omg
test1
cat omg1
cat <omg >omg1
cat omg1
omg
test1


6)Получится ли находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

Echo "Priveti" > /dev/tty1

7)Выполните команду bash 5>&1. К чему она приведет? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?

bash 5>&1 - создает новый дескриптор 5 и перенаправляет его в поток вывода.
echo netology > /proc/$$/fd/5 - перенаправляет команду в созданный дескриптор

8)Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.

Возможно, требуется поменять потоки вывода и потоки ошибок.

 ls /usr
 
 bin   games   include   lib   lib64   libexec   local   sbin   share   src   tmp
 ls
 
 omg   omg1   omg2
 
 ls /root
 
 ls: cannot open directory '/root': Permission denied
 
 (ls /usr && ls && ls /root) 3>&1 1>&2 2>&3 | wc -l
 
 bin   games   include   lib   lib64   libexec   local   sbin   share   src   tmp
 
 omg   omg1   omg2
 
 anaconda-ks.cfg
 
 0


9)Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?

Выводится список переменных процессора, под которым находится текущая оболочка bash, аналогичный вывод делается командой printenv.

10)Используя man, опишите что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe.

/proc/[pid]/cmdline - файл только на чтение, который содержит строку запуска процессов, кроме зомби-процессов (строка 236)
/proc/[pid]/exe - сожержит полное имя выполняемого файла для процесса (строка 279)

11)Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.

sse 4_2

12)При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2.

При запуске ssh, tty не выделяется. Если физически то tty будет выдаваться, так как запускается сеанс оболочки.

13)Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.

Требуется поправить /proc/sys/kernel/yama/ptrace_scope по умолчания стоит 0

14)sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.

Tee - получает значения ввода и записывает в значения вывода и файл. Tee запускается отдельным процессом с повышеными привилениями root, то получая в вводе через | значения от Echo - имеются права на запись.

echo string | sudo tee /root/OMG

# Домашнее задание к занятию "3.3. Операционные системы, лекция 1"

1)Какой системный вызов делает команда cd? В прошлом ДЗ мы выяснили, что cd не является самостоятельной программой, это shell builtin, поэтому запустить strace непосредственно на cd не получится. Тем не менее, вы можете запустить strace на /bin/bash -c 'cd /tmp'. В этом случае вы увидите полный список системных вызовов, которые делает сам bash при старте. Вам нужно найти тот единственный, который относится именно к cd. Обратите внимание, что strace выдаёт результат своей работы в поток stderr, а не в stdout.

chdir("/tmp") = 0

2)Попробуйте использовать команду file на объекты разных типов на файловой системе. Используя strace выясните, где находится база данных file на основании которой она делает свои догадки.

File пыталась достучаться до не существующих файлов, а потом в /etc/magic , /usr/share/misc/magic.mgc

3)Предположим, приложение пишет лог в текстовый файл. Этот файл оказался удален (deleted в lsof), однако возможности сигналом сказать приложению переоткрыть файлы или просто перезапустить приложение – нет. Так как приложение продолжает писать в удаленный файл, место на диске постепенно заканчивается. Основываясь на знаниях о перенаправлении потоков предложите способ обнуления открытого удаленного файла (чтобы освободить место на файловой системе).

echo "" | tee /proc/№PID/fd/№descriptor

4)Занимают ли зомби-процессы какие-то ресурсы в ОС (CPU, RAM, IO)?

Не занимают, сохраняют только свой ID.

5)В iovisor BCC есть утилита opensnoop, На какие файлы вы увидели вызовы группы open за первую секунду работы утилиты? Воспользуйтесь пакетом bpfcc-tools для Ubuntu 20.04

577    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services
577    dbus-daemon        18   0 /usr/share/dbus-1/system-services
577    dbus-daemon        -1   2 /lib/dbus-1/system-services


6)Какой системный вызов использует uname -a? Приведите цитату из man по этому системному вызову, где описывается альтернативное местоположение в /proc, где можно узнать версию ядра и релиз ОС

Part of the utsname information is also accessible via /proc/sys/kernel/{ostype,hostname, osrelease, version, domainname}.

7)Чем отличается последовательность команд через ; и через && в bash? Есть ли смысл использовать в bash &&, если применить set -e?

; - последовательность
&& - выполняется если только команда до && выполнена.
Смысл имеется применять в скриптахю

8)Из каких опций состоит режим bash set -euxo pipefail и почему его хорошо было бы использовать в сценариях?

Для чательной работы скрипта при его крахе, а также для дигностики проблемы(лог)

9)Используя -o stat для ps, определите, какой наиболее часто встречающийся статус у процессов в системе. В man ps ознакомьтесь (/PROCESS STATE CODES) что значат дополнительные к основной заглавной буквы статуса процессов. Его можно не учитывать при расчете (считать S, Ss или Ssl равнозначными).

 10 I
 
 55 I<
 
 1 R+
 
 38 S
 
 3 S+
 
 2 SN
 
 1 STAT


+    is in the foreground process group
        
N    low-priority (nice to other users)
        
s    is a session leader
        
<   high-priority (not nice to other users)

# Домашнее задание к занятию "3.4. Операционные системы, лекция 2"

1)Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter
unit-файл

ExecStart=/usr/local/bin/node_exporter

#!/bin/sh

OPTIONS="--collector.textfile.directory /var/lib/node_exporter/textfile_collector"

● node_exporter.service - Prometheus Node Exporter
   Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: disabled)
   Active: active (running) since Fri 2022-07-15 11:01:41 MSK; 2min 22s ago
 Main PID: 2317 (node_exporter)
    Tasks: 4 (limit: 10926)
   Memory: 6.4M
   CGroup: /system.slice/node_exporter.service
           └─2317 /usr/local/bin/node_exporter
 
 systemctl enabled node_exporter
 После ребута все запускается. 
 
 
2)Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети

 CPU
 
 node_cpu_seconds_total{cpu="0",mode="system"}
 
 node_cpu_seconds_total{cpu="0",mode="idle"}
 
 process_cpu_seconds_total
 
 RAM
 
 node_memory_Buffers_bytes
 
 node_memory_MemAvailable_bytes
 
 node_memory_MemFree_bytes
 
 Disc
 
 node_disk_io_time_seconds_total{device="~~~"}
 
 node_disk_read_time_seconds_total{device="sda"}
 
 node_disk_write_time_seconds_total{device="sda"}
 
 node_filesystem_avail_bytes
 
 Network
 
 node_network_transmit_bytes_total
 
 node_network_transmit_errs_total
 
 node_network_info

3)Установите в свою виртуальную машину Netdata

 ● netdata.service - Real time performance monitoring
 
   Loaded: loaded (/usr/lib/systemd/system/netdata.service; enabled; vendor pre>
   
   Active: active (running) since Fri 2022-07-15 11:15:38 MSK; 24s ago
   
  Process: 32581 ExecStartPre=/bin/chown -R netdata:netdata /var/run/netdata (c>
  
  Process: 32579 ExecStartPre=/bin/mkdir -p /var/run/netdata (code=exited, stat>
  
  Process: 32577 ExecStartPre=/bin/chown -R netdata:netdata /var/cache/netdata >
  
  Process: 32575 ExecStartPre=/bin/mkdir -p /var/cache/netdata (code=exited, st>
  
 Main PID: 32583 (netdata)
 
    Tasks: 55 (limit: 10926)
    
   Memory: 158.4M
   
   CGroup: /system.slice/netdata.service
           ├─32583 /usr/sbin/netdata -P /var/run/netdata/netdata.pid -D
           ├─32586 /usr/sbin/netdata --special-spawn-server
           ├─32733 /usr/libexec/netdata/plugins.d/apps.plugin 1
           ├─32734 /usr/libexec/netdata/plugins.d/ebpf.plugin 1
           └─32736 /usr/libexec/netdata/plugins.d/go.d.plugin 1


4)Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?

 dmesg | grep -i virtual

5)Как настроен sysctl fs.nr_open на системе по-умолчанию?

 1048576

6)Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter.

 root       33105  0.0  0.0   7308   936 pts/1    S+   11:19   0:00 unshare -f --pid --mount-proc sleep 1h
 
 root       33106  0.0  0.0   7316   840 pts/1    S+   11:19   0:00 sleep 1h
 
 root       33170  0.0  0.0  12144  1168 pts/2    S+   11:20   0:00 grep --color=auto sleep

 nsenter --target 33106 --pid --mount

 ps aux

 USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
 
 root           1  0.0  0.0   7316   840 pts/1    S+   11:19   0:00 sleep 1h
 
 root           2  0.0  0.3  26248  4004 pts/2    S    11:21   0:00 -bash
 
 root          26  0.0  0.2  58756  3972 pts/2    R+   11:22   0:00 ps aux

7)Найдите информацию о том, что такое :(){ :|:& };:.

:(){ :|: & };: – форк-бомба

В этой короткой строке определена функция командной оболочки, которая создает свои собственные копии. Процесс постоянно воспроизводит себя, и его копии постоянно размножаться, быстро занимая все свое процессорное время и всю память. Это может привести к остановке компьютера. Это, в большей степени, атака вида denial-of-service (отказ в обслуживании).

Чтобы посмотреть какой механизм стабилизировал систему, можно вызвать команду dmesg.  Настройки по умолчания зависят от дистриба, проверить можно командой ulimit -u
которая покажет максимальное количество процессов.

Изменить этот параментр можно ulimit -u 300, по итогу максимальное количество процессов не сможет превышать данную планку и заданная команда не скушает все ресурсы.

# Домашнее задание к занятию "3.5. Файловые системы"

1)Узнайте о sparse (разряженных) файлах.

Разрежённый файл (англ. sparse file) — файл, в котором длинные последовательности нулевых байтов заменены на информацию об этих последовательностях. Таким 
образомдостигается сжатие файлов на уровне драйвера файловой системы. Данная возможность используется, в основном, для файлов-контейнеров (например, файлы баз данных).

2)Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?

Нет, причина в inode файла. Потому что имеется таблица соответсвия inode.

3)Сделайте vagrant destroy на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим

![image](https://user-images.githubusercontent.com/106802398/179572696-a0a634de-da32-4d7e-87eb-5db068b42a6a.png)

 4)Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.

![image](https://user-images.githubusercontent.com/106802398/179573313-d2b09e71-4811-403a-bfd6-c1bdbb22a322.png)

5)Используя sfdisk, перенесите данную таблицу разделов на второй диск.
 
![image](https://user-images.githubusercontent.com/106802398/179573508-de2a7ff4-a2f5-4bd3-98c8-2633434eaef0.png)

6)Соберите mdadm RAID1 на паре разделов 2 Гб.
 
 ![image](https://user-images.githubusercontent.com/106802398/179573768-b99ec4df-5d4d-459a-871a-f164fc09dd73.png)

7)Соберите mdadm RAID0 на второй паре маленьких разделов
 
 ![image](https://user-images.githubusercontent.com/106802398/179573919-3e522aa6-0046-4b5b-9163-89b74ccf8d6d.png)

8)Создайте 2 независимых PV на получившихся md-устройствах.
 
 ![image](https://user-images.githubusercontent.com/106802398/179574095-350979fc-43a4-4a58-a0ae-b3a165035a82.png)
 
9)Создайте общую volume-group на этих двух PV.
 
 ![image](https://user-images.githubusercontent.com/106802398/179574378-7157be6f-e303-44d6-aee1-3314a107700f.png)
 
10)Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.
 
 ![image](https://user-images.githubusercontent.com/106802398/179574543-0150dd3b-485c-414b-bb89-9fa697d333ed.png)
 
11)Создайте mkfs.ext4 ФС на получившемся LV.
 
 ![image](https://user-images.githubusercontent.com/106802398/179574642-b205def0-fea4-4ca0-914c-df5429dca2fe.png)

12)Смонтируйте этот раздел в любую директорию, например, /tmp/new.
 
 ![image](https://user-images.githubusercontent.com/106802398/179574839-bdb10448-be73-40c3-a700-9105b3535d0d.png)

13)Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz.
 
 ![image](https://user-images.githubusercontent.com/106802398/179575068-a618b738-f7c5-4edc-9113-0257d1dc6f71.png)

14)Прикрепите вывод lsblk.

 ![image](https://user-images.githubusercontent.com/106802398/179575173-f6e920b2-cb2e-4c36-9f3f-fd03b201aac8.png)

15)Протестируйте целостность файла

![image](https://user-images.githubusercontent.com/106802398/179575501-1911b7cb-5ca6-430f-af04-c45da15282ba.png)

16)Используя pvmove, переместите содержимое PV с RAID0 на RAID1.
 
 ![image](https://user-images.githubusercontent.com/106802398/179575720-7a86b4bf-be54-4005-b1ce-9d0b2aca5140.png)

17)Сделайте --fail на устройство в вашем RAID1 md.
 
 ![image](https://user-images.githubusercontent.com/106802398/179575843-f6f9ab1b-d3c8-4a8b-aecc-5344098aab94.png)

18)Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.
 
 ![image](https://user-images.githubusercontent.com/106802398/179576122-255d1a13-2457-4456-9838-8c132a1b0528.png)

19)Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен
 
 ![image](https://user-images.githubusercontent.com/106802398/179576245-c304ec58-30f1-49cd-a4ee-319375c5cb52.png)

20)Погасите тестовый хост, vagrant destroy.
 
 ![image](https://user-images.githubusercontent.com/106802398/179576426-6ae1cd27-3be5-4c75-8012-43649659f8fb.png)

 # Домашнее задание к занятию "3.6. Компьютерные сети, лекция 1"
 
1)Работа c HTTP через телнет.
 
 ![image](https://user-images.githubusercontent.com/106802398/179578298-2c0a9acc-66a0-49f7-ae3b-84177cb3e93f.png)

2)Повторите задание 1 в браузере, используя консоль разработчика F12.
 
 HTTP 307 Internal Redirect
 
 Oзначает, что ресурс был временно перемещён в URL, указанный в Location (https://stackoverflow.com/). При этом для перенаправленного запроса тело и метод запроса не 
 будут изменены.
 
 ![image](https://user-images.githubusercontent.com/106802398/179579442-22ff102f-e520-4096-bceb-837ac1fc1c83.png)

3)Какой IP адрес у вас в интернете?
 
 185.177.125.211
 
4)Какому провайдеру принадлежит ваш IP адрес? Какой автономной системе AS? Воспользуйтесь утилитой whois
 
 ![image](https://user-images.githubusercontent.com/106802398/179579803-a700c328-2513-4142-8d89-cefa05b1fc78.png)

5)Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8? Через какие AS? Воспользуйтесь утилитой traceroute
 
 ![image](https://user-images.githubusercontent.com/106802398/179580160-3e61be35-fd8a-419e-bddd-2d36bc09863f.png)

6)Повторите задание 5 в утилите mtr. На каком участке наибольшая задержка - delay?
 
 ![image](https://user-images.githubusercontent.com/106802398/179580761-398b2fdd-0c1e-4219-b97a-c51a3834b18a.png)

7)Какие DNS сервера отвечают за доменное имя dns.google? Какие A записи? воспользуйтесь утилитой dig
 
 ![image](https://user-images.githubusercontent.com/106802398/179580995-ccd4d923-38e8-44be-ac45-fce418b6fba0.png)

8)Проверьте PTR записи для IP адресов из задания 7. Какое доменное имя привязано к IP? воспользуйтесь утилитой dig
 
 ![image](https://user-images.githubusercontent.com/106802398/179581121-020e6d13-c853-4f0d-a1fa-1b90961f8e31.png)

 # Домашнее задание к занятию "3.7. Компьютерные сети, лекция 2"
 
1)Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?
 
 Linux - ipfconfig, ip a, ip link
 
 Windows - ipconfig /all
 
2)Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого?
 
 LLDP, пакет lldpd.
 
 lldpd  [-dxcseiklrv]  [-D debug]  [-S description]  [-P platform]  [-X socket]  [-m management]
 [-u file]  [-I interfaces]  [-C interfaces]  [-M class]  [-H hide]  [-L lldpcli]
 
3)Какая технология используется для разделения L2 коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига.
 
 VLAN (Virtual Local Area Network)
 
 sudo modprobe 8021q
 
 lsmod | grep 8021q
 
 apt install vlan
 
 vconfig add eth0 300
 
 ip link set eth0.300 up
 
 ip a add 192.168.31.3/255.255.255.0 dev eth0.300
 
 ip addr
 
 vconfig status deprecated
 
 ip link add link eth0 name eth0.301 type vlan id 301
 
 ip link set eth0.301 up
 
 ip a add 192.168.32.3/255.255.255.0 dev eth0.301
 
 vi /etc/netplan/01-netcfg.yaml
 
 network:
 
  version: 2
 
  ethernets:
 
    eth0:
 
    dhcp4: true
 
    vlans:
                eth0.400:
 
                              id: 400
 
                                    link: eth0
 
                                          addresses: [192.168.50.3/24]
 
 netplan apply
 
4)Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига.
 
 Team и Bonding.
 
 0 - balance-rr - (round-robin)

1 - active-backup

2 - balance-xor

3 - broadcast

4 - 802.3ad - (dynamic link aggregation)

5 - balance-tlb - (adaptive transmit load balancing)

6 - balance-alb - (adaptive load balancing)
 
config vi /etc/netplan/01-netcfg.yaml
 
 version: 2
ethernets:
        eth0:
                dhcp4: true
        eth1:
                dhcp4: no
        eth2:
                dhcp4: no
bonds:
        bond0:
                addresses: [192.168.50.3/24]
 
                interfaces: [eth1, eth2]
 
                parameters:
                        mode: balance-rr
 
5)Сколько IP адресов в сети с маской /29 ? Сколько /29 подсетей можно получить из сети с маской /24. Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.
 
 /29 = 8 Доступны 6. 2 адреса технические.
 
 /24 = 32.
 
 Пример /29
 
10.10.10.40/29
10.10.10.48/29
10.10.10.56/29
10.10.10.64/29
10.10.10.72/29
10.10.10.80/29
10.10.10.88/29
10.10.10.96/29
 
6)Задача: вас попросили организовать стык между 2-мя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP адреса? Маску выберите из расчета максимум 40-50 хостов внутри подсети.
 
 100.14.0.0/26
 
7)Как проверить ARP таблицу в Linux, Windows? Как очистить ARP кеш полностью? Как из ARP таблицы удалить только один нужный IP?

Linux зависит от дестрибутива - ip neighbour show, arp a, ip neighbour del [ip address] dev [interface], ip neighbour flush all.

Windows arp -a, arp -d [ip address], arp -d *

# Домашнее задание к занятию "3.8. Компьютерные сети, лекция 3"
 
1)Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP
 
 ![image](https://user-images.githubusercontent.com/106802398/180043543-9b62a1dd-5f2a-47c7-9097-87313b046534.png)

2)Создайте dummy0 интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.
 
 ![image](https://user-images.githubusercontent.com/106802398/180051034-8a94bb71-8e77-4a48-b970-d9e09948545f.png)

3)Проверьте открытые TCP порты в Ubuntu, какие протоколы и приложения используют эти порты? Приведите несколько примеров.
 
 ![image](https://user-images.githubusercontent.com/106802398/180048194-3e929426-49ff-4884-bbce-f86771734223.png)

 SSH = 22
 
 TELNET = 23
 
 HTTP = 80
 
4)Проверьте используемые UDP сокеты в Ubuntu, какие протоколы и приложения используют эти порты?
 
 ![image](https://user-images.githubusercontent.com/106802398/180048504-46e2db1c-5092-4b0d-8d11-5bf3c751f851.png)

5)Используя diagrams.net, создайте L3 диаграмму вашей домашней сети или любой другой сети, с которой вы работали.
 
 https://drive.google.com/file/d/1xEUxKhrBJEB6lcqqN1NomIC7a4S3Zvw-/view?usp=sharing

# Домашнее задание к занятию "3.9. Элементы безопасности информационных систем"
 
1)Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.

 Мне не требуется, понимание работы имеется.
 
2)Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.

 Пользовался TOTP authenticator

3)Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.

 ![image](https://user-images.githubusercontent.com/106802398/180065524-f4429b17-2f8f-4128-84fa-46aef4ecf1be.png)
 
![image](https://user-images.githubusercontent.com/106802398/180065451-f9c967fc-51c0-48b3-8c97-6952ce05521c.png)

4)Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК 
 ... и тому подобное).

![image](https://user-images.githubusercontent.com/106802398/180054503-821379e7-83bd-42f0-a916-ad36d2d82b82.png)

5)Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.

![image](https://user-images.githubusercontent.com/106802398/180059369-47346960-7ca1-4aa0-b2f0-9056d334705c.png)

6)Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.

 ![image](https://user-images.githubusercontent.com/106802398/180061776-de34a7ca-13d7-417a-84c5-f8b76ac02bd1.png)


7)Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.
 
 ![image](https://user-images.githubusercontent.com/106802398/180063506-840a63a6-d71a-4e8a-8db3-19020216ce19.png)

 
 Wireshark пользовался, понимаю.
