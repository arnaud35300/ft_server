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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'arguilla' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

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
define( 'AUTH_KEY',         'qb=lR*Fr]QwYj)6@.{ix<hm,U(3en^AAC4,sV~od,6fr&qT!jP:QV8zq-2K85U8z' );
define( 'SECURE_AUTH_KEY',  '+-; E,_7Y{tb{]da|?)@,GyFu8x5=dR$aI~y?Oochj1|X$+[i/`(G}i.errD$`Wy' );
define( 'LOGGED_IN_KEY',    'd~D3h:RfL:=,$W5*|bf)]0e4S=tq-3F?#OEN)BF|):jDyX#=Sl5,3RI8`xH{peB=' );
define( 'NONCE_KEY',        '=*0CsYQ3daypi<k%IL6?$@WvgI<<SV1MS5NQK=+1HUt&htkrg[C4wZ)`QV%__t&>' );
define( 'AUTH_SALT',        '],uSo@PdZ@$xs&GT?N/ZN<Q4$OSR{!jII_1|pHQ+u?z9E&%F},DF5peks)ulkA7n' );
define( 'SECURE_AUTH_SALT', '>[b]k3)N.9BQ ).=#Sa7LYM6 [${k6U_{GOI{s4D9fAnAhe=_dj$V=dvyI$(in?u' );
define( 'LOGGED_IN_SALT',   '$e1UlDGY??9E{Ex T|{16 >dH3ddU3dbJ]%yz*$_E-K)b@,9abme9Px:4:[nNme$' );
define( 'NONCE_SALT',       '.KrVli9w&lhjO5Jz6uI-zY=Y$*MEp<mT=n3m{cu7ZbWeV[^Oa5cbD W1z<<}vS:A' );

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
