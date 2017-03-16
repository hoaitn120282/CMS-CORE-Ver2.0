<?php if($key == 0): ?>
<div class="tab-pane active" id="tab-<?php echo e($meta->meta_key); ?>">
<?php else: ?>
<div class="tab-pane" id="tab-<?php echo e($meta->meta_key); ?>">
<?php endif; ?>
<?php foreach($meta->getValue() as $value): ?>
	<?php echo $__env->make('ContentManager::theme.partials.'.$value['type'], ['data' => $value, 'groups' => 'meta['.$meta->meta_key.']'], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php endforeach; ?>
</div>