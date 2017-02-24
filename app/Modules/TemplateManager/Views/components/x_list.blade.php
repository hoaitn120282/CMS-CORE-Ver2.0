
@foreach($nodes as $node)
    <?php

    $filename= url('/themes/'.$node->name.'/images/'. $node->image_preview );
    $file_headers = get_headers($filename);

    if($file_headers[0] == 'HTTP/1.0 404 Not Found'){
        $previewImg = url('/themes').'/no-image.png';
    } else if ($file_headers[0] == 'HTTP/1.0 302 Found' && $file_headers[7] == 'HTTP/1.0 404 Not Found'){
        $previewImg = url('/themes').'/no-image.png';
    } else {
        $previewImg = $filename;
    }

    ?>
    <div class="col-lg-4 col-md-6 cold-sm-6">
        <div class="thumbnail theme-item theme-item-{{$node->id}}">
            <div class="wrap-theme">
                <div class="image view-{{$node->id}} background-image" style="background-image: url('{{$previewImg}}')">
                    <a href="{{Admin::route('templateManager.create',['id'=>$node->id])}}">
                        <button type="button" class="btn btn-success btn-md btn-block btn-create-new">
                            <i class="fa fa-upload"></i> Create new
                        </button>
                    </a>
                </div>
                <div class="caption"><strong>{{$node->name}}</strong></div>
            </div>
            <div class="action">
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <button type="button" class="btn btn-block btn-success">View</button>
                        </a>
                    </li>
                    <li>
                        <a href="{{ Admin::route('templateManager.create', ['id' => $node->id]) }}">
                            <button type="button" class="btn btn-block btn-success">Clone</button>
                        </a>
                    </li>

                    @if($node->parent_id == 0 || $node->parent_id != 0)
                        <li>
                            <a href="{{ Admin::route('templateManager.edit', ['id' => $node->id]) }}">
                                <button type="button" class="btn btn-block btn-success">Edit</button>
                            </a>
                        </li>
                        <li>
                            <a href="#"
                               data-role="uninstall-theme"
                               data-theme_id="{{$node->id}}"
                               data-url="{{ Admin::route('contentManager.theme.uninstall', ['themeName' => $node->name]) }}">
                                <button type="button" class="btn btn-block btn-success">Delete</button>
                            </a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </div>
@endforeach

@push('scripts')
@include('TemplateManager::components.script_delete')
@endpush
@push('scripts')
@include('ContentManager::theme.partials.script_uninstall')
@endpush