
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
                    $ID = get_post(get_field('kapcsolodo_tanfolyam', get_the_ID())[0])->ID;
                    ?>
                                <div visible="visible" termName="tanf <?php echo get_field("napszak",get_the_ID()); ?> <?php foreach ((get_the_terms($ID, 'category')) as $term) {echo $term->slug . ' ';} ?>" class="process__item tanfolyam">
                                    <h4><a href="<?php echo get_permalink($ID); ?>"><?php echo get_post($ID)->post_title; ?></a></h4>
									
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

