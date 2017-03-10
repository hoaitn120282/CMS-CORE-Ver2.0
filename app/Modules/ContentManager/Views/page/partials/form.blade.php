<form method="POST"
      action="{{ ($model != "") ? Admin::route('contentManager.page.update',['page'=>$model->id]) : Admin::route('contentManager.page.store') }}">
    <div class="row">
        <div class="col-md-9">
            {{ csrf_field() }}
            @if($model != "")
                <input name="_method" type="hidden" value="PUT">
        @endif

        <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#english" aria-controls="home" role="tab"
                       data-toggle="tab">English</a>
                </li>
                <li role="presentation">
                    <a href="#vietnamese" aria-controls="home" role="tab"
                       data-toggle="tab">Tiếng Việt</a>
                </li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="english">
                    <div class="form-group">
                        <label for="title-post">Page Title</label>
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
                <div role="tabpanel" class="tab-pane" id="vietnamese">
                    Tiếng Việt
                </div>
            </div>
        </div>
        <div class="col-md-3" style="">
            <div class="panel panel-default">
                <div class="panel-heading">Publish</div>
                <div class="panel-body">
                    <select name="status" class="form-control">
                        <option value="publish">Publish</option>
                        <option value="Draft">Draft</option>
                    </select>
                </div>
            </div><!-- /.publish -->

            <div class="panel panel-default">
                <div class="panel-heading">Layout</div>
                <div class="panel-body">
                    <select name="meta[layout]" class="form-control">
                        <option value="">Use default layout for page</option>
                        @foreach($layouts as $key => $value)
                            @if (empty($model))
                                <option value="{{ $key }}">
                                    {{ ucwords(str_replace("-", " ", $value)) }}
                                </option>
                            @else
                                <option value="{{ $key }}"
                                        {{ ($key == $model->getMetaValue('layout')) ? 'selected':'' }}>
                                    {{ ucwords(str_replace("-", " ", $value)) }}
                                </option>
                            @endif

                        @endforeach
                    </select>
                </div>
            </div><!-- /.layout -->

            <div class="panel panel-default">
                <div class="panel-heading">Featured Image</div>
                <div class="panel-body">
                    @include('ContentManager::partials.inputBtnUpload',['idModal'=>'featuredImage','setInput'=>'meta_featured_img'])
                </div>
            </div><!-- /.feature-image -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 toolbar-actions">
            <div class="pull-right">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    {{ ($model == "" ) ? 'Create' : 'Update' }}
                </button>
                <a href="{{ Admin::route('contentManager.page.index') }}"
                   role="button" class="btn btn-primary">
                    <i class="fa fa-undo" aria-hidden="true"></i>
                    Cancel
                </a>
            </div>
        </div>
    </div>
</form>

