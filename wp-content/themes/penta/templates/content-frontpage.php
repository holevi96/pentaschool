
  <article <?php post_class(); ?>>

    <div class="main-container">
		<section>
		
                <div class="container">
				<div class="row">
				<?php
        $aktual_ids = array();
        $kiirasok = get_posts(array(
            'post_type' => "tanfolyam-kiiras",
            'numberposts' => -1,
            'meta_key'			=> 'kezdes',
            'orderby'			=> 'meta_value',
            'order'				=> 'ASC'
        ));


        $the_query = new WP_Query(array(
            'post_type' => "tanfolyam-kiiras",
            'numberposts' => -1,
            'meta_key'			=> 'kezdes',
            'orderby'			=> 'meta_value',
            'order'				=> 'ASC'
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
            <br>
            <div id="pentaesti-filter-box" effect-type="fade">
                <div class="pentafilter" termName="nappali">Nappali</div>
                <div class="pentafilter" termName="esti">Esti</div>
            </div>
				</div>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                            <div class="process-1 tanfolyamok">
                                <div class="process__item tanfolyam notfound" style="display:none;">
                                    <h4>Jelenleg nincs tanfolyamunk ebben a kategóriában.</h4>
                                </div>
								<?php
                // Start the Loop.

                while ($the_query->have_posts()) : $the_query->the_post();
                    $ID = get_post(get_field('kapcsolodo_tanf', get_the_ID())[0])->ID;
                    ?>
                                <div visible="visible" termName="tanf <?php echo get_field("napszak",get_the_ID()); ?> <?php foreach ((get_the_terms($ID, 'category')) as $term) {echo $term->slug . ' ';} ?>" class="process__item tanfolyam">
                                    <h4><a href="<?php echo get_permalink($ID); ?>"><?php echo get_post($ID)->post_title; ?></a></h4>
                                    <?php
                                    $kapcs_tanf = get_field('kapcsolodo_tanf')[0];
                                    $listaar = get_field('listaar',$kapcs_tanf);
                                    $akcios = get_field('akcios_ar');

                                    $van_e_akcio = false;
                                    $szazalek = 0;
                                    if($akcios<$listaar){
                                        $van_e_akcio = true;
                                        $szazalek = round((1-($akcios / $listaar))*100);
                                    }
                                    ?>
                                    <div class="tanf-price">
                                        <h4><?php echo $akcios; ?>Ft</h4>
                                        <?php if($van_e_akcio): ?>
                                            <strike><?php echo $listaar; ?> Ft.</strike>
                                            <span><?php echo $szazalek; ?> % kedvezmény!</span>
                                        <?php endif; ?>
                                    </div>
                                   <p> <i><?php echo get_field("kezdes", get_the_ID()); ?></i></p>
                                </div>
							<?php endwhile; ?>
                                
                            </div>
                        </div>
                    </div>
					<?php endif; ?>
                </div>
            </section>
    </div>

