<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'arguilla' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );
define( 'AUTH_KEY',         'qb=lR*Fr]QwYj)6@.{ix<hm,U(3en^AAC4,sV~od,6fr&qT!jP:QV8zq-2K85U8z' );
define( 'SECURE_AUTH_KEY',  '+-; E,_7Y{tb{]da|?)@,GyFu8x5=dR$aI~y?Oochj1|X$+[i/`(G}i.errD$`Wy' );
define( 'LOGGED_IN_KEY',    'd~D3h:RfL:=,$W5*|bf)]0e4S=tq-3F?#OEN)BF|):jDyX#=Sl5,3RI8`xH{peB=' );
define( 'NONCE_KEY',        '=*0CsYQ3daypi<k%IL6?$@WvgI<<SV1MS5NQK=+1HUt&htkrg[C4wZ)`QV%__t&>' );
define( 'AUTH_SALT',        '],uSo@PdZ@$xs&GT?N/ZN<Q4$OSR{!jII_1|pHQ+u?z9E&%F},DF5peks)ulkA7n' );
define( 'SECURE_AUTH_SALT', '>[b]k3)N.9BQ ).=#Sa7LYM6 [${k6U_{GOI{s4D9fAnAhe=_dj$V=dvyI$(in?u' );
define( 'LOGGED_IN_SALT',   '$e1UlDGY??9E{Ex T|{16 >dH3ddU3dbJ]%yz*$_E-K)b@,9abme9Px:4:[nNme$' );
define( 'NONCE_SALT',       '.KrVli9w&lhjO5Jz6uI-zY=Y$*MEp<mT=n3m{cu7ZbWeV[^Oa5cbD W1z<<}vS:A' );
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
