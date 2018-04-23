
<article <?php post_class(); ?>>

    <div class="main-container">
        <section class="imagebg" data-overlay="4">
            <div class="background-image-holder"> <img alt="background" src="<?php echo get_stylesheet_directory_uri(); ?>/img/hero-1.jpg"> </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h1>Az össezs tanfolyam</h1>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row">
                    <?php
                    $the_query = new WP_Query(array(
                        'post_type' => 'tanfolyamok',
                        'posts_per_page' => -1,
                    ));

                    if ($the_query->have_posts()) : ?>
                    <div id="pentafilter-box" effect-type="fade" class="clearfix">

                        <a class="btn btn--sm pentafilter" termName="tanf" href="#">
                            <span class="btn__text">Összes</span>
                        </a>
                        <?php
                        $categories = get_categories(array(
                            'orderby' => 'name',
                            'order' => 'ASC'
                        ));

                        foreach ($categories as $category) { ?>
                            <a class="btn btn--sm pentafilter" termName="<?php echo $category->slug; ?>" href="#">
                                <span class="btn__text"><?php echo $category->name; ?></span>
                            </a>
                        <?php } ?>
                    </div>
                    <div class="masonry clearfix">
                        <div class=" masonry--active tanfolyamok clearfix">

                            <?php
                            // Start the Loop.

                            while ($the_query->have_posts()) : $the_query->the_post();
                            ?>
                            <div class="col-sm-4 masonry__item tanfolyam" termName="tanf <?php foreach ((get_the_terms(get_the_ID(), 'category')) as $term) { echo $term->slug . ' '; } ?>">
                                <div class="card card-2 text-center">
                                    <div class="card__top">
                                        <a href="#"> <img alt="Image" src="<?php echo get_stylesheet_directory_uri(); ?>/img/placeholder-image4.jpg"> </a>
                                    </div>
                                    <div class="card__body">
                                        <h4><?php the_title(); ?></h4>

                                    </div>
                                    <div class="card__bottom text-center">
<!--                                        <div class="card__action"> <span class="h6 type--uppercase">Explore</span>-->
<!--                                            <a href="#"> <i class="material-icons">flip_to_front</i> </a>-->
<!--                                        </div>-->
<!--                                        <div class="card__action"> <span class="h6 type--uppercase">Save</span>-->
<!--                                            <a href="#"> <i class="material-icons">favorite_border</i> </a>-->
<!--                                        </div>-->
                                        <a class="btn" href="<?php the_permalink(); ?>">
                                            <span class="btn__text">Részletek</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        <?php endwhile; ?>
                        </div>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </section>




    </div>
