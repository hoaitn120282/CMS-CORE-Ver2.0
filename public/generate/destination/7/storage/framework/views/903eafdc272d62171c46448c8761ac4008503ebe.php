<?php $__env->startSection('content'); ?>
<div class="row">
	<div class="x_panel">
    <div class="x_title">
      <h2>Galleries</h2>
      <ul class="nav navbar-right panel_toolbox">
        <li><a href="<?php echo route('admin.galleries.create'); ?>" class="btn-toolbox success"><i class="fa fa-plus"></i> Add New</a></li>
      </ul>
      <div class="clearfix"></div>
      <?php echo $__env->make('flash::message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    </div>
    <div class="x_content">
      <?php echo $__env->make('admin.galleries.table', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    </div>
  </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>