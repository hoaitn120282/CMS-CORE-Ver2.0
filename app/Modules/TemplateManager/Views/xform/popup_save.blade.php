<div class="modal fade modal-popup-save" id="Popup-Save-{{$themeName}}" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">{{ $title or null }}</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="theme_name">Name</label>
                    <div class="wrap-input">
                        {{ $themeName."_" }}
                        <input class="form-control" id="theme_name" name="name">
                    </div>
                </div>
                <div class="form-group-options"></div>

            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<style>
    .modal-popup-save .modal-body label {
        display: inline-block;
        margin-right: 20px;
    }

    .modal-popup-save .modal-body .wrap-input {
        display: inline-block;
        background-color: #e0e0e0;
        color: #555;
        padding-left: 10px;
    }

    .modal-popup-save .modal-body .wrap-input input {
        display: inline-block;
        width: auto;
        padding-left: 0;
        border: 1px solid #e0e0e0;
    }
</style>
@push('scripts')
<script>
    (function ($) {
        $("#Popup-Save-{{$themeName}}").on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var title = button.data('title');
            var options = button.data('options');
            var modal = $(this);
            // Text title for modal
            modal.find('.modal-title').text(title);
            // Html input options for modal
            var html = '';
            if (typeof options == 'object') {
                $.each(options, function (key, val) {
                    html += '<input type="hidden" name="' + key + '" value="' + val + '"/>';
                });
            }
            modal.find('.form-group-options').html(html);
        });
    })(jQuery);

</script>
@endpush