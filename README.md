# devops-netology

Будут игнорироваться все файлы, каталоги с именем **/.terraform/*

Будут игнорироваться все файлы с окончанием *.tfstate

Будут игнорироваться все файлы с наименованием *.tfstate*

Будет игнорироваться файл с наименованием crash.log

# 2.4 Инструменты Git
1)Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea

aefead2207ef7e2aa5dc81a34aedf0cad4c32545

commit - Update CHANGELOG.md

2)Какому тегу соответствует коммит 85024d3?

TAG - tag: v0.12.23

3)Сколько родителей у коммита b8d720? Напишите их хеши.

56cd7859e05c36c06b56d013b55a252d0bb7e158

9ea88f22fc6269854151c571162c5bcf958bee2b

4)Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

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

8c928e835

6)Найдите все коммиты в которых была изменена функция globalPluginDirs.

78b122055 Remove config.go and update things using its aliases

52dbf9483 keep .terraform.d/plugins for discovery

41ab0aef7 Add missing OS_ARCH dir to global plugin paths

66ebff90c move some more plugin search path logic to command

8364383c3 Push plugin discovery down into command package

7)Кто автор функции synchronizedWriters?

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
