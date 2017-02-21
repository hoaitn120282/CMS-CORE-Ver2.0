<?php
$isEdit = empty($isEdit) ? false : true;
?>
@extends(Admin::theme())

@section('content')
    <div class="create-template">
        <div class="row">
            <form action="{{ empty($isEdit) ? Admin::route('templateManager.store') : Admin::route('templateManager.edit', ['id' => $node->id]) }}"
                  method="post" enctype="multipart/form-data">
                <div class="x_panel">
                    <div class="x_title">
                        @if($isEdit)
                            <h2>Edit theme</h2>
                            <div class="action pull-right">
                                @include('TemplateManager::xform.switch', [
                                'on' => 'Publish',
                                'off' => 'Draft',
                                'input' => [
                                    'name' => 'publish',
                                    'value' => 1
                                    ]
                                ])
                            </div>
                        @else
                            <h2>Create new theme</h2>
                        @endif
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        @include('TemplateManager::components.alert')
                        {{ csrf_field() }}
                        <input type="hidden" name="theme_id" value="{{ $node->id }}"/>
                        @include('TemplateManager::components.x_form')
                    </div>
                    <div class="clearfix"></div>
                    <!--Action-->
                    <div class="toolbar-actions">
                        @if($isEdit)
                            <a href="" class="btn btn-info">
                                <i class="fa fa-eye" aria-hidden="true"></i> Preview
                            </a>
                            <button type="submit" name="update" class="btn btn-success">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Update
                            </button>
                        @else
                            <a href="" class="btn btn-info">
                                <i class="fa fa-eye" aria-hidden="true"></i> Preview
                            </a>
                            <button type="submit" name="draft" class="btn btn-primary">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save as draft
                            </button>
                            <button type="submit" name="pushlish" class="btn btn-success">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Publish
                            </button>
                        @endif
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('style-top')
<link rel="stylesheet" href="{{ asset('assets/colorpicker/css/colorpicker.css') }}">
<style>
    .create-template fieldset {
        margin-top: 20px;
    }

    .create-template .tab-pane {
        padding-top: 15px;
    }

    .create-template .tab-pane .layout-thumbnail img {
        padding: 10px;
        border: 1px solid #ccc;
        margin: 10px;
    }

    .create-template .tab-pane .layout-thumbnail label {
        cursor: pointer;
    }

    .create-template .toolbar-actions {
        margin-top: 15px;
        border-top: 1px solid #ccc;
        padding: 15px;
        background-color: #f3f3f3;
    }

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
        width: 100px;
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
@endpush

@push('scripts')
<script src="{{ asset('assets/colorpicker/js/colorpicker.js') }}"></script>
<script src="{{ asset('assets/dropzone/dropzone.min.js') }}"></script>

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
//            $('.input-color-picker', el.closest('.wrap-color-picker')).show();
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

    /*$('.input-color-picker').on('keyup', function(){
     $('.color-picker', $(this).closest('.wrap-color-picker')).ColorPicker({color:this.value});
     });*/

    var elem = document.querySelector('.js-switch');
    //    var init = new Switchery(elem);
</script>
@endpush
