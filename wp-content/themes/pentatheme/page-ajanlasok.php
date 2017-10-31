?<?php
// it will register global PC class
/**
 * The template for displaying pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that
 * other "pages" on your WordPress site will use a different template.
 *
 * @package WordPress
 * @subpackage Twenty_Sixteen
 * @since Twenty Sixteen 1.0
 */
if(isset($_POST['ajanlasszoveg'])){
    PC::debug('benn vagyunk', 'penta');
    $url = 'https://www.google.com/recaptcha/api/siteverify';
    $priveteKey = '6Lf1MCYTAAAAAJmPi8llS9kTl6DIAKKlLZXCfl2R';
    $response = file_get_contents($url."?secret=".$priveteKey."&response=".$_POST['g-recaptcha-response']."&remoteip=".$_SERVER['REMOTE_ADDR']);
    $data = json_decode($response);
    PC::debug($data, 'penta');
    if(isset($data->success) and $data->success == true){
        //ajanlas mentése
        $post_array = array(
            'post_title' => date('Y-m-d'),
            'post_content' => $_POST['ajanlasszoveg'],
            'post_status' => 'publish',
            'post_type' => 'ajanlas'
        );
        $post_id = wp_insert_post($post_array);
        update_field('keresztnev',$_POST['keresztnev'],$post_id);
        update_field('cegnev',$_POST['cegnev'],$post_id);
        $tanf = array();
        array_push($tanf,$_POST['tanfolyamname']);
        PC::debug($tanf, 'penta');
        update_field('tanfolyam',$tanf,$post_id);
    }else{echo 'wronh';}
}

get_header(); ?>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <?php
            // Start the loop.
            while ( have_posts() ) : the_post(); ?>
                <form action="" method="post">
                <select name="tanfolyamname" id="">
                    <?php 
                        $tanfolyamok = get_posts(array('post_type' => 'tanfolyamok','numberposts'=>-1));
                    foreach ($tanfolyamok as $tanfolyam) { ?>
                        <option value="<?php echo $tanfolyam->ID; ?>"><?php echo $tanfolyam->post_title; ?></option>
                    <?php }

                    ?>
                </select>
                <textarea name="ajanlasszoveg" id="" cols="30" rows="10" placeholder="Ide írja az ajánlás szövegét!"></textarea>
                <input type="text" placeholder="Keresztnév" name="keresztnev"/>
                    <br>
                <input type="text" name="cegnev" placeholder="Cégnév"/>
                    <br>
                    <div class="g-recaptcha" data-sitekey="6Lf1MCYTAAAAAPiv_ceTdepEnpxQhb7C8Ae3iCR2"></div>
                    <input type="submit" value="Küldés"/>
                </form>

             <?php  

                // End of the loop.
            endwhile;
            ?>

        </main><!-- .site-main -->

        <?php get_sidebar( 'content-bottom' ); ?>

    </div><!-- .content-area -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>