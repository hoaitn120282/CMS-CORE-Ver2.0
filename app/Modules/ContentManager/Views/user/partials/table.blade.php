<table class="table table-striped jambo_table bulk_action">
    <thead>
    <tr>
        <th><input id="checkAll" type="checkbox" class="flat"></th>
        <th>Name</th>
        <th>Role</th>
        <th>Desciption</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    @foreach ($model as $data)
        <tr id="tr-{{ $data->id }}">
            <td>
                <input type="checkbox" class="flat" name="checkbox" data-role="checkbox" value="{{$data->id}}"/>
                <input type="hidden" id="idPost" value="{{ $data->id }}">
            </td>
            <td>
                <div class="btn-edit-delete">
                    {{$data->name}}
                </div>
            </td>
            <td>
                {{ $data->roles->name }}
            </td>
            <td>
                {{$data->description}}
            </td>
            <td>
                <div class="btn-edit-delete">
                    <a href="{{ Admin::route('contentManager.user.edit',['user'=>$data->id]) }}"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> |
                    <a href="#" data-role="delete-post" data-idpost="{{ $data->id }}"
                       data-url="{{ Admin::route('contentManager.user.destroy',['tag'=>'']) }}/"> <i class="fa fa-trash-o" aria-hidden="true"></i> </a>
                </div>
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
{{ $model->links() }}