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
    <?php comments_template('/templates/comments.php'); ?>

  </article>-->
    <div class="main-container">
      <section class="cover imagebg switchable height-50" data-overlay="8">
        <div class="background-image-holder"> <img alt="background" src="<?php echo get_stylesheet_directory_uri(); ?>/img/inner-4.jpg"> </div>
        <div class="container pos-vertical-center">
          <div class="row">
            <div class="col-md-5 col-sm-7">
              <div class="switchable__text">
                <h1><?php the_title(); ?></h1>
                <p class="lead"></p>
                <a class="btn btn--primary type--uppercase" href="#"> <span class="btn__text"><span>Jelentkezés</span></span>
                </a>
              </div>
            </div>
            <div class="col-md-6 col-sm-4 col-xs-12">
              <div class="video-cover border--round box-shadow-wide">
                <div class="background-image-holder"> <img alt="image" src="<?php echo get_stylesheet_directory_uri(); ?>/img/inner-4.jpg"> </div>
                <div class="video-play-icon"></div> <iframe data-src="https://www.youtube.com/embed/6p45ooZOOPo?autoplay=1" allowfullscreen="allowfullscreen"></iframe> </div>
            </div>
          </div>
        </div>
      </section>
      <section class="space--sm">
        <div class="container">
          <div class="row">
            <div class="col-sm-10 col-md-8">
              <h2>Időpontok:<br></h2>
            </div>
          </div>
        </div>
      </section>
      <section>
  <?php
  $kiirasok = get_posts(array(
      'post_type' => 'tanfolyam-kiiras',
      'meta_query' => array(
          array(
              'key' => 'kapcsolodo_tanfolyam', // name of custom field
              'value' => '"' . get_the_ID() . '"', // matches exaclty "123", not just 123. This prevents a match for "1234"
              'compare' => 'LIKE'
          )
      )

  ));
  ?>
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <div class="tabs-container tabs--folder tanfolyam-kiirasok-box">
                <ul class="tabs ">
                 <?php if(count($kiirasok) > 0){
                     $cnt = 0;
                  foreach ($kiirasok as $kiiras) { ?>
                  <li class="<?php echo ($cnt==0)?"active":"";?> bg--primary">
                    <div class="tab__title "> <span class="h6 color--primary"><?php echo get_field('kezdes',$kiiras->ID); ?> - <?php echo get_field('vege',$kiiras->ID); ?></span></div>
                    <div class="tab__content flexbox">
                      <div class="col-md-4  col boxed boxed--border bg--primary">
                        <ul>
                          <li><i class="icon icon--sm icon-Money"></i> <span>Listaár: <big><?php the_field('listaar');?> Ft.</big></span></li>
                          <hr>
                          <li><i class="icon icon--sm icon-Add-User"></i> <span>Szabad helyek száma: <big><?php echo get_field('maximum_letszam',$kiiras->ID); ?></big></span></li>
                          <hr>
                          <li><i class="icon icon--sm icon-Teacher"></i> <span>Oktató: <big><?php echo get_post(get_field('tanar',$kiiras->ID)[0])->post_title; ?></big></span></li>
                         <hr>
                          <li><i class="icon icon--sm icon-Map2"></i> <span>Helyszín: <big><?php echo get_post(get_field('helyszin',$kiiras->ID)[0])->post_title; ?></big></span></li>
                          <hr>
                        </ul>
                      </div>
                        <div class="col-md-4 col boxed boxed--border" >

                                <div class="front  box-shadow bg--secondary feature" style="">
                                    <h4>Jelentkezz a tanfolyamra!</h4>



<!--                                    <div class="idopontok boxed boxed--border" style=" margin-top: 10px;">-->
<!--                                        <!--<i class="icon icon--sm icon-Stopwatch"></i> <span>7 alkalom:</span>-->-->
<!---->
<!---->
<!--                                       -->
<!---->
<!--                                    </div>-->
                                    <a class="btn btn--lg btn--primary"
                                       href="file:///C:/Users/DELL/Documents/themeforest-19337626-stack-multipurpose-html-with-page-builder/Stack%201.5.1/tanfolyam-oldal2.html#">
                                        <span class="btn__text" style="color:#fff">Jelentkezés</span>
                                    </a>
                                </div>

<!--                            <div class="back  box-shadow bg--secondary feature" style="">-->
<!--                                <a class="btn btn--sm btn--primary reszletes_idopontok">-->
<!--                                    <span class="btn__text" style="color:#fff">Bezárás</span>-->
<!--                                </a>-->
<!--                            </div>-->
                        </div>
                      <div class="col-md-4 col boxed boxed--border bg--primary">
                        <div class="third-box box-shadow">
                            <h4>Napszak:</h4>
                            <p><?php echo get_field('napszak', $kiiras->ID); ?></p>
                            <h4>Időbeosztás:</h4>

                            <p><?php echo get_field('ido_beosztas', $kiiras->ID); ?></p>
                            <a class="btn btn--sm btn--primary reszletes_idopontok">
                                <span class="btn__text" style="color:#fff">Időpontok részletesen</span>
                            </a>
                            <p>
                                        <span class="tanf-price"><?php echo get_field('akcios_ar', $kiiras->ID); ?>
                                            Ft</span> <strike><?php the_field('listaar'); ?> Ft.</strike>
                            </p>
                            <h4 style="color:#fff;" class="color--primary1 .type--uppercase">Egyéb lehetőségek: </h4>
                            <p>
                                <a class="btn btn--lg btn more-options-button" href="file:///C:/Users/DELL/Documents/themeforest-19337626-stack-multipurpose-html-with-page-builder/Stack%201.5.1/tanfolyam-oldal2.html#" >
                                    <span class="btn__text">Érdekel egy <br/> későbbi időpontban!</span>
                                </a>
                            </p>
                            <p>
                                <a class="btn btn--lg more-options-button" href="file:///C:/Users/DELL/Documents/themeforest-19337626-stack-multipurpose-html-with-page-builder/Stack%201.5.1/tanfolyam-oldal2.html#" style="background: #fff;">
                                    <span class="btn__text">Kérdésem van!</span>
                                </a>
                            </p>
                            <p>
                                <a class=" btn btn--lg more-options-button" href="file:///C:/Users/DELL/Documents/themeforest-19337626-stack-multipurpose-html-with-page-builder/Stack%201.5.1/tanfolyam-oldal2.html#" style="background: #fff;">
                                    <span class="btn__text">Céges ajánlatot kérek!</span>
                                </a>
                            </p>

                        </div>
                      </div>

                    </div>
                  </li>
                  <?php $cnt++; } }; ?>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
<?php endwhile; ?>
