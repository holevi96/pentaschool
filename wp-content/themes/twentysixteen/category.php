<?php
/**
 * The template for displaying archive pages
 *
 * Used to display archive-type pages if nothing more specific matches a query.
 * For example, puts together date-based pages if no date.php file exists.
 *
 * If you'd like to further customize these archive views, you may create a
 * new template file for each one. For example, tag.php (Tag archives),
 * category.php (Category archives), author.php (Author archives), etc.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WordPress
 * @subpackage Twenty_Sixteen
 * @since Twenty Sixteen 1.0
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

		<?php

global $wp_query;
$cat_id = $wp_query->queried_object->cat_ID;
$the_query = new WP_Query( array(
'post_type' => 'tanfolyamok',			
				'posts_per_page' => -1,
				'cat'=>$cat_id
			) );


		if ( $the_query->have_posts() ) : ?>
		<div id="pentafilter-box" effect-type="fade">

</div>
			<header class="page-header">
				<?php
					the_archive_title( '<h1 class="page-title">', '</h1>' );
					the_archive_description( '<div class="taxonomy-description">', '</div>' );
				?>
			</header><!-- .page-header -->
			<div class='tanfolyamok'>
			<?php
			// Start the Loop.
			
			while ( $the_query->have_posts() ) : $the_query->the_post();
			?>

			<div termName="<?php foreach((get_the_terms(get_the_ID(),'category')) as $term) { echo $term->slug. ' '; } ?>" class="tanfolyam"> 
			<a href="<?php echo get_permalink(); ?>"><h2><?php the_title(); ?></h2></a>
			</div>	

			<?php // End the loop.
			endwhile;
			?>
			</div>
<?php 
			
		// If no content, include the "No posts found" template.
		else :
			get_template_part( 'template-parts/content', 'none' );

		endif;
		?>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
