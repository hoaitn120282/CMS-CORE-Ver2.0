<?php $__env->startSection('content'); ?>
    <section class="content-dt">
        <?php if(Widget::existsGroup('post_slider')): ?>
            <div id="light-slider">
                <?php echo e(Widget::group('post_slider')); ?>

            </div>
        <?php endif; ?>
        <div class="ct-detail">
            <?php foreach($blogs as $blog): ?>
                <h3><?php echo e($blog->post_title); ?></h3>
                <div><?php echo html_entity_decode($blog->post_content); ?></div>
            <?php endforeach; ?>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('appTitle'); ?>
    <?php echo e(isset($appTitle) ? $appTitle : null); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('left-sidebar'); ?>
    @parent
    <!-- You can overwrite left-sidebar on master layout -->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('right-sidebar'); ?>
    @parent
    <!-- You can overwrite right-sidebar on master layout -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make(Theme::active().'.main', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>