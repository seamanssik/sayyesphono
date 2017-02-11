<div class="categories">
  <div class="categories-title">Категории:</div>
  <ul class="categories-list">
    <?php foreach ($categories as $category) { ?>
    <li class="categories-list__item<?php echo ($category['category_id'] == $category_id) ? ' active' : ''; ?>">
      <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children'] && $category['category_id'] == $category_id) { ?>
        <ul class="categories-children">
          <?php foreach ($category['children'] as $child) { ?>
          <li class="categories-children__item<?php echo ($child['category_id'] == $child_id) ? ' active' : ''; ?>">
            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
          </li>
          <?php } ?>
        </ul>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
