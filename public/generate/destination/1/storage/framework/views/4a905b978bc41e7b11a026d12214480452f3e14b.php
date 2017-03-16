<?php foreach($models as $node): ?>
    <?php

    $filename = url($node->image_preview);
    $file_headers = get_headers($filename);

    if ($file_headers[0] == 'HTTP/1.0 404 Not Found') {
        $previewImg = url('/themes') . '/no-image.png';
    } else if ($file_headers[0] == 'HTTP/1.0 302 Found' && $file_headers[7] == 'HTTP/1.0 404 Not Found') {
        $previewImg = url('/themes') . '/no-image.png';
    } else {
        $previewImg = $filename;
    }

    ?>

    <div class="col-lg-4 col-md-6 cold-sm-6">
        <div class="thumbnail theme-item theme-item-<?php echo e($node->id); ?>">
            <div class="wrap-theme">
                <div class="image view-<?php echo e($node->id); ?> background-image" style="background-image: url('<?php echo e($previewImg); ?>')">
                </div>

            </div>
            <div class="caption">
                <?php if($node->status): ?>
                    <a href="#" class="btn btn-disabled btn-block btn-sm">Activated</a>
                <?php else: ?>
                    <a href="<?php echo e(Admin::route('contentManager.theme.active',['id'=>$node->id])); ?>"
                       class="btn btn-success btn-block btn-sm">Active Theme</a>
                <?php endif; ?>
            </div>
            <div class="action">
                <p class="theme-name"><?php echo e($node->name); ?></p>
                <ul>
                    <li>
                        <a href="<?php echo e(Admin::route('templateManager.preview', ['id' => $node->id])); ?>" target="_blank">
                            <i class="fa fa-eye"></i>
                        </a>
                    </li>
                    <?php if(!$node->status): ?>
                    <li>
                        <a href="#"
                           data-role="uninstall-theme"
                           data-theme_id="<?php echo e($node->id); ?>"
                           data-url="<?php echo e(Admin::route('contentManager.theme.uninstall', ['id' => $node->id])); ?>">
                            <i class="fa fa-times"></i></a>
                        </a>
                    </li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </div>
<?php endforeach; ?>

<?php $__env->startPush('scripts'); ?>
<?php echo $__env->make('ContentManager::theme.partials.script_uninstall', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopPush(); ?>