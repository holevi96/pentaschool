<?php
if ( have_posts() ) : ?>
    <section class="text-left tanarok">
    <div class="container">
    <div class="row">
<?php    while ( have_posts() ) : the_post(); the_title();?>

   <?php endwhile;?>

    </div>
    </div>
    </section>
<?php
else :
    echo wpautop( 'Sorry, no posts were found' );
endif;
?>


asdd