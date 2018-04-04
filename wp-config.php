<?php
/** 
 * A WordPress fő konfigurációs állománya
 *
 * Ebben a fájlban a következő beállításokat lehet megtenni: MySQL beállítások
 * tábla előtagok, titkos kulcsok, a WordPress nyelve, és ABSPATH.
 * További információ a fájl lehetséges opcióiról angolul itt található:
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} 
 *  A MySQL beállításokat a szolgáltatónktól kell kérni.
 *
 * Ebből a fájlból készül el a telepítési folyamat közben a wp-config.php
 * állomány. Nem kötelező a webes telepítés használata, elegendő átnevezni 
 * "wp-config.php" névre, és kitölteni az értékeket.
 *
 * @package WordPress
 */

// ** MySQL beállítások - Ezeket a szolgálatótól lehet beszerezni ** //
/** Adatbázis neve */
define('DB_NAME', 'penta');

/** MySQL felhasználónév */
define('DB_USER', 'root');

/** MySQL jelszó. */
define('DB_PASSWORD', '');

/** MySQL  kiszolgáló neve */
define('DB_HOST', 'localhost');

/** Az adatbázis karakter kódolása */
define('DB_CHARSET', 'utf8mb4');

/** Az adatbázis egybevetése */
define('DB_COLLATE', '');

/**#@+
 * Bejelentkezést tikosító kulcsok
 *
 * Változtassuk meg a lenti konstansok értékét egy-egy tetszóleges mondatra.
 * Generálhatunk is ilyen kulcsokat a {@link http://api.wordpress.org/secret-key/1.1/ WordPress.org titkos kulcs szolgáltatásával}
 * Ezeknek a kulcsoknak a módosításával bármikor kiléptethető az összes bejelentkezett felhasználó az oldalról. 
 *
 * @since 2.6.0
 */
define('AUTH_KEY', 'kf 6`_nc9EJ-G-F9ZB7QTK8S*LL+>v_?oWMLZqX(+9K-W,L~waWinp1t@aS6<L1^');
define('SECURE_AUTH_KEY', 'e=2[I_#x3NGhA}3cydip>lj5L|]?uB}1S]MDiT>sAAsVhQ*amu%a&6WfiI8xL8r%');
define('LOGGED_IN_KEY', 'HsQB1u2ZVMM#xq9E]b#wwCqGK)#/]>6zi;Fpz~VkWXRn|BNNf+-i:nNI=ma)7;(H');
define('NONCE_KEY', 'S,N`$@PEgQ %:Nhls,l~F55gVr)6[+ni00E&NiyT93*DH8^4<7I}0#{DPH]|_P.W');
define('AUTH_SALT',        '@|n-$IM(.:JLv1lXDATZm0y:l#b38$5ja~7Cm$L_Yvo<iE6Dzc>|0CKp{PvpC7Hf');
define('SECURE_AUTH_SALT', 'QlDvRxa1w3=`K=j{wu|/db3gBR*7!_ffyD~S:y4bC +9.D-@,U]3R;B|$Rb[/B(e');
define('LOGGED_IN_SALT',   'ZY*/:tyAxlbc`J-!mp(5i{n/K=m0^ef0$`SuU~Xf8a~Ut08MTvLCnj-SqfEfey1`');
define('NONCE_SALT',       'E/&dk<0i:i?,+%HVQzv82rzWW=`g_2#L6t8%W?2tuFScY:8>,j)2^P#6+hwurZZi');

/**#@-*/

/**
 * WordPress-adatbázis tábla előtag.
 *
 * Több blogot is telepíthetünk egy adatbázisba, ha valamennyinek egyedi
 * előtagot adunk. Csak számokat, betűket és alulvonásokat adhatunk meg.
 */
$table_prefix  = 'pe_';

/**
 * Fejlesztőknek: WordPress hibakereső mód.
 *
 * Engedélyezzük ezt a megjegyzések megjelenítéséhez a fejlesztés során. 
 * Erősen ajánlott, hogy a bővítmény- és sablonfejlesztők használják a WP_DEBUG
 * konstansot.
 */
define('WP_DEBUG', false);

/* Ennyi volt, kellemes blogolást! */

/** A WordPress könyvtár abszolút elérési útja. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Betöltjük a WordPress változókat és szükséges fájlokat. */
require_once(ABSPATH . 'wp-settings.php');
