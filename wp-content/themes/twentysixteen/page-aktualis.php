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
        $aktual_ids = array();
        $kiirasok = get_posts(array(
            'post_type' => "tanfolyam-kiiras",
            'numberposts' => -1,
            'meta_key'			=> 'kezdes',
            'orderby'			=> 'meta_value',
            'order'				=> 'ASC'
        ));
        /*foreach($kiirasok as $kiiras){
            $aktual_ids[] = get_post(get_field('kapcsolodo_tanfolyam',$kiiras->ID)[0])->ID;
        }*/
        PC::tag($aktual_ids);

        /*$the_query = new WP_Query( array(
            'post_type' => 'tanfolyamok',
            'posts_per_page' => -1,
            'meta_query' => array(
                'relation' => 'OR',
                    array(
                        'key' => 'aktiv_tanfolyam_e', // name of custom field
                        'value' => '1',
                        'compare' => '=='
                    ),
                    array(
                        'key' => 'aktiv_tanfolyam_e',
                        'compare' => 'NOT EXISTS'
                    )
            ),
            'post__in' => $aktual_ids



        ));*/

        $the_query = new WP_Query(array(
            'post_type' => "tanfolyam-kiiras",
            'numberposts' => -1,
            'meta_key'			=> 'kezdes',
            'orderby'			=> 'meta_value',
            'order'				=> 'ASC'
        ));

        if ($the_query->have_posts()) : ?>
            <div id="pentafilter-box" effect-type="fade">
                <div class="pentafilter" termName="tanf">Összes</div>
                <?php
                $categories = get_categories(array(
                    'orderby' => 'name',
                    'order' => 'ASC'
                ));

                foreach ($categories as $category) { ?>
                    <div class="pentafilter"
                         termName="<?php echo $category->slug; ?>"><?php echo $category->name; ?></div>
                <?php }
                ?>
            </div>
            <br>
            <div id="pentaesti-filter-box" effect-type="fade">
                <div class="pentafilter" termName="nappali">Nappali</div>
                <div class="pentafilter" termName="esti">Esti</div>
            </div>
            <header class="page-header">
                <?php
                the_archive_title('<h1 class="page-title">', '</h1>');
                the_archive_description('<div class="taxonomy-description">', '</div>');
                ?>
            </header><!-- .page-header -->
            <div class='tanfolyamok'>
                <div style="display:none;" class='tanfolyam notfound'>
                    <h2>Jelenleg nincs akítv tanfolyamunk ebben a kategóriában.</h2>
                    <a href="/tanfolyamok">Összes tanfolyam</a>
                </div>
                <?php
                // Start the Loop.

                while ($the_query->have_posts()) : $the_query->the_post();
                    $ID = get_post(get_field('kapcsolodo_tanfolyam', get_the_ID())[0])->ID;
                    ?>

                    <div termName="tanf <?php echo get_field("napszak",get_the_ID()); ?> <?php foreach ((get_the_terms($ID, 'category')) as $term) {
                        echo $term->slug . ' ';
                    } ?>" class="tanfolyam">
                        <a href="<?php echo get_permalink($ID); ?>"><h2><?php echo get_post($ID)->post_title; ?></h2>
                        </a>
                        <i><?php echo get_field("kezdes", get_the_ID()); ?></i>
                    </div>

                <?php // End the loop.
                endwhile;
                ?>
            </div>
        <?php

        else :
            get_template_part('template-parts/content', 'none');

        endif;
        ?>

    </main>
    <!-- .site-main -->
</div><!-- .content-area -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
