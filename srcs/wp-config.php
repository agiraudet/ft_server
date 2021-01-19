<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpressdb' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ':iS4s]~}+e,eM05P4`5c]%%fh)>PT)wC<X9|{ )H]p5.:1Mu&+v]}0H9jz4g!xK!' );
define( 'SECURE_AUTH_KEY',  '&TMZ&,@)qn$xJ?3dV)jJ)0y*U)5-nP(HAdpGj8XU+u7@f;y7^fCyC.0N H?5= OW' );
define( 'LOGGED_IN_KEY',    'IH2:nw(&H_mFi{j/+H:^)C:hc,U@Lc[P2<GvM$0&)I[m&(aYenEk+3~Z?hCeE[t&' );
define( 'NONCE_KEY',        '_1V@Ybv]Us9]P(FK04s)=sjUC$(W9XADrr^n&jwH|sT#9.Nnt+7OdlCURVCM~U@o' );
define( 'AUTH_SALT',        'UQ!wbDPrV:-WWs%brl@%ZTw@)a[Hv2EdYge-AW&txKebSc;n[fRi!z^V+g`l8v6c' );
define( 'SECURE_AUTH_SALT', 'VOh{>wA^+ X}LpD$(Jg_VPa1V/eRC&ExF!^5Yul}]$zqV9`in]l$tXiszQl/wy7p' );
define( 'LOGGED_IN_SALT',   'PT[3XSL:9/T$IHDmkp]oQ[vgs^%9Bs9?/3VxiiusA|?sV)en@|`-sM<^:QOynn2b' );
define( 'NONCE_SALT',       '=F&z)t~45rAJ}?@4^xGQfY^Li>LA8aBLO4<C8Q;(s.`xu8CaY+L60{ .-(RL5ty$' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
