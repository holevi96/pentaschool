<?php
/**
 * The template for displaying all single posts and attachments
 *
 * @package WordPress
 * @subpackage Twenty_Sixteen
 * @since Twenty Sixteen 1.0
 */

acf_form_head();
get_header(); ?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <?php
        // Start the loop.
        while ( have_posts() ) : the_post();
           acf_form(array(
               'field_groups' => array('252'),
               'post_id'		=> 'new_post',
               'new_post'		=> array(
                   'post_type'		=> 'valaszok',
                   'post_status'		=> 'publish',
                   'post_title'	=> 'Valasz'.date('yymmdd'),

               ),
               'submit_value' => "Értékelés elküldése",
               'updated_message' => __("Értékelés elküldve.", 'acf'),
               'html_after_fields' => '<h2>Ajánlás</h2> <textarea name="ajanlasszoveg" id="" cols="30" rows="10" placeholder="Ide írja az ajánlás szövegét!"></textarea>
                <input type="text" placeholder="Keresztnév" name="keresztnev"/>
                <input type="hidden" name="tanfolyamname" value="'. get_field('kapcsolodo_tanfolyam')[0] .'">
                    <br>
                <input type="text" name="cegnev" placeholder="Cégnév"/>'
           ));

            // End of the loop.
        endwhile;
        ?>

    </main><!-- .site-main -->

    <?php// get_sidebar( 'content-bottom' ); ?>

</div><!-- .content-area -->

<?php //get_sidebar(); ?>
<?php get_footer(); ?>
