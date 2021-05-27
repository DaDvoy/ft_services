# ft_services

***FIRST STEP***

1) install brew - "curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh"
2) Проверить что docker установлен
3) "brew install minikube" (если minikube не устанавливается, или устанавливается но его нет на терминале, его можно скачать вот так: 
"curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && chmod +x minikube"
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

**InfluxDB - Telegraf - Grafana***

![tick-stack-diagram](https://user-images.githubusercontent.com/73754164/119744500-d4d38000-be94-11eb-982c-0071789dc61c.png)

Называют они этот стек технологий TICK stack - по первым буквам (Telegraf, Influxdb, Chronograf, Kapacitor).

В рамках этого поста мы упрощаем эту схему и она принимает следующий вид:

![influxdata_tick-2](https://user-images.githubusercontent.com/73754164/119744578-fe8ca700-be94-11eb-9740-3813310848c0.png)

- query - запрос
- queues - очереди

*Telegraf* :

*devtmpfs* --- devtmpfs - файловая система с автоматическими узлами устройства, заполненными ядром Это означает, что вам не нужно ни запускать udev, ни создавать статическую /devкомпоновку с дополнительными, ненужными и отсутствующими узлами устройства. Вместо этого ядро ​​заполняет соответствующую информацию на основе известных устройств.
Kay Sievers послал в LKML патч, реализующий создание tmpfs на ранней стадии инициализации ядра и динамическое заполнение получившейся файловой системы. После монтирования корневой файловой системы, этот экземпляр tmpfs перемонтируется ядром в каталог /dev. Таким образом, "init=/bin/sh" работает без каких-либо статических устройств и вспомогательных программ. Все устройства имеют по умолчанию владельца root, группу root и права 0600, но эти параметры можно изменить (например, с помощью chown, chmod или udev).

*tmpfs* --- Tmpfs — временное файловое хранилище во многих Unix-подобных ОС. Предназначена для монтирования файловой системы, но размещается в ОЗУ вместо физического диска. Подобная конструкция является подобной RAM-диску. Все данные в Tmpfs являются временными, в том смысле, что ни одного файла не будет создано на жёстком диске. После перезагрузки все данные, содержащиеся в Tmpfs, будут утеряны.

*devfs* --- devfs — это динамическая файловая система, предназначенная для управления файлами устройств. Не забывайте, что в UNIX-подобных системах все сущее является файлами. Это относится и к физическим устройствам. Для каждого устройства в системе имеется свой файл устройства в каталоге /dev. 

*iso9660* --- ISO 9660 — стандарт, выпущенный Международной организацией по стандартизации, описывающий файловую систему для дисков CD-ROM. Также известен как CDFS (Compact Disc File System). Целью стандарта является обеспечить совместимость носителей под разными операционными системами, такими, как Unix, Mac OS, Windows.

*overlay* --- Overlay (оверлей) — метод программирования, позволяющий создавать программы, занимающие больше оперативной памяти, чем установлено в системе. Метод заключается в разделении программы на исполняемые блоки, которые поочерёдно записываются в одну область памяти поверх предыдущих, выполняют свои функции и перезаписываются следующими.

*aufs* --- Aufs — полностью переписанный код UnionFS, который нацелен на улучшение стабильности и производительности. Кроме того, в нём представлены некоторые новые понятия, такие как балансирование записываемой ветви и другие улучшения.

*squashfs* --- Squashfs (.sfs) — сжимающая файловая система для GNU/Linux, предоставляющая доступ к данным в режиме «только для чтения». Squashfs сжимает файлы, индексные дескрипторы и каталоги, а также поддерживает блоки размером до 1024 Кбайт для лучшего сжатия. Кроме того Squashfs является свободным ПО (используется лицензия GPL).
Squashfs предназначена для широкого использования файловых систем «только для чтения», а также в ограниченных по размеру блочных устройствах/системах хранения (то есть во встраиваемых системах), где необходимы низкие затраты на производство.

***---***

**FTPS**

*FTPS* --- FTPS (File Transfer Protocol + SSL, или FTP/SSL) — это расширение широко используемого протокола передачи данных FTP, которое добавляет поддержку для криптографических протоколов уровней транспортной безопасности и защищенных сокетов.

SSL (англ. Secure Sockets Layer — уровень защищённых сокетов) — криптографический протокол, который подразумевает более безопасную связь.
Протокол SSL обеспечивает защищённый обмен данными за счёт двух следующих элементов:

 - Аутентификация
 - Шифрование

SSL использует асимметричную криптографию для аутентификации ключей обмена, симметричный шифр для сохранения конфиденциальности, коды аутентификации сообщений для целостности сообщений.

Протокол SSL предоставляет «безопасный канал», который имеет три основных свойства:

 - Канал является частным. Шифрование используется для всех сообщений после простого диалога, который служит для определения секретного ключа.
 - Канал аутентифицирован. Серверная сторона диалога всегда аутентифицируется, а клиентская делает это опционально.
 - Канал надёжен. Транспортировка сообщений включает в себя проверку целостности.

В 1994 году, компания Netscape разработала и опубликовала протокол SSL - обертку над протоколами уровня приложений (согласно стеку протоколов TCP/IP).

TCP/IP — сетевая модель передачи данных, представленных в цифровом виде. Модель описывает способ передачи данных от источника информации к получателю. В модели предполагается прохождение информации через четыре уровня, каждый из которых описывается правилом (протоколом передачи). Наборы правил, решающих задачу по передаче данных, составляют стек протоколов передачи данных, на которых базируется Интернет.

*vsftpd* --- vsftpd (англ. Very Secure FTP Daemon) — FTP-сервер с поддержкой IPv6 и SSL. Vsftpd (Very Secure Ftp Daemon) это программа, создающая легковесный, защищённый FTP-сервер. Vsftpd написан с упором на безопасность, и поддерживает как анонимный, так и не анонимный FTP доступ. 

*addgroup* и *adduser* --- adduser  и  addgroup  добавляют  пользователей  и  группы в систему. 
              
--system(-S):
              Создать системного пользователя или группу.                
              
 --group(-G): При совместном использовании с --system, создаётся группа с тем же именем и ID  как
              и  у  системного  пользователя.  Если  же --system не задана, то создаётся группа с
              указанным именем. Это является действием по умолчанию,  если  программа  вызывается
              как addgroup.
                          
--home "smt"
              Использовать  "smt"  в качестве домашнего каталога пользователя, а не как задаётся по
              умолчанию в файле настроек.  Если каталог не существует, то он будет создан и будут
              скопированы начальные файлы настроек.                          
              
*chpasswd* --- chpasswd - Читает файл пар имени пользователя и пароля и обновляет пароли. Эта команда предназначена для использования в большой системной среде, где одновременно создается много учетных записей.

*chown* --- chown (от англ. change owner) — UNIX‐утилита, изменяющая владельца и/или группу для указанных файлов. В качестве имени владельца/группы берётся первый аргумент, не являющийся опцией. Если задано только имя пользователя (или числовой идентификатор пользователя), то данный пользователь становится владельцем каждого из указанных файлов, а группа этих файлов не изменяется. Если за именем пользователя через двоеточие следует имя группы (или числовой идентификатор группы), без пробелов между ними, то изменяется также и группа файла.


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
