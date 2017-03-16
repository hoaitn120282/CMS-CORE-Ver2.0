<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Theme <?php echo e(ucfirst($node->name)); ?></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <?php if($node->status): ?>
                        <li><a href="#" onclick="return false;">Actived</a></li>
                    <?php else: ?>
                        <li><a href="<?php echo e(Admin::route('contentManager.theme.active', ['id'=>$node->id])); ?>"
                               style="background-color:#449d44;color:#fff;padding-left:20px;padding-right:20px">Active</a>
                        </li>
                    <?php endif; ?>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <?php if(Session::has('success')): ?>
                    <div class="alert alert-success" role="alert">
                        <?php echo e(Session::get('success')); ?>

                    </div>
                <?php endif; ?>
                <div class="row">
                    <div class="col-md-4">
                        <img style="width: 100%; display: block;"
                             src="<?php echo e(url($node->image_preview)); ?>" alt="image">
                    </div>
                    <div class="col-md-8">
                        <dl>
                            <dt>Name Theme</dt>
                            <dd><?php echo e($node->name); ?></dd>
                            <dt>Author Theme</dt>
                            <dd><a href="<?php echo e($node->author_url); ?>"><?php echo e($node->author); ?></a></dd>
                            <dt>Description</dt>
                            <dd><?php echo e($node->description); ?></dd>
                        </dl>
                    </div>
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Theme Options</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="col-xs-3">
                                    <ul class="nav nav-tabs tabs-left">
                                        <?php foreach($node->metaOptions() as $key => $meta): ?>
                                            <?php if($key == 0): ?>
                                                <li class="active"><a href="#tab-<?php echo e($meta->meta_key); ?>"
                                                                      data-toggle="tab"><?php echo e(ucwords(str_replace("_", " ", $meta->meta_key))); ?></a>
                                                </li>
                                            <?php else: ?>
                                                <li><a href="#tab-<?php echo e($meta->meta_key); ?>"
                                                       data-toggle="tab"><?php echo e(ucwords(str_replace("_", " ", $meta->meta_key))); ?></a>
                                                </li>
                                            <?php endif; ?>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                                <form method="POST" action="<?php echo e(Admin::route('contentManager.theme.update')); ?>">
                                    <?php echo e(csrf_field()); ?>

                                    <input type="hidden" value="<?php echo e($node->id); ?>" name="idtheme">
                                    <div class="col-xs-9">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <?php foreach($node->metaOptions() as $key => $meta): ?>
                                                <?php echo $__env->make('ContentManager::theme.partials.generate', ['meta' => $meta], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                                            <?php endforeach; ?>
                                        </div>
                                        <input type="submit" class="btn btn-success" value="Save">
                                    </div>
                                </form>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('style-top'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/colorpicker/css/colorpicker.css')); ?>">
<style>
    .color-picker {
        padding-left: 34px;
        height: 34px;
        position: relative;
        border: 1px solid #ccc;
        display: inline-block;
        cursor: pointer;
    }

    .color-picker:after {
        content: 'Select color';
        display: block;
        width: 119px;
        height: 32px;
        line-height: 32px;
        padding: 0 6px;
        background-color: #fff;
        font-size: 14px;
        border-left: 1px solid #ccc;
    }

    .input-color-picker {
        display: inline-block;
        width: 75px !important;
        padding: 4px 4px;
        display: none;
    }
</style>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('assets/colorpicker/js/colorpicker.js')); ?>"></script>
<script src="<?php echo e(asset('assets/dropzone/dropzone.min.js')); ?>"></script>
<script>
    $('.color-picker').ColorPicker({
        onSubmit: function (hsb, hex, rgb, el) {
            $('.input-color-picker', el.closest('.wrap-color-picker')).val('#' + hex);
            $(el).css('backgroundColor', '#' + hex);
            $(el).ColorPickerHide();
        },
        onBeforeShow: function (colpkr) {
            var cal = $(colpkr).data('colorpicker');
            var col = cal.color;
            var val = $('.input-color-picker', $(this).closest('.wrap-color-picker')).val();
            $(this).ColorPickerSetColor(val);
        },
        onShow: function (colpkr) {
            var cal = $(colpkr).data('colorpicker');
            var el = cal.el;
            // $('.input-color-picker', el.closest('.wrap-color-picker')).show();
            $(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            $(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            var cal = $(this).data('colorpicker');
            var el = cal.el;
            $('.input-color-picker', el.closest('.wrap-color-picker')).val('#' + hex);
            $(el).css('backgroundColor', '#' + hex);
        }
    });
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make(Admin::theme(), array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>