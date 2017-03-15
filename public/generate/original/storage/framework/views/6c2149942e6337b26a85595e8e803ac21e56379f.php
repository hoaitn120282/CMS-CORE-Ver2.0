<?php

$input = isset($input) ? $input : "meta[{$meta->meta_key}][{$data['name']}][value]";
$label = isset($label) ? $label : $data['label'];
$model = isset($model) ? $model : $data['value'];
$idModal = isset($idModal) ? $idModal : "modal_{$data['name']}";
$inputSlug = str_slug($input, '_');

?>

<div class="frm-ctrl-wrap">
    <label for="feature_image"><?php echo e($label); ?></label>
    <button id="btn-<?php echo e($inputSlug); ?>" type="button" class="btn btn-success btn-md " style="display: block;">
        <i class="fa fa-upload"></i> Choose file...
    </button>
    <div id="btn-upload-<?php echo e($inputSlug); ?>-preview" class="img-res"
         style='background-image: url("<?php echo e(empty($model) ? old($input) : $model); ?>"); display: <?php echo e((empty($model) && empty(old($input))) ? 'none':'block'); ?>'></div>
    <input type="hidden" id="<?php echo e($inputSlug); ?>" class="form-control"
           name="<?php echo e($input); ?>" value="<?php echo e(empty($model) ? old($input) : $model); ?>"
           placeholder="Choose file...">
</div>
<div class="modal fade" id="modal-<?php echo e($inputSlug); ?>" tabindex="-1" role="dialog" aria-labelledby="<?php echo e($inputSlug); ?>Label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Upload your file or select media</h4>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li id="tab-<?php echo e($inputSlug); ?>-home" role="presentation" class="active">
                        <a href="#<?php echo e($inputSlug); ?>-home" aria-controls="<?php echo e($inputSlug); ?>-home" role="tab" data-toggle="tab">Upload
                            Image</a>
                    </li>
                    <li id="tab-<?php echo e($inputSlug); ?>-image" role="presentation">
                        <a href="#<?php echo e($inputSlug); ?>-image" aria-controls="<?php echo e($inputSlug); ?>-image" role="tab"
                           data-toggle="tab">Images</a>
                    </li>
                </ul>
                <div id="media-content" class="tab-content">
                    <div role="tabpanel" class="tab-pane" id="<?php echo e($inputSlug); ?>-home">
                        <div id="file-upload-<?php echo e($inputSlug); ?>" class="mydropzone dropzone">
                            <div class="dz-default dz-message">
                                <div>
                                    <i class="fa fa-cloud-upload fa-5x"></i>
                                </div>
                                <span>Drop files here to upload</span>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="<?php echo e($inputSlug); ?>-image">
                        <?php echo $__env->make('ContentManager::theme.partials.selectimage',['model'=>Admin::media(), 'selectImage' => $inputSlug], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div><!-- /.modal-form-upload -->

<?php $__env->startPush('style-top'); ?>
<link href="<?php echo e(asset('assets/dropzone/dropzone.min.css')); ?>" rel="stylesheet">
<style>
    #btn-upload-<?php echo e($input); ?>-preview {
        margin: 0 auto;
    }

    .img-res {
        display: none;
        height: 190px;
        width: 250px;
        background-size: contain;
        border: 1px solid #f5f5f5;
    }

</style>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('scripts'); ?>
<script>
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("div#file-upload-<?php echo e($inputSlug); ?>", {
        url: "<?php echo e(Admin::route('contentManager.media.store')); ?>"
    });
    myDropzone.on("sending", function (file, xhr, formData) {
        formData.append("_token", "<?php echo e(csrf_token()); ?>");
    });
    myDropzone.on("queuecomplete", function (file, xhr, formData) {
        getPosts('<?php echo e(Admin::route("contentManager.media.images")); ?>', "<?php echo e($inputSlug); ?>");
    });

    $(document).ready(function () {
        $(document).on('click', '.pagination a', function (e) {
            getPosts($(this).attr('href'), "<?php echo e($inputSlug); ?>");
            e.preventDefault();
        });
        $("#btn-<?php echo e($inputSlug); ?>").on('click', function () {
            defaultActive("<?php echo e($inputSlug); ?>");
            $("#modal-<?php echo e($inputSlug); ?>").modal("show");
            summer = false;
            $('#tab-file').hide();

        });
    });

    if (typeof defaultActive !== "function") {
        function defaultActive(input, act='home') {
            $('#tab-' + input + '-home').removeClass('active');

            $('#tab-' + input + '-home').removeClass("active");
            $('#' + input + '-home').removeClass("active");
            $('#tab-' + input + '-file').removeClass("active");
            $('#' + input + '-file').removeClass("active");
            $('#tab-' + input + '-image').removeClass("active");
            $('#' + input + '-image').removeClass("active");

            $('#tab-' + input + '-' + act).addClass("active");
            $('#' + input + '-' + act).addClass("active");
        }
    }

    if (typeof setimage !== "function") {
        function setimage(img, input) {
//            $('#btn-upload-' + input + '-preview').attr("src", img);
            $('#btn-upload-' + input + '-preview').css('background-image', 'url(' + img + ')');
            $('#btn-upload-' + input + '-preview').css('display', 'block');

            $('#modal-' + input).modal("hide");
            $('#' + input).val(img);
        }
    }

    if (typeof getPosts !== "function") {
        function getPosts(page, input) {
            $.ajax({
                url: page,
                data: {
                    elSelect: input
                },
                dataType: 'json',
            }).done(function (data) {
                console.log(data);
                $('#' + input + '-image').html(data);
                defaultActive(input, "image");
            }).fail(function () {
                alert('Posts could not be loaded.');
            });
        }
    }

</script>
<?php $__env->stopPush(); ?>