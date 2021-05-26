<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://ru.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'wordpress' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'admin' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'admin' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'mysql-svc' );

// define('WP_HOME', 'http://192.168.99.100:5050');
//
// define('WP_SITEURL', 'http://192.168.99.100:5050');

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'H0Y:141m(AJU5+I`{NT=c76#:<hnhu#^rXN13~h+.@@*6=K<V%G}X@7xq(+~{uMn');
define('SECURE_AUTH_KEY',  '(tv3]kRhkdpC%W$6A}wp1U7+CD@=phW><=;8}fmN??&3^Ui(|. :T3-|NJkJ3<k-');
define('LOGGED_IN_KEY',    'WuslPqX:NMm)E1w/n=iP:&BvC6uNmLd$ug$[7m!r6+jzt1UZwu#+zB^,LO<+i!Yp');
define('NONCE_KEY',        '3kG{_BrlvimJjp yBf5X:(y>-?vD4d0sDIW}S8mc[ji9l0T3Ft5:>!qtP:#<y)UG');
define('AUTH_SALT',        'k$lCOrfBtS_)|=9sO2SFu <P4|!@JmjyQ/vZETo{Bw#2^OPQ)9~wAy`jBtmWTWpt');
define('SECURE_AUTH_SALT', '+bf%:*ZPE!xkc?z,DI_gt42-*x#V#j1-)7]U-LWqNq-n&l}@)K)tQ{#t?V1R&&Po');
define('LOGGED_IN_SALT',   '@)}OTn&|No{]]|r.n/$;qU|rwUKqIY&U_kd6SS?S|bZv[?eU c#)P[mhH9,s@<C(');
define('NONCE_SALT',       '/Uq/7ryUFA@@e*A4^.,0=7kvhgysFH&DRow@B}-U+-Sg{)alwUNC+13s;Q--395Y');


/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в документации.
 *
 * @link https://ru.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';