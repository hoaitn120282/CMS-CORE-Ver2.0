<div class="form-group">
	<label for="id-<?php echo e($data['name']); ?>"><?php echo e($data['label']); ?> :</label>
	<input type="text" id="id-<?php echo e($data['name']); ?>" class="form-control" value="<?php echo e($data['value']); ?>" name="meta[<?php echo e($meta->meta_key); ?>][<?php echo e($data['name']); ?>][value]">
</div>