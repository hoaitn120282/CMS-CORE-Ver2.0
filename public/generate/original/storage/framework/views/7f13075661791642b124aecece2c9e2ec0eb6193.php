<?php

$main_class = Widget::existsGroup('right_sidebar') ? 'col-md-9 col-sm-12' : 'col-md-12 col-sm-12';
?>
<div class="content">
	<div class="container">
		<div class="row">
			<div class="<?php echo e($main_class); ?>"><?php echo $__env->yieldContent('content'); ?></div>
			<?php if(Widget::existsGroup('right_sidebar')): ?>
				<div class="col-md-3 col-sm-12">
					<aside class="sidebar-right">
					<?php $__env->startSection('right-sidebar'); ?>
						<?php echo e(Widget::group('right_sidebar')); ?>

					<?php echo $__env->yieldSection(); ?>
					</aside>
				</div>
			<?php endif; ?>
		</div>
	</div>
</div>