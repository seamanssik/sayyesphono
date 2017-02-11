<?php
// HTTP
define('HTTP_SERVER', 'http://' . $_SERVER['HTTP_HOST'] . '/admin/');
define('HTTP_CATALOG', 'http://' . $_SERVER['HTTP_HOST'] . '/');

// HTTPS
define('HTTPS_SERVER', 'http://' . $_SERVER['HTTP_HOST'] . '/admin/');
define('HTTPS_CATALOG', 'http://' . $_SERVER['HTTP_HOST'] . '/');

// DIR
define('DIR_DOC_ROOT', getcwd() . '/');
define('DIR_ROOT', $_SERVER['DOCUMENT_ROOT'] . '/');
define('DIR_APPLICATION', DIR_DOC_ROOT);
define('DIR_SYSTEM', DIR_ROOT . 'system/');
define('DIR_IMAGE', DIR_ROOT . 'image/');
define('DIR_LANGUAGE', DIR_DOC_ROOT . 'language/');
define('DIR_TEMPLATE', DIR_DOC_ROOT . 'view/template/');
define('DIR_CONFIG', DIR_ROOT . 'system/config/');
define('DIR_CACHE', DIR_ROOT . 'system/storage/cache/');
define('DIR_DOWNLOAD', DIR_ROOT . 'system/storage/download/');
define('DIR_LOGS', DIR_ROOT . 'system/storage/logs/');
define('DIR_MODIFICATION', DIR_ROOT . 'system/storage/modification/');
define('DIR_UPLOAD', DIR_ROOT . 'system/storage/upload/');
define('DIR_CATALOG', DIR_ROOT . 'catalog/');

// DB
// DB
define('DB_DRIVER', 'mpdo');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'sayyesphoto');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
