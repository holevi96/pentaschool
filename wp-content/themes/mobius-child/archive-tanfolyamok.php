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

	<div class="to-page-heading standard">
		<div class="section-container">
			<div class="col col-12 col-last">
				<div class="col col-6 col-last">
					<h1 class="single-title">	
					Tanfolyamok
					</h1>
				</div>
			</div>
		</div>
	</div>
<section>
<div class="section-container container-search">
		<?php
$the_query = new WP_Query( array(
			'post_type' => 'tanfolyamok',			
			'posts_per_page' => -1,
 ));

		if ( $the_query->have_posts() ) : ?>
<div id="pentafilter-box" class="clearfix" effect-type="fade">
	<?php 
	$categories = get_categories( array(
		'orderby' => 'name',
		'order'   => 'ASC'
	) );
 
	foreach( $categories as $category ) { ?>
		<div class="pentafilter" termName="<?php echo $category->slug; ?>"><a class="button" href="#"><?php echo $category->name; ?></a></div>
	<?php } ?>
</div>



			        <?php if(have_posts()) : ?>
			<ul class="to-search-items clearfix tanfolyamok">
				<li class='to-search-item to-search-archive tanfolyam notfound'>
					<div class="to-search-item-img">
                        <a href="#"></a>
					</div>
                    <div class="to-search-item-content">
                        <h3 class="accentColorHover"><a href="/tanfolyamok">Nincs találat</a></h3>
						<?php themeone_single_meta() ?>
                        <div class="to-search-item-excerpt"><p>Jelenleg nincs akítv tanfolyamunk ebben a kategóriában. Kattintson ide az összes tanfolyam megtekintéséhez!</p></div>
                    </div>
				</li>
				<?php 
				while (have_posts()) : the_post();
				global $more;
				$more = -1; 
				$post_id      = $post->ID;
				$post_type    = get_post_type( $post_id );
				$post_thumb   = get_the_post_thumbnail( $post_id ,'thumbnail');
				$post_title   = get_the_title();
				$post_link    = esc_url(get_permalink( $post_id ));
				$post_content = themeone_get_excerpt(300,'',$post_id);
				$post_date    = get_the_time('F j, Y');
				$post_like    = getPostLikeLink( $post_id );
				$post_coms    = '<span class="to-comment-icon"><i class="fa fa-comment-o"></i>'. get_comments_number() .'</span>';

				if ( $post_type == 'post' ) {
					$post_type = __('blog', 'mobius');
				} 
				?>
				<li class="to-search-item to-search-archive tanfolyam" termName="<?php foreach((get_the_terms(get_the_ID(),'category')) as $term) { echo $term->slug. ' '; } ?>">
                	<div class="to-search-item-img">
                        <a href="<?php echo $post_link; ?>">
                        <?php
						if (get_post_format($post_id) == 'gallery') {
							$gallery_ids = themeone_grab_ids_from_gallery();
							if (!empty($gallery_ids)) {
								$post_thumb  = array_slice($gallery_ids, 0, 1);
								$post_thumb  = array_shift($post_thumb);
								$post_thumb  = wp_get_attachment_image($post_thumb, 'thumbnail');
								echo $post_thumb;
							}
						} else {
							if ( $post_thumb != '' ) {
								echo $post_thumb; 
							} else if ( $post_thumb == '' && $post_type == 'page') {
								echo '<i class="fa fa-file-text-o accentBgHover"></i>';
							} else if ( $post_thumb == '' && $post_type == 'blog') {
								echo '<i class="fa fa-pencil accentBgHover"></i>';
							} else if ( $post_thumb == '' && $post_type == 'portfolio') {
								echo '<i class="fa fa-picture-o accentBgHover"></i>';
							} else if ( $post_thumb == '' && $post_type == 'product') {
								echo '<i class="steadysets-icon-bag accentBgHover"></i>';
							}
						}
						?>
                        </a>
					</div>
                    <div class="to-search-item-content">
                        <h3 class="accentColorHover"><a href="<?php echo $post_link; ?>"><?php echo $post_title; ?></a></h3>
                        <?php themeone_single_meta() ?>
                        <div class="to-search-item-excerpt"><p><?php echo $post_content; ?></p></div>
                    </div>
				</li>
				<?php 
				endwhile; 
				?>
			</ul>
			<?php else: ?>
			<h6 class="to-search-noresult"><?php echo __('Sorry, there are no posts to display.', 'mobius'); ?><br /><?php echo __('Please try to search again...', 'mobius'); ?></h6>
			<?php endif; ?>
<?php  else :
		//get_template_part( 'template-parts/content', 'none' );
		endif; ?>
		</div>
</section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
