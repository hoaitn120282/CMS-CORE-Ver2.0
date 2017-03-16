<div class="row">
    <?php foreach($model as $value): ?>
        <div class="col-md-4">
            <div class="image-select">
                <?php if(isset($name)): ?>
                    <a href="#" class="btn-add-image-preview"
                       onclick="setimage<?php echo e($name); ?>('<?php echo e(url('/uploads').'/'.$value->post_name); ?>', '<?php echo e($selectImage); ?>');return false;">
                        <img class="img-responsive" src="<?php echo e(url('/uploads').'/'.$value->post_name); ?>"/>
                    </a>
                <?php else: ?>
                    <a href="#" class="btn-add-image-preview"
                       onclick="setimage('<?php echo e(url('/uploads').'/'.$value->post_name); ?>', '<?php echo e($selectImage); ?>');return false;">
                        <img class="img-responsive" src="<?php echo e(url('/uploads').'/'.$value->post_name); ?>"/>
                    </a>
                <?php endif; ?>
            </div>
        </div>
    <?php endforeach; ?>
    <div class="col-md-12">
        <?php echo e($model->links()); ?>

    </div>
</div>        

