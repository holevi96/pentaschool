<?php while (have_posts()) : the_post(); ?>
    <article <?php post_class(); ?>>
	 <div class="main-container bg--primary">
         <table id="table_format" class="table table-bordered table-striped table-hover table-list-search">
             <thead>
             <tr>
                 <th>Megrendelő</th>
                 <th>Téma</th>
                 <th>Év</th>
                 <th>Létszám</th>
                 <th>Kategória</th>
             </tr>
             </thead>
             <tbody id="myTable">
                <?php
                    $refs = get_posts(array(
                            "post_tpye"=>'referenciak'
                    ))
                ?>
             </tbody>
         </table>

           
        </div>
    </article>
<?php endwhile; ?>