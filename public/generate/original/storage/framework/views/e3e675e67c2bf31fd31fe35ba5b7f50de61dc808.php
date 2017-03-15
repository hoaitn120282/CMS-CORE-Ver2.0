<?php $__env->startSection('content'); ?>
    <div class="list-templates">
        <div class="row">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Theme Manager</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a href="<?php echo e(Admin::route('contentManager.theme.install')); ?>">Install Theme</a></li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <?php echo $__env->make('ContentManager::theme.partials.alert', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                    <?php echo $__env->make("ContentManager::theme.partials.x_list", array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('style-top'); ?>
<style>
    .list-templates .thumbnail {
        position: relative;
        overflow: hidden;
    }

    .list-templates .thumbnail .wrap-theme:after {
        content: '';
        display: block;
        background-color: #000;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 0;
        opacity: 0;
        transition: all 0.3s ease;
    }

    .list-templates .thumbnail:hover .wrap-theme:after {
        opacity: 0.5;
    }

    .list-templates .thumbnail .action {
        position: absolute;
        top: -50px;
        transform: translateY(-50%);
        font-size: 20px;
        width: 100%;
        text-align: center;
        transition: all 0.5s ease;
        z-index: 1;
    }

    .list-templates .thumbnail:hover .action {
        top: 50%;
    }

    .list-templates .thumbnail:hover .action .theme-name {
        color: #fff;
    }

    .list-templates .thumbnail:hover .action li {
        margin: 0 10px;
    }

    .list-templates .thumbnail .action a {
        color: #ffffff;
        padding: 0 8px;
        transition: all 0.3s ease;
    }

    .list-templates .thumbnail .action a:hover {
        color: #1ABB9C;
    }
</style>
<?php $__env->stopPush(); ?>
<?php echo $__env->make(Admin::theme(), array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>