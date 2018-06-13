<?php while (have_posts()) : the_post(); ?>
    <article <?php post_class(); ?>>
        <?php
        $refs = get_posts(array(
            "post_type"=>'referenciak',
            'numberposts' => -1
        ));
        $cats = array();
        $years = array();
        foreach ($refs as $ref) {
            $cats[] = get_field('kategoria', $ref->ID);
            $years[] = get_field('ev', $ref->ID);
        }
        $cats = array_unique($cats);
        $years = array_unique($years);
        ?>
	 <div class="main-container">
         <section class="">
             <div class="container">
                 <div class="row">
                     <div class="col-sm-12 col-md-12">
                         <div class="row">
                             <div class="col-md-3">
                                 <div  class="input-select">
                                     <select id='filterCat' style='display:inline-block' onchange='filterCat()'>
                                         <option disabled selected>Kategória...</option>
                                         <?php foreach ($cats as $cat) { ?>
                                             <option value="<?php echo $cat; ?>"><?php echo $cat; ?></option>
                                         <?php } ?>
                                         <option value='all'>All</option>
                                     </select>
                                 </div>
                             </div>
                             <div class="col-md-3">
                                 <div class="input-select">
                                     <select id='filterYear'  class="input-select" style='display:inline-block' onchange='filterYear()'>
                                         <option disabled selected>Év...</option>
                                         <?php foreach ($years as $year) { ?>
                                             <option value="<?php echo $year; ?>"><?php echo $year; ?></option>
                                         <?php } ?>
                                         <option value='all'>All</option>
                                     </select>
                                 </div>

                             </div>

                         </div>
                         <table id="referenciak-table" class="border--round table--alternate-row">

                             <thead>
                             <tr>
                                 <th>Megrendelő</th>
                                 <th>Téma</th>
                                 <th>Év</th>
                                 <th>Létszám</th>
                                 <th>Kategória

                                     </th>
                             </tr>
                             </thead>
                             <tbody id="myTable">
                             <?php


                             foreach ($refs as $ref) {
                                 $cats[] = get_field('kategoria',$ref->ID);
                                 ?>
                                 <tr class="content">
                                     <td><?php echo get_field('megrendelo',$ref->ID); ?></td>
                                     <td><?php echo get_field('tema',$ref->ID); ?></td>
                                     <td class="ev"><?php echo get_field('ev',$ref->ID); ?></td>
                                     <td><?php echo get_field('letszam',$ref->ID); ?></td>
                                     <td class="kategoria"><?php echo get_field('kategoria',$ref->ID); ?></td>
                                 </tr>
                             <?php }
                             ?>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>
         </section>

         <script>
             function filterYear()
             {
                 var rex = new RegExp(jQuery('#filterYear').val());
                 if(rex =="/all/"){clearFilter()}else{
                     jQuery('.content').hide();
                     jQuery('.content').filter(function() {
                         return rex.test(jQuery(this).find('td.ev').text());
                     }).show();
                 }
             }
             function filterCat()
             {
                 var rex = new RegExp(jQuery('#filterCat').val());
                 if(rex =="/all/"){clearFilter()}else{
                     jQuery('.content').hide();
                     jQuery('.content').filter(function() {
                         return rex.test(jQuery(this).find('td.kategoria').text());
                     }).show();
                 }
             }

             function clearFilter()
             {
                 jQuery('.filterText').val('');
                 jQuery('.content').show();
             }
         </script>
           
        </div>
    </article>
<?php endwhile; ?>