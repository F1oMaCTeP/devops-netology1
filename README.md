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

2)Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.

grep <some_string> <some_file> -c

3)Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?

systemd

4)Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

ls /root 2>/dev/pts/~

5)Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

cat <omg >omg1

6)Получится ли находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

Echo "Priveti" > /dev/tty1

7)Выполните команду bash 5>&1. К чему она приведет? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?

bash 5>&1 - создает новый дескриптор 5 и перенаправляет его в поток вывода.
echo netology > /proc/$$/fd/5 - перенаправляет команду в созданный дескриптор

8)Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.

Возможно, требуется поменять потоки вывода и потоки ошибок.

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

● node_exporter.service - Prometheus Node Exporter
   Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: disabled)
   Active: active (running) since Fri 2022-07-15 11:01:41 MSK; 2min 22s ago
 Main PID: 2317 (node_exporter)
    Tasks: 4 (limit: 10926)
   Memory: 6.4M
   CGroup: /system.slice/node_exporter.service
           └─2317 /usr/local/bin/node_exporter

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
