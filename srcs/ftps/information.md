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