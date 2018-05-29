
  <article <?php post_class(); ?>>

    <div class="main-container">
        <section class="imagebg front-imagebg" data-overlay="4">
            <div class="background-image-holder"> <img alt="background" src="<?php echo get_stylesheet_directory_uri(); ?>/img/hero-2.jpg"> </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h1>Aktuális tanfolyamaink:</h1>
                    </div>
                </div>
            </div>
        </section>
		<section>
		
                <div class="container">
                        <?php
						$aktual_ids = array();
                        $kiirasok = get_posts(array(
                            'post_type' => "tanfolyam-kiiras",
                            'numberposts' => -1,
                            'meta_key' => 'kezdes',
                            'orderby' => 'meta_value',
                            'order' => 'ASC'
                        ));

                        
                        $the_query = new WP_Query(array(
                            'post_type' => "tanfolyam-kiiras",
                            'numberposts' => -1,
                            'meta_key' => 'kezdes',
                            'orderby' => 'meta_value',
                            'order' => 'ASC'
                        ));
                        if ($the_query->have_posts()) : ?>
                        <div class="col-md-12 col-sm-12 ">
                            <div class="process-1 tanfolyamok">
                                <div class="process__item tanfolyam notfound" style="display:none;">
                                    <h4>Jelenleg nincs tanfolyamunk ebben a kategóriában.</h4>
                                </div>
								<?php
                // Start the Loop.
				
                $cnt = 1;
				$honapok = array();
                        $honapok[1] = 'Január';
                        $honapok[2] = 'Február';
                        $honapok[3] = 'Március';
                        $honapok[4] = 'Április';
                        $honapok[5] = 'Május';
                        $honapok[6] = 'Június';
                        $honapok[7] = 'Július';
                        $honapok[8] = 'Augusztus';
                        $honapok[9] = 'Szeptember';
                        $honapok[10] = 'Október';
                        $honapok[11] = 'November';
                        $honapok[12] = 'December';
                while ($the_query->have_posts()) : $the_query->the_post();
                    $ID = get_post(get_field('kapcsolodo_tanf', get_the_ID())[0])->ID;

                    ?>

                                <div visible="visible" termName="tanf <?php echo get_field("napszak",get_the_ID()); ?> <?php foreach ((get_the_terms($ID, 'category')) as $term) {echo $term->slug . ' ';} ?>" class="process__item tanfolyam <?php echo ($cnt%2 ==0)?'odd':'even';  ?>">
                                    <div class="box-month"><?php
                                        $elso_alkalom = get_field('kezdes');
                                        $time = strtotime($elso_alkalom);

                                        $month = (int)DateTime::createFromFormat('Y.m.d', $elso_alkalom)->format('n');

                                        echo $honapok[$month];
                                        ?></div>
                                    <h4><a href="<?php echo get_permalink($ID); ?>"><?php echo get_post($ID)->post_title; ?></a></h4>
                                    <?php
                                    $kapcs_tanf = get_field('kapcsolodo_tanf')[0];
                                    $listaar = get_field('listaar',$kapcs_tanf);
                                    $akcios = get_field('akcios_ar');

                                    $szabad_helyek = get_field('maximum_letszam') - get_field('beiratkozva');
									$napszak = get_field('napszak');
									if($napszak == 'nappali'){
                                        $ikon = 'icon-Sun';
                                    }else{
                                        $ikon = 'icon-Half-Moon';
                                    }

									$elso_alkalom = get_field('kezdes');
									$vege = get_field('vege');

									if(get_field('alkalmak_megadasa') == 'napok'){
                                        $idobeosztas = get_field('idobeosztas');
                                    }else{
                                        $idobeosztas = get_field('napi_beosztas') . ', ' . get_field('idobeosztas');
                                    }

									$excerpt = $kapcs_tanf->post_excerpt;

                                    $van_e_akcio = false;
                                    $szazalek = 0;
                                    if($akcios<$listaar){
                                        $van_e_akcio = true;
                                        $szazalek = round((1-($akcios / $listaar))*100);
                                    }
                                    $betelt = (get_field('maximum_letszam') == get_field('beiratkozva'));
                                    ?>
                                    <div class="datenumber">
                                        <?php echo substr($elso_alkalom,-2); ?>
                                    </div>
                                    <ul>
                                        <li><i class="icon icon--sm  icon-Calendar-3"></i><span><?php echo $elso_alkalom . ' - '. $vege; ?></span></li>
                                        <li><i class="icon icon--sm <?php echo $ikon; ?>"></i> <span><?php echo $idobeosztas; ?></span></li>
                                        <li><b><?php echo ($betelt)?'Beltelt! </b>': $szabad_helyek . ' </b><span>szabad hely</span>'; ?></li>
                                    </ul>

                                    <div class="row fooldal-ar">
                                        <div class="col-md-6">
                                            <?php if($van_e_akcio): ?>
                                                <span class="kedvezmeny"><?php echo $szazalek; ?> % kedvezmény!</span>
                                           <?php  endif;?>
                                        </div>
                                        <div class="col-md-6">
                                            <?php if($van_e_akcio): ?>
                                            <div class="row">
                                                <strike><?php echo number_format($listaar, 0, ',', ' '); ?> Ft.</strike>
                                            </div>

                                            <?php endif; ?>
                                            <div class="row">
                                                <span><?php echo number_format($akcios, 0, ',', ' '); ?>Ft</span>
                                            </div>
                                        </div>


                                    </div>

                                <div class="overlay">
                                    <p class="clearfix"><?php echo get_post($ID)->post_excerpt; ?></p>
                                    <div class="overlay-buttons">
                                        <a class="btn btn--lg btn--primary"
                                           href="<?php echo get_permalink($ID); ?>?id=<?php echo get_the_ID(); ?>">
                                            <span class="btn__text" style="color:#fff;width:100%">Részletek</span>
                                        </a>
                                        <?php if(!$betelt){ ?>
                                            <a class="btn btn--lg more-options-button"
                                               href="<?php echo get_permalink(); ?>?jelentkezes">
                                                <span class="btn__text">Jelentkezés</span>
                                            </a>
                                        <?php }else{ ?>
                                            <a class="btn btn--lg more-options-button"
                                               href="<?php echo get_permalink(); ?>?varolista">
                                                <span class="btn__text">Várólistára jelentkezés</span>

                                            </a>
                                            <div class="question-tooltip" data-tooltip="Nem értem, ez mi a szar?">?</div>
                                        <?php } ?>

                                    </div>

                                </div>




                                </div>
							<?php $cnt++; endwhile; ?>
                                
                            </div>
                        </div>
						<!--<div class="col-md-3">
						<?php  dynamic_sidebar('sidebar-tanfolyam'); ?>
						<?php echo file_get_contents_utf8('http://pentaschool.hu/Include/excelbazis_feed_html.txt'); ?>
						</div>-->
					<?php endif; ?>
                </div>
            </section>
    </div>

