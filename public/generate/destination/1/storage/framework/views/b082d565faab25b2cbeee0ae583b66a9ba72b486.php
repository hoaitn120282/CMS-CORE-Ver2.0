<div class="panel panel-default">
  <div class="panel-heading">
    <div style="padding-top:2px;float:left">
      <?php echo e($value->name); ?>

      <a data-target="select-widget-<?php echo e($group); ?>-<?php echo e($key); ?>" data-role='toggle-menu' href="#"><i class="fa fa-chevron-down"></i></a>
    </div>
    <div class="btn-group" style="float:right">
      <button type="button" class="btn btn-success dropdown-toggle btn-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add <span class="caret"></span></button>
      <ul class="dropdown-menu">
        <?php foreach($widgetGroups as $val): ?>
          <li><a href="#" data-role="add-widget" data-widgetname="<?php echo e(get_class($value)); ?>" data-widgetposition="<?php echo e($val->id); ?>" ><?php echo e(ucwords(str_replace("_"," ",$val->name))); ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>

    <div class="clearfix"></div>
  </div>
  <div id="select-widget-<?php echo e($group); ?>-<?php echo e($key); ?>" class="panel-body" style="display: none;">
    <?php echo e($value->description); ?>

  </div>
</div>