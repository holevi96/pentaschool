<?php

get_header(); ?>

    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <form action="" method="post">
                <select name="tanfolyamname" id="">
                    <?php
                    $tanfolyamok = get_posts(array('post_type' => 'tanfolyamok','numberposts'=>-1));
                    foreach ($tanfolyamok as $tanfolyam) { ?>
                        <option value="<?php echo $tanfolyam->ID; ?>"><?php echo $tanfolyam->post_title; ?></option>
                    <?php }

                    ?>
                </select>
                <input type="text" placeholder="Oktato" name="oktato_filter"/>
                <input type="text" placeholder="Dátum -tól" name="datum_from_filter"/>
                <input type="text" placeholder="Dátum -ig" name="datum_to_filter"/>
                <input type="text" placeholder="Helyszín" name="helyszin_filter"/>
                <input type="text" placeholder="Cégnév" name="cegnev_filter"/>
                <input type="hidden" name="is_filter">
                <input type="submit" value="Szűrés">
            </form>
            <?php
            // Start the loop.
            while ( have_posts() ) : the_post();
                if(isset($_POST['is_filter'])){
                    $kapcsolodo_tanfolyam = $_POST['tanfolyamname'];
                    $oktato = $_POST['oktato_filter'];
                    $datum_from = $_POST['datum_from_filter'];
                    $datum_to = $_POST['datum_to_filter'];
                    $helyszin = $_POST['helyszin_filter'];
                    $cegnev = $_POST['cegnev_filter'];
                    $meta_array = array();
                    $meta_array['relation'] = 'AND';
                    if($kapcsolodo_tanfolyam != 0){
                        $meta_array[] = array(
                            'key'		=> 'kapcsolodo_tanfolyam',
                            'value'		=> $kapcsolodo_tanfolyam,
                            'compare'	=> 'LIKE'
                        );
                    }if($oktato != ''){
                        $meta_array[] = array(
                            'key'		=> 'oktato',
                            'value'		=> $oktato,
                            'compare'	=> 'LIKE'
                        );
                    }if($helyszin != ''){
                        $meta_array[] = array(
                            'key'		=> 'helyszin',
                            'value'		=> $helyszin,
                            'compare'	=> 'LIKE'
                        );
                    }if($cegnev != ''){
                        $meta_array[] = array(
                            'key'		=> 'cegnev',
                            'value'		=> $cegnev,
                            'compare'	=> 'LIKE'
                        );
                    }if($datum_from != ''){
                        $meta_array[] = array(
                            'key'		=> 'datum',
                            'value'		=> $datum_from,
                            'type' => 'date',
                            'compare' => '>'
                        );
                    }if($datum_to != ''){
                        $meta_array[] = array(
                            'key'		=> 'datum',
                            'value'		=> $datum_to,
                            'type' => 'date',
                            'compare' => '<'
                        );
                    }

                    $ertekelesek = get_posts(array(
                        'post_type' => "ertekelesek",
                        'numberposts' => -1,
                        'meta_query'	=> $meta_array
                    ))  ;
                    //PC::tag($ertekelesek);
                    $ertekeles_ids = array();
                    foreach ($ertekelesek as $ertekeles) {
                        $ertekeles_ids[] = $ertekeles->ID;
                    }
                    // PC::tag($ertekeles_ids);
                    $valasz_meta = array();
                    $valasz_meta['relation'] = 'OR';
                    foreach ($ertekeles_ids as $id) {
                        $valasz_meta[] = array(
                            'key'		=> 'kapcsolodo_ertekelesek',
                            'value'		=> '"' . $id . '"',
                            'compare'	=> 'LIKE'
                        );
                    }

                    $valaszok = get_posts(array(
                        "post_type" => 'valaszok',
                        'numberposts' => -1,
                        'meta_query' => $valasz_meta
                    ));
                    //PC::tag($valaszok);1
                    $cnt = 1;
                    $mennyire_elegedett = 0;
                    $megfelelt_e_az_elvarasainak = 0;
                    $tananyag_felepitese = 0;
                    $gyakorlati_feladatok_eletszerûsege = 0;
                    $segedanyagok_hasznalhatosaga = 0;
                    $milyen_aranyban_szerzett_uj_ismereteket = 0;
                    $milyen_aranyban_fogja_hasznalni_az_uj_ismereteket  = 0;
                    $szakmai_felkeszultsege = 0;
                    $eloadoi_keszseg = 0;
                    $segito_keszseg =0;
                    $csoporthoz_valo_viszony = 0;
                    $infrastrukturalis_kornyezet = 0;
                    foreach ($valaszok as $valasz) { ?>
                        <h3><a href="<?php echo get_permalink($valasz->ID); ?>">Válasz <?php echo $cnt; ?></a></h3>
                        <?php

                        $mennyire_elegedett += get_field('mennyire_elegedett',$valasz->ID)[0]['értekeles'];
                        $megfelelt_e_az_elvarasainak += get_field('megfelelt_e_az_elvarasainak',$valasz->ID)[0]['értekeles'];
                        $tananyag_felepitese += get_field('tananyag_felepitese',$valasz->ID)[0]['értekeles'];
                        $gyakorlati_feladatok_eletszerûsege += get_field('gyakorlati_feladatok_eletszerûsege',$valasz->ID)[0]['értekeles'];
                        $segedanyagok_hasznalhatosaga += get_field('segedanyagok_hasznalhatosaga',$valasz->ID)[0]['értekeles'];
                        $milyen_aranyban_szerzett_uj_ismereteket += get_field('milyen_aranyban_szerzett_uj_ismereteket',$valasz->ID)[0]['értekeles'];
                        $milyen_aranyban_fogja_hasznalni_az_uj_ismereteket += get_field('milyen_aranyban_fogja_hasznalni_az_uj_ismereteket',$valasz->ID)[0]['értekeles'];
                        $szakmai_felkeszultsege += get_field('szakmai_felkeszultsege',$valasz->ID)[0]['értekeles'];
                        $eloadoi_keszseg += get_field('eloadoi_keszseg',$valasz->ID)[0]['értekeles'];
                        $segito_keszseg += get_field('segito_keszseg',$valasz->ID)[0]['értekeles'];
                        $csoporthoz_valo_viszony += get_field('csoporthoz_valo_viszony',$valasz->ID)[0]['értekeles'];
                        $infrastrukturalis_kornyezet += get_field('infrastrukturalis_kornyezet',$valasz->ID)[0]['értekeles']; ?>


                        <?php $cnt++; } ?>
                    <h4>mennyire_elegedett <?php  echo $mennyire_elegedett/($cnt-1); ?></h4>
                    <h4> megfelelt_e_az_elvarasainak <?php echo   $megfelelt_e_az_elvarasainak/($cnt-1); ?></h4>
                    <h4>tananyag_felepitese <?php echo  $tananyag_felepitese /($cnt-1); ?></h4>
                    <h4>gyakorlati_feladatok_eletszerûsege <?php echo   $gyakorlati_feladatok_eletszerûsege/($cnt-1); ?></h4>
                    <h4>segedanyagok_hasznalhatosaga <?php echo  $segedanyagok_hasznalhatosaga/($cnt-1); ?></h4>
                    <h4> milyen_aranyban_szerzett_uj_ismereteket <?php echo $milyen_aranyban_szerzett_uj_ismereteket/($cnt-1); ?></h4>
                    <h4> milyen_aranyban_fogja_hasznalni_az_uj_ismereteket <?php echo  $milyen_aranyban_fogja_hasznalni_az_uj_ismereteket/($cnt-1); ?></h4>
                    <h4> szakmai_felkeszultsege <?php echo  $szakmai_felkeszultsege/($cnt-1); ?></h4>
                    <h4> eloadoi_keszseg <?php echo  $eloadoi_keszseg/($cnt-1); ?></h4>
                    <h4> segito_keszseg <?php echo  $segito_keszseg/($cnt-1); ?></h4>
                    <h4> csoporthoz_valo_viszony <?php echo   $csoporthoz_valo_viszony/($cnt-1); ?></h4>
                    <h4>infrastrukturalis_kornyezet <?php echo $infrastrukturalis_kornyezet/($cnt-1); ?></h4>
               <?php }

             endwhile;
            ?>

        </main><!-- .site-main -->

        <?php //get_sidebar( 'content-bottom' ); ?>

    </div><!-- .content-area -->

<?php //get_sidebar(); ?>
<?php get_footer(); ?>