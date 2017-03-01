@extends('layouts.admin')

@section('content')
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Site Manager</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a id="btn-sel-del" style="display:none;" href="#" class="btn-toolbox danger"><i class="fa fa-trash"></i>Delete Selected Site</a></li>
                    <li><a href="{{ Admin::route('languageManager.create') }}" class="btn-toolbox success"><i class="fa fa-plus"></i> Create New</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                @if(count($clinics) > 0)
                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr>
                        {{--<th><input id="checkAll" type="checkbox" class="flat"></th>--}}
                        <th>No.</th>
                        <th>Site Name</th>
                        <th>Admin Name</th>
                        <th>Created date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $i = 0; ?>
                    @foreach ($clinics as $data)
                        <?php $i++;?>
                        <tr id="tr-{{ $data->clinic_id }}">
                            <td>
                                {{--<input type="checkbox" class="flat" name="checkbox" data-role="checkbox" value="{{$data->clinic_id}}" />--}}
                                <span>{{$i}}</span>
                                <input type="hidden" id="idLanguage" value="{{ $data->clinic_id }}">
                            </td>
                            <td>
                                <div class="">
                                    {{$data->info->site_name}}
                                    {{--<div class="btn-edit-delete">--}}
                                        {{--<a href="{{ Admin::route('languageManager.edit',['clinic'=>$data->clinic_id]) }}" > Edit </a> |--}}
                                        {{--<a href="#" data-role="delete-post" data-idclinic="{{ $data->clinic_id }}" > Delete </a>--}}
                                    {{--</div>--}}
                                </div>
                            </td>
                            <td>{{$data->info->username}}</td>
                            <td>{{$data->created_at}}</td>
                            <td>
                                {{$data->status == 1? 'Running' : 'Pending'}}
                            </td>
                            <td class="action-site" style="width: 200px">
                                <a href="{{ Admin::route('siteManager.preview', ['id' => $data->clinic_id]) }}" data-toggle="tooltip" title="View Detail"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                <a href="" data-toggle="tooltip" title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                <a href="" data-toggle="tooltip" title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                @else
                    <h2>You do not have clinics site!</h2>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
    $( document ).ready(function() {
        $("a[data-role='delete-post']").on( "click", function() {
            var idlanguage = $(this).data('idlanguage');
            console.log(idlanguage);
            swal({
                title: "Are you sure?",
                text: "Delete this language",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true,
                confirmButtonText: "Yes",
                confirmButtonClass: "btn-danger",
                cancelButtonText: "No"
            }, function () {
                $.ajax({
                    type: 'DELETE',
                    url: "{{ Admin::route('languageManager.destroy',['language'=>'']) }}/"+idlanguage,
                    data: {"_token": "{{ csrf_token() }}"}
                })
                    .done(function() {
                        swal("Deleted!", "Delete Success", "success");
                        $("#tr-"+idlanguage).remove();
                    });
            });
            return false;
        });

        $("#checkAll").change(function () {
            $("input:checkbox[name=checkbox]").prop('checked', $(this).prop("checked"));
            if($("#btn-sel-del").css('display') == 'none'){
                $("#btn-sel-del").css("display","inline-block");
            }else{
                $("#btn-sel-del").css("display","none");
            }
        });

        $( "input[type=checkbox]" ).on( "change", function () {
            var n = $( "input:checked[name=checkbox]" ).length;
            if(n == 0){
                $("#btn-sel-del").css("display","none");
            }else{
                $("#btn-sel-del").css("display","inline-block");
            }
        });

        $("#btn-sel-del").on("click",function(){
            var array = new Array();
            $("input:checkbox[name=checkbox]:checked").each(function(){
                array.push($(this).val());
            });
            var id = array.join()
            swal({
                title: "Are you sure?",
                text: "Delete the selected language",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true,
                confirmButtonText: "Yes",
                confirmButtonClass: "btn-danger",
                cancelButtonText: "No"
            }, function () {
                $.ajax({
                    type: 'DELETE',
                    url: "{{ Admin::route('languageManager.destroy',['language'=>'']) }}/"+id,
                    data: {"_token": "{{ csrf_token() }}"}
                })
                    .done(function() {
                        swal("Deleted!", "Delete Success", "success");
                        location.reload();
                    });
            });
            return false;
        });
    });
</script>
@endpush
