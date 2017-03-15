<div class="form-group">
	<label for="id-<?php echo e($data['name']); ?>"><?php echo e($data['label']); ?> :</label>
	<textarea id="id-<?php echo e($data['name']); ?>" class="form-control" name="meta[<?php echo e($meta->meta_key); ?>][<?php echo e($data['name']); ?>][value]"><?php echo e($data['value']); ?></textarea>
</div>