<form method="POST"
      action="{{ ($model != "") ? Admin::route('contentManager.user.update',['user'=>$model->id]) : Admin::route('contentManager.user.store') }}">
    <div class="col-md-4">
        @include('ContentManager::partials.imageUpload',['dataID'=>'userPhoto','dataValue'=>($model != "" ) ? $model->photo : old('photo'),'dataName'=>'photo'])
    </div>
    <div class="col-md-8">
        {{ csrf_field() }}
        @if($model != "")
            <input name="_method" type="hidden" value="PUT">
        @endif
        <div class="form-group">
            <label for="name-user">Name *</label>
            <input type="text" class="form-control" value="{{ ($model != "" ) ? $model->name : old('name') }}"
                   name="name" id="name-tag" placeholder="Name User">
        </div>
        <div class="form-group">
            <label for="email-user">Email *</label>
            <input type="text" class="form-control" value="{{ ($model != "" ) ? $model->email : old('email') }}"
                   name="email" id="email-user" placeholder="Email User">
        </div>
        <div class="form-group">
            <label for="desctiption-user">Description</label>
            <textarea class="form-control" name="description"
                      rows="3">{{ ($model != "" ) ? $model->description : old('description') }}</textarea>
        </div>
        <div class="form-group">
            {!! Form::label('Role', 'Role:') !!}
            @if($roles)
                <?php $selectionRole = null; ?>
                @foreach($roles as $role)
                    <?php  $selectionRole[$role->id] = $role->name;?>
                @endforeach
            @endif
            {!! Form::select('role_id', [$selectionRole], 1, ['class' => 'form-control']) !!}
        </div>
        @if($model == "")
            <div class="form-group">
                <label for="password" class="control-label">Password</label>
                <input id="password" type="password" class="form-control" name="password">
            </div>
        @endif
        @if($model == "")
            <button type="submit" class="btn btn-default">Create</button>
        @else
            <button type="submit" class="btn btn-default">Save</button>
        @endif
    </div>
</form>