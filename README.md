# ft_services

***FIRST STEP***

1) install brew - "curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh"
2) Проверить что docker установлен
3) "brew install minikube" (если minikube не устанавливается, или устанавливается но его нет на терминале, его можно скачать вот так: 
"curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube"
- это инфа с оф.сайта kubernetes, после этого "mv minikube .minikube", и дальше по инструкции ниже)
4) mv .brew/.minikube ./goinfre
5) ln -s ./goinfre/.minikube .minikube
6) ln -s ./goinfre/.brew .brew


***----***

**Docker**

Узнать ID контейнера:

 - docker ps

Узнать IP контейнера:

 - docker inspect service_name | grep "IPAddress"
 
 service_name - ID контейнера
 
 IPAddress - так и пишется, ничего не нужно вставлять
 
***---***

**MySQL**

*openrc* --- OpenRC -  система инициализации на основе зависимостей, которая работает вместе с программой инициализации. OpenRC предоставляет обычные функции, ожидаемые от современной системы инициализации: загрузка на основе зависимостей, процесс сегрегации через cgroups конфигурации переменных среды. OpenRC состоит из нескольких модульных компонентов, основными из которых являются /init (необязательная), основная система управления зависимостями и демон-супервизор (необязательно). OpenRC работает путем сканирования уровней запуска, построения графа зависимостей и последующего запуска необходимых сценариевой службы. Он завершается после запуска скриптов.


*libc6-compat* --- Alpine предоставляет пакет под названием libc6-compat, который предоставляет библиотеки совместимости для glibc, а также символические ссылки / lib64 на / lib. Вместо того, чтобы загружать двоичный файл из ниоткуда, лучше использовать собственный пакет libc6-compat: "apk add --no-cache libc6-compat". А также удаление wget, сертификатов и findutils и других ненужных инструментов после загрузки или использование собственного wget без https. Таким образом, не нужно было бы удалять инструменты wget и certs, он просто использовал бы другой базовый контейнер и копировал загруженные файлы из первого.

*mysql* --- MySQL — свободная реляционная система управления базами данных. 

*mysql-client* --- MYSQL Client - это программы для общения с сервером для управления информацией в базах данных, которыми управляет сервер. Пример: mysql - это программа командной строки, которая выступает в качестве текстового интерфейса для сервера.

*mariadb* ---- MariaDB — ответвление от системы управления базами данных MySQL. Толчком к созданию стала необходимость обеспечения свободного статуса СУБД(Систе́ма управле́ния ба́зами да́нных(Database Management System - DBMS) — совокупность программных и лингвистических средств общего или специального назначения, обеспечивающих управление созданием и использованием баз данных), в противовес политике лицензирования MySQL компанией Oracle.

*mariadb-client* --- На подобии mysql-client, что бы иметь возможность подключаться к другим серверам баз данных.

**PHP-MyAdmin**

*--no-cache* --- Не использует кэш при создании образов. При создании образа Docker выполняет инструкции в вашем Dockerfile, выполняя их в указанном порядке. При проверке каждой инструкции Docker ищет в своем кэше существующее изображение, которое он может использовать повторно, а не создает новый (дублирующий) образ. 

*Пример:*

Допустим, пакет Bash обновлен в Alpine Linux для устранения проблемы безопасности. Наш Dockerfile не улавливает изменения и, следовательно, не восстанавливает образ. Это особенно верно при клонировании репозитория Git. Команда git clone, возможно, никогда не изменится, но репо изменится. Самое простое решение, чтобы избежать этих проблем, - просто вообще не использовать кеш. Аргумент no-cache полностью отбрасывает кеш, всегда выполняя все шаги Dockerfile.


*php-ldap* --- Lightweight Directory Access Protocol — «легковесный протокол доступа к каталогам». LDAP — относительно простой протокол, использующий TCP/IP и позволяющий производить операции аутентификации (bind), поиска (search) и сравнения (compare), а также операции добавления, изменения или удаления записей. Всякая запись в каталоге LDAP состоит из одного или нескольких атрибутов и обладает уникальным именем (DN — англ. Distinguished Name). Уникальное имя может выглядеть, например, следующим образом: «cn=Иван Петров,ou=Сотрудники,dc=example,dc=com». 

*iconv* --- утилита UNIX (и одноимённая библиотека) для преобразования текста из одной кодировки в другую.Утилита iconv конвертирует текст из одной кодировки в другую. Входная кодировка задаётся ключом -f, а выходная — ключом -t. Любая из этих кодировок по умолчанию равна локали системы. Все входные файлы читаются по очереди, если не задан параметр входного файла, то используется стандартный ввод, а конвертируемый текст выводится на стандартный вывод. Когда задана опция -c, символы, которые не могут быть преобразованы, просто выбрасываются. В противном случае при появлении подобной ошибки программа аварийно завершается. Когда задана опция -s, сообщения об ошибках не выводятся. Ключ -l выводит список доступных кодировок.


**WordPress:**

*php-soap* --- Simple Object Access Protocol(SOAP) — простой протокол доступа к объектам -  протокол обмена структурированными сообщениями в распределённой вычислительной среде. Первоначально SOAP предназначался в основном для реализации удалённого вызова процедур (RPC). Сейчас протокол используется для обмена произвольными сообщениями в формате XML, а не только для вызова процедур.

