<?php
/**
 * The template for displaying all single posts and attachments
 *
 * @package WordPress
 * @subpackage Twenty_Sixteen
 * @since Twenty Sixteen 1.0
 */


get_header(); ?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <?php


        // Start the loop.
        while ( have_posts() ) : the_post(); ?>
			<h2><?php echo  get_post(get_field('kapcsolodo_tanfolyam',get_the_ID())[0])->post_title; ?></h2>
			<h3>Kezdés: <?php echo get_field('kezdes'); ?></h3>
		<?php if(isset($_GET['jelentkezes'])):
			$form = GFFormsModel::get_form_meta(1);
			?>
			<?php if(!isset($_GET['online'])): ?>
				<p><?php echo $form['description']; ?></p>
				<a href="#"><button>Hagyományos jelentkezési lap</button></a>
				<a href="<?php echo get_permalink(); ?>?jelentkezes&online"><button>Online jelentkezés</button></a>
			<?php endif;
		endif;
		if(isset($_GET['jelentkezes']) && isset($_GET['online'])){
			echo do_shortcode('[gravityform id="1" title="true" description="true" ajax="false"]');
		}
		if(isset($_GET['varolista'])){
			 echo do_shortcode('[gravityform id="7" title="true" description="true" ajax="false"]');
		}
		if(isset($_GET['erdeklodes'])){
			 echo do_shortcode('[gravityform id="5" title="true" description="true" ajax="false"]');
		}
		if(isset($_GET['ceg'])){
			 echo do_shortcode('[gravityform id="6" title="true" description="true" ajax="false"]');
		}
		if(isset($_GET['kerdes'])){
			  do_shortcode('[gravityform id="4" title="true" description="true" ajax="false"]');
		}

		endwhile;

		?>



    </main><!-- .site-main -->

    <?php get_sidebar( 'content-bottom' ); ?>

</div><!-- .content-area -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
