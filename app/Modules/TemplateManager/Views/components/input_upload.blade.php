<button id="btn-{{$input}}" type="button" class="btn btn-success btn-md btn-block">
    <i class="fa fa-upload"></i> {{$label}}
</button>
<img id="btn-upload-{{$input}}-preview" class="img-responsive" src="{{ ($model != "" ) ? '' : old($input) }}"/>
<input type="hidden" id="{{$input}}" class="form-control"
       name="{{$input}}" value="{{ ($model != "" ) ? '' : old($input) }}"
       placeholder="{{ $label }}">

<div class="modal fade" id="modal-{{$input}}" tabindex="-1" role="dialog" aria-labelledby="{{$input}}Label">
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
                    <li id="tab-{{$input}}-home" role="presentation" class="active">
                        <a href="#{{$input}}-home" aria-controls="{{$input}}-home" role="tab" data-toggle="tab">Upload
                            Image</a>
                    </li>
                    <li id="tab-{{$input}}-image" role="presentation">
                        <a href="#{{$input}}-image" aria-controls="{{$input}}-image" role="tab"
                           data-toggle="tab">Images</a>
                    </li>
                </ul>
                <div id="media-content" class="tab-content">
                    <div role="tabpanel" class="tab-pane" id="{{$input}}-home">
                        <div id="file-upload-{{$input}}" class="mydropzone dropzone">
                            <div class="dz-default dz-message">
                                <div>
                                    <i class="fa fa-cloud-upload fa-5x"></i>
                                </div>
                                <span>Drop files here to upload</span>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="{{$input}}-image">
                        @include('TemplateManager::components.selectimage',['model'=>Admin::media(), 'input' => $input])
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div><!-- /.modal-form-upload -->

@push('style-top')
<link href="{{ asset('assets/dropzone/dropzone.min.css') }}" rel="stylesheet">
<style>
    #btn-upload-{{$input}}-preview {
        margin: 0 auto;
    }
</style>
@endpush
@push('scripts')
<script>
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("div#file-upload-{{$input}}", {
        url: "{{ Admin::route('contentManager.media.store') }}"
    });
    myDropzone.on("sending", function (file, xhr, formData) {
        formData.append("_token", "{{ csrf_token() }}");
    });
    myDropzone.on("queuecomplete", function (file, xhr, formData) {
        getPosts('{{ Admin::route("contentManager.media.images") }}', "{{$input}}");
    });

    $(document).ready(function () {
        $(document).on('click', '.pagination a', function (e) {
            getPosts($(this).attr("{{$input}}", 'href'), "{{$input}}");
            e.preventDefault();
        });
        $("#btn-{{$input}}").on('click', function () {
            defaultActive("{{$input}}");
            $("#modal-{{$input}}").modal("show");
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
            $('#btn-upload-' + input + '-preview').attr("src", img);
            $('#modal-' + input).modal("hide");
            $('#' + input).val(img);
        }
    }

    if (typeof getPosts !== "function") {
        function getPosts(page, input) {
            $.ajax({
                url: page,
                dataType: 'json',
            }).done(function (data) {
                $('#image').html(data);
                defaultActive(input, "image");
            }).fail(function () {
                alert('Posts could not be loaded.');
            });
        }
    }

</script>
@endpush