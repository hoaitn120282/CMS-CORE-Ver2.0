<form method="POST"
      action="{{ ($model != "") ? Admin::route('contentManager.tag.update',['post'=>$model->term_id]) : Admin::route('contentManager.tag.store') }}">
    {{ csrf_field() }}
    @if($model != "")
        <input name="_method" type="hidden" value="PUT">
    @endif
    <div class="form-group">
        <label for="name-tag">Name *</label>
        <input type="text" class="form-control" value="{{ ($model != "" ) ? $model->name : old('name') }}" name="name"
               id="name-tag" placeholder="Name Tag">
    </div>
    <div class="form-group">
        <label for="slug-tag">Slug</label>
        <input type="text" class="form-control" value="{{ ($model != "" ) ? $model->slug : old('slug') }}" name="slug"
               id="slug-category" placeholder="Slug Tag">
    </div>
    <div class="form-group">
        <label for="desctiption-tag">Description</label>
        <textarea class="form-control" name="description"
                  rows="3">{{ ($model != "" ) ? $model->description : old('description') }}</textarea>
    </div>
    <div class="tools">
        <div class="pull-right">
            @if($model != "")
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    Save
                </button>
                <a href="{{ Admin::route('contentManager.category.index') }}" class="btn btn-primary">
                    <i class="fa fa-undo" aria-hidden="true"></i>
                    Cancel
                </a>
            @else
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    Create
                </button>
            @endif
        </div>
    </div>
</form>