*php-fpm* --- FastCGI(FPM) - клиент-серверный протокол взаимодействия веб-сервера и приложения, дальнейшее развитие технологии CGI. FastCGI, вместо того чтобы создавать новые процессы для каждого нового запроса, использует постоянно запущенные процессы для обработки множества запросов. Это позволяет экономить время. В то время как CGI-программы взаимодействуют с сервером через STDIN и STDOUT запущенного CGI-процесса, FastCGI-процессы используют Unix Domain Sockets или TCP/IP для связи с сервером.

*php-mbstring* --- Mbstring предоставляет функции для работы с многобайтными строками и занимается конвертированием строк из одной кодировки в другую. Также предназначен для работы с Unicode-кодировками, такими, как UTF-8 и UCS-2.

*php-gettext* --- GetText:
 - освобождает наши скрипты от языкозависимых данных, точнее нам не надо будет заботиться о том, с каким языком будут работать наши скрипты;
 - предлагает набор утилит для работы с языковыми данными;
 - а также, разработки сторонних авторов позволяют в значительной степени облегчить труд переводчиков и стандартизировать данные;
 - и, очень важная особенность, если вы по каким-то причинам не перевели те или иные строки, скажем, на китайский, то GetText вернем вам их на языке поумолчанию (обычно английский), что очень удобно, так как освобождает нас от полного перевода всех текстов.

*php-curl* --- Curl(Client URL) - предназначена для проверки подключения к URL-адресам. Кроме того команда Curl — отличный инструмент передачи данных. Давайте же узнаем, как ею пользоваться. 

*php-gd* --- GD(Graphics Library) - поддерживает почти все существующие форматы графики для использования в веб: PNG, JPEG, GIF, ICO и различные методы работы с графическими файлами (применение фильтров, текст, изменение размера, и прочее). Часто используется для визуализации статистических файлов, а именно: графиков, диаграмм и т. д.

*php-intl* --- Intl - JavaScript объект, содержащий в себе функции форматирования чисел, дат и сравнения строк. 

*php-xml* --- XML — используется в SOAP (всегда) и REST-запросах (реже). Спецификация XML описывает XML-документы и частично описывает поведение XML-процессоров (программ, читающих XML-документы и обеспечивающих доступ к их содержимому). XML разрабатывался как язык с простым формальным синтаксисом, удобный для создания и обработки документов как программами так и человеком, с акцентом на использование в Интернете.

*php-xmlrpc* --- XML-RPC — стандарт/протокол вызова удалённых процедур, использующий XML для кодирования своих сообщений и HTTP в качестве транспортного механизма. Является прародителем SOAP, отличается исключительной простотой в применении.

*php7-opcache* --- у OPCache есть две основные функции:
 - Кэширование опкодов;
 - Оптимизация опкодов.

Опкод - код операции - часть машинного языка, называемую инструкцией, определяющую операцию, которая должна быть выполнена.Их определение и формат зависят от системы команд данного процессора (который может быть как главным процессором, так и более специализированным для работы в какой-либо конкретной области). В отличие от самого опкода, инструкция обычно имеет одно или больше определений для операндов (то есть данных) над которыми должна выполняться операция, хотя некоторые операции могут иметь явные операнды или совсем их не иметь.

*php-mysqli* --- MySQLI - "i" означает "improved".
MySQLi - это OOP-версия расширения MySQL. В конце концов, MySQLi и MySQL выполняют одно и то же: они являются расширением для взаимодействия с MySQL из PHP. Многие люди все еще используют исходное расширение MySQL вместо нового расширения MySQLi, потому что MySQLi требует MySQL 4.1.13+ и PHP 5.0.7+ .

*tar* --- tar -zxvf - извлечение нескольких файлов для (something).tar.gz
- f — указать имя файла архива. По умолчанию архив читается со стандартного ввода. -f - — явное задание чтения архива со стандартного ввода.

- c — создать архив и записать в него файлы;

- x — извлечь файлы из архива;
- t — просмотреть содержимое архива; формат вывода аналогичен команде ls –l; если имена файлов не указаны, то выводятся сведения обо всех файлах архива;

- z — использовать программу gzip для сжатия при архивировании файлов и для обратной распаковки архива перед извлечением из него файлов. Файлу сжатого архива принято давать с расширением .tar.gz или сокращённо .tgz;

- j — аналогично -z только для программы bzip2 и архивов с расширением .tar.bz2 или .tbz; В современных версиях tar опции вызова программы сжатия -z, -j и т.п. указывать не обязательно — формат архива распознаётся автоматически.

- p — при извлечении сохранить права доступа к файлам (по умолчанию сбрасываются права указанные в маске umask);

- v — выводить имена всех файлов, которые обрабатываются; если выбрана и опция t, то v дает больше информации о сохраненном файле, а не просто его имя.

*index.html* и *index.php* --- Индексный файл — это файл главной страницы папки на сайте, то есть тот файл, который загружается, когда посетитель обращается напрямую к какой-либо директории. По умолчанию индексным является файл с именем index.html, index.php, index.phtml или index.shtml. Но вы можете самостоятельно объявить индексным файл с любым другим именем. 
