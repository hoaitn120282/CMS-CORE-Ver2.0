<?php

$groups = isset($groups) ? $groups : null;

?>
<fieldset>
    <legend><?php echo e($data['label']); ?></legend>
    <?php foreach($data['items'] as $item): ?>
        <div class="form-group col-md-4">
            <?php if('input_upload' == $item['type']): ?>
                <?php echo $__env->make('ContentManager::theme.partials.input_upload', [
            'idModal'=>'modal_'.$item['name'], 'model' => $item['value'], 'label' => $item['label'], 'input'=>$groups.'['.$data['name'].']['.$item['name'].'][value]'
            ], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <?php else: ?>
                <?php echo $__env->make('ContentManager::theme.partials.'.$item['type'], ['group' => $groups.'['.$data['name'].']', 'data' => $item], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <?php endif; ?>
        </div>
    <?php endforeach; ?>
</fieldset>
<div class="clearfix"></div>