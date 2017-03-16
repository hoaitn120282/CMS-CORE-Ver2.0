
<div class="form-group">
	<label for="id-<?php echo e($data['name']); ?>"><?php echo e($data['label']); ?> :</label>
	<select id="id-<?php echo e($data['name']); ?>" class="form-control" name="meta[<?php echo e($meta->meta_key); ?>][<?php echo e($data['name']); ?>][value]">
	  <?php foreach($data['options'] as $key => $value): ?>
	  <option <?php echo e($key == $data['value'] ? "selected" : ""); ?> value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
	  <?php endforeach; ?>
	</select>
</div>