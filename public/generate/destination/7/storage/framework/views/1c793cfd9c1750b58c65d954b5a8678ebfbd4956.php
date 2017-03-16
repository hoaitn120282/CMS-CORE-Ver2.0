<?php
$group = isset($group) ? $group : null;
?>
<div class="frm-ctrl-wrap">
    <label for="<?php echo e($group.'['.$data['name'].']'); ?>"><?php echo e(isset($data['label']) ? $data['label'] : $data['name']); ?></label>
    <div class="wrap-color-picker">
        <a class="color-picker" style="background-color: <?php echo e(isset($data['value']) ? $data['value'] : "#fff"); ?>"></a>
        <input type="text" class="form-control input-color-picker" name="<?php echo e($group.'['.$data['name'].'][value]'); ?>"
               value="<?php echo e(isset($data['value']) ? $data['value'] : "#fff"); ?>">
    </div>
</div>
