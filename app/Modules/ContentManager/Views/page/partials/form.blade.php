<form method="POST"
      action="{{ ($model != "") ? Admin::route('contentManager.page.update',['page'=>$model->id]) : Admin::route('contentManager.page.store') }}">
    <div class="col-md-9">
        {{ csrf_field() }}
        @if($model != "")
            <input name="_method" type="hidden" value="PUT">
        @endif
        <div class="form-group">
            <label for="title-post">Title Page</label>
            <input type="text" class="form-control" name="post_title"
                   value="{{ ($model != "" ) ? $model->post_title : old('post_title') }}" id="title-post"
                   placeholder="Title Page">
            @if($model != "")
                <p class="help-block"><strong>Permalink : </strong><span id="slug-permalink">{{ Url('/') }}
                        /{{ $model->post_name }}</span></p>
            @endif
        </div>
        <div class="form-group">
            <label for="content-post">Content</label>
            <textarea id="content-post" name="post_content" class="form-control"
                      rows="18">{{ ($model != "" ) ? $model->post_content : old('post_content') }}</textarea>
        </div>
    </div>
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">Publish</div>
            <div class="panel-body">
                <button type="submit" class="btn btn-success btn-block">Save</button>
            </div>
            <ul class="list-group">
                <li class="list-group-item">
                    <select name="status" class="form-control">
                        <option value="publish">Publish</option>
                        <option value="Draft">Draft</option>
                    </select>
                </li>
            </ul>
        </div><!-- /.publish -->

        <div class="panel panel-default">
            <div class="panel-heading">Layout</div>
            <div class="panel-body">
                <select name="meta[layout]" class="form-control">
                    @foreach($layouts as $key => $value)
                        @if (empty($model))
                            <option value="{{ $key }}"
                            {{ ($key == Theme::layout('page')) ? 'selected="selected"':'' }}>
                                {{ ucwords(str_replace("-", " ", $value)) }}
                            </option>
                        @else
                            <option value="{{ $key }}">{{ ucwords(str_replace("-", " ", $value)) }}</option>
                        @endif

                    @endforeach
                </select>
            </div>
        </div><!-- /.feature-image -->

        <div class="panel panel-default">
            <div class="panel-heading">Featured Image</div>
            <div class="panel-body">
                @include('ContentManager::partials.inputBtnUpload',['idModal'=>'featuredImage','setInput'=>'meta_featured_img'])
            </div>
        </div><!-- /.feature-image -->
    </div>
</form>

