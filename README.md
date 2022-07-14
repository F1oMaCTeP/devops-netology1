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

#Домашнее задание к занятию "3.2. Работа в терминале, лекция 2"#

1)Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.

2)Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.

3)Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?

4)Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

5)Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

6)Получится ли находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

7)Выполните команду bash 5>&1. К чему она приведет? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?

8)Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.

9)Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?

10)Используя man, опишите что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe.

11)Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.

12)При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2.

13) Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.

14)sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.


