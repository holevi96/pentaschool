<?php
/**
 * Sage includes
 *
 * The $sage_includes array determines the code library included in your theme.
 * Add or remove files to the array as needed. Supports child theme overrides.
 *
 * Please note that missing files will produce a fatal error.
 *
 * @link https://github.com/roots/sage/pull/1042
 */
$sage_includes = [
  'lib/assets.php',    // Scripts and stylesheets
  'lib/extras.php',    // Custom functions
  'lib/setup.php',     // Theme setup
  'lib/titles.php',    // Page titles
  'lib/wrapper.php',   // Theme wrapper class
  'lib/customizer.php' // Theme customizer
];

foreach ($sage_includes as $file) {
  if (!$filepath = locate_template($file)) {
    trigger_error(sprintf(__('Error locating %s for inclusion', 'sage'), $file), E_USER_ERROR);
  }

  require_once $filepath;
}
unset($file, $filepath);

function penta_scripts() {
  global $post;
  wp_deregister_script('jquery');
  wp_enqueue_script( 'jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js', array(  ), null, true );
  if( get_post_type( $post ) === "tanfolyamok" && is_singular()){
    wp_enqueue_script( 'justflipit.min.js', get_stylesheet_directory_uri() . '/js/justflipit.min.js', array( 'jquery' ), false, true );
    wp_enqueue_script( 'single-tanfolyamok.js', get_stylesheet_directory_uri() . '/js/single-tanfolyamok.js', array( 'jquery' ), false, true );


  }

  wp_enqueue_script( 'parallax.js', get_stylesheet_directory_uri() . '/js/parallax.js', array( 'jquery' ), false, true );
  wp_enqueue_script( 'smooth-scroll.min.js', get_stylesheet_directory_uri() . '/js/smooth-scroll.min.js', array( 'jquery' ), false, true );
  wp_enqueue_script( 'scripts.js', get_stylesheet_directory_uri() . '/js/scripts.js', array( 'jquery' ), false, true );
  wp_enqueue_script( 'flickity.min.js', get_stylesheet_directory_uri() . '/js/flickity.min.js', array( 'jquery' ), false, true );
  wp_enqueue_script( 'custom.js', get_stylesheet_directory_uri() . '/js/custom.js', array( 'jquery' ), false, true );
}
add_action ('wp_enqueue_scripts', 'penta_scripts');
