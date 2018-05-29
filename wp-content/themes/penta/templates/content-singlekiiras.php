<?php while (have_posts()) : the_post(); ?>
<article <?php post_class(); ?>>
    <!--<header>
      <h1 class="entry-title"><?php the_title(); ?></h1>
      <?php get_template_part('templates/entry-meta'); ?>
    </header>
    <div class="entry-content">
      <?php the_content(); ?>
    </div>
    <footer>
      <?php wp_link_pages(['before' => '<nav class="page-nav"><p>' . __('Pages:', 'sage'), 'after' => '</p></nav>']); ?>
    </footer>


  </article>-->
    <div class="main-container">



        <section class="text-center imagebg" >
		<div class="background-image-holder"> <img alt="background" src="<?php echo get_stylesheet_directory_uri(); ?>/img/dropdown-1.jpg"> </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12  col-md-12 ">
                        <div class="boxed boxed--lg bg--dark subscribe-form-1">
                            <div class="col-sm-10 col-sm-offset-1 text-left">
							
                                <?php if(isset($_GET['jelentkezes'])):
                                    $form = GFFormsModel::get_form_meta(1);
                                    ?>
                                    <?php if(!isset($_GET['online'])): ?>
									<h4>Jelentkezés erre a tanfolyamra:</h4>
									<h3><?php echo get_post(get_field('kapcsolodo_tanf')[0])->post_title; ?></h3>
									 
                            <div class="idobeosztas">
                                <?php
                                    $megadas = get_field('alkalmak_megadasa',$kiiras->ID);

                                    if($megadas == 'napok'){?>
                                        <h5>A tanfolyam napjai:</h5>
                                        <ul class="bullets">
                                            <li><?php echo get_field('kezdes',$kiiras->ID);?></li>
                                            <?php $tovabbi_napok = get_field('tovabbi_napok',$kiiras->ID);
                                            if($tovabbi_napok){
                                                foreach ($tovabbi_napok as $nap) {?>
                                                  <li><?php echo $nap['tovabbi_nap'];?></li>
                                                <?php }

                                            }?>
                                            <li><?php echo get_field('vege',$kiiras->ID);?></li>
                                        </ul>
                                    <?php }else if($megadas == 'kezdet-veg'){ ?>
                                        <span>Kezdete:</span>
                                        <big><?php echo get_field('kezdes',$kiiras->ID);?></big>
                                        <hr>
                                        <span>Vége:</span>
                                        <big><?php echo get_field('vege',$kiiras->ID);?></big>
                                        <hr>
                                        <span>Napi beosztás:</span>
                                        <big><?php echo get_field('napi_beosztas',$kiiras->ID);?></big>
                                        <hr>
                                    <?php }?>

                                <span>Időbeosztás:</span>
                                 <span><?php echo get_field('idobeosztas', $kiiras->ID); ?></span>
                                <hr>
                            </div>
                                    <p><?php echo $form['description']; ?></p>
                                    <a class="btn btn--lg btn--primary"
                                       href="#">
                                        <span class="btn__text" style="color:#fff;width:100%">Hagyományos jelentkezési lap</span>
                                    </a>
                                    <a class="btn btn--lg btn--primary"
                                       href="<?php echo get_permalink(); ?>?jelentkezes&online">
                                        <span class="btn__text" style="color:#fff;width:100%">Online jelentkezés</span>
                                    </a>
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
                                } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>
    <?php endwhile; ?>
