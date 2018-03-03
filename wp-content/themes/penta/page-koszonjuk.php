<?php while (have_posts()) : the_post(); ?>
    <article <?php post_class(); ?>>

        <h1 class="entry-title"><?php the_title(); ?></h1>
        <?php get_template_part('templates/entry-meta'); ?>

        <?php wp_link_pages(['before' => '<nav class="page-nav"><p>' . __('Pages:', 'sage'), 'after' => '</p></nav>']); ?>

        <div class="main-container bg--primary">
            <?php
                $absolute =  $_GET['pdf'];
            $x = explode('/', $absolute);
            $pdf_name = $x[count($x)-1];
            $url = get_stylesheet_directory_uri() . "/pdf/".$pdf_name;

            ?>
            <a href="<?php echo $url; ?>">Itt töltheted le a PDF-et!</a>
        </div>
    </article>
<?php endwhile; ?>