@extends(Admin::theme())

@section('content')
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Theme {{ ucfirst($node->name) }}</h2>
                <ul class="nav navbar-right panel_toolbox">
                    @if($node->status)
                        <li><a href="#" onclick="return false;">Actived</a></li>
                    @else
                        <li><a href="{{Admin::route('contentManager.theme.active', ['id'=>$node->id])}}"
                               style="background-color:#449d44;color:#fff;padding-left:20px;padding-right:20px">Active</a>
                        </li>
                    @endif
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                @if (Session::has('success'))
                    <div class="alert alert-success" role="alert">
                        {{ Session::get('success') }}
                    </div>
                @endif
                <div class="row">
                    <div class="col-md-4">
                        <img style="width: 100%; display: block;"
                             src="{{ url($node->image_preview) }}" alt="image">
                    </div>
                    <div class="col-md-8">
                        <dl>
                            <dt>Name Theme</dt>
                            <dd>{{$node->name}}</dd>
                            <dt>Author Theme</dt>
                            <dd><a href="{{$node->author_url}}">{{$node->author}}</a></dd>
                            <dt>Description</dt>
                            <dd>{{$node->description}}</dd>
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
                                        @foreach($node->metaOptions() as $key => $meta)
                                            @if($key == 0)
                                                <li class="active"><a href="#tab-{{$meta->meta_key}}"
                                                                      data-toggle="tab">{{ ucwords(str_replace("_", " ", $meta->meta_key)) }}</a>
                                                </li>
                                            @else
                                                <li><a href="#tab-{{$meta->meta_key}}"
                                                       data-toggle="tab">{{ ucwords(str_replace("_", " ", $meta->meta_key)) }}</a>
                                                </li>
                                            @endif
                                        @endforeach
                                    </ul>
                                </div>
                                <form method="POST" action="{{ Admin::route('contentManager.theme.update') }}">
                                    {{ csrf_field() }}
                                    <input type="hidden" value="{{ $node->id }}" name="idtheme">
                                    <div class="col-xs-9">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            @foreach($node->metaOptions() as $key => $meta)
                                                @include('ContentManager::theme.partials.generate', ['meta' => $meta])
                                            @endforeach
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

@endsection

@push('style-top')
<link rel="stylesheet" href="{{ asset('assets/colorpicker/css/colorpicker.css') }}">
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
@endpush