<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package pentatheme
 */

get_header(); the_post();?>


				<div class="masthead clearfix">
					<div class="inner clearfix">
						<h3 class="masthead-brand">Pentaschool</h3>
						<nav>
							<ul class="nav masthead-nav">
								<li class="active"><a href="#">Home</a></li>
								<li><a href="#">Features</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
<div class=" mt50">
	<?php the_content(); ?>
</div>

<?php
get_footer();
