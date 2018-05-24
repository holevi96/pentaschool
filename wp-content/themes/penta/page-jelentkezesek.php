<?php while (have_posts()) : the_post(); ?>
    <article <?php post_class(); ?>>
        <table>
            <thead>
            <tr>
                <th>Tanfolyam neve</th>
                <th>Dátum</th>
                <th>Jelentkező email címe</th>
                <th>Jelentkező telefonja</th>
            </tr>
            <?php
            $form_id = '1';
            $entry = GFAPI::get_entries( $form_id );
            var_dump( $entry );
            foreach ($entry as $item) {?>
                <tr>
                    <td><?php echo $item[1]; ?></td>
                    <td><?php echo $item[32]; ?></td>
                    <td><?php echo $item[5]; ?></td>
                    <td><?php echo $item['6.6']; ?></td>
                </tr>
            <?php }
            ?>
            </thead>
        </table>
        <?php

        ?>
    </article>
<?php endwhile; ?>