<?php
$category = get_queried_object();

 $the_query = new WP_Query(array(
                        'post_type' => 'tanfolyamok',
                        'posts_per_page' => 50,
						'post_status' => 'publish',
						'order' => 'ASC',
						'meta_key' => '_reorder_term_category_excel',
						'orderby' => 'meta_value_num title'
						
                    ));
if (  $the_query->have_posts() ) : ?>
    <section class="text-left">
    <div class="container">
    <div class="row">
<?php    while ( $the_query->have_posts() ) : $the_query->the_post(); ?>
                                    <div class="col-sm-4 tanfolyam" termName="tanf <?php foreach ((get_the_terms(get_the_ID(), 'category')) as $term) { echo $term->slug . ' '; } ?>">
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
   <?php endwhile;?>

    </div>
    </div>
    </section>
<?php
else :
    echo wpautop( 'Sorry, no posts were found' );
endif;
?>