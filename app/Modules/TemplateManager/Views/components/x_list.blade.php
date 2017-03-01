@foreach($nodes as $node)
    <?php

    $filename = url($node->image_preview);
    $file_headers = get_headers($filename);

    if ($file_headers[0] == 'HTTP/1.0 404 Not Found') {
        $previewImg = url('/themes') . '/no-image.png';
    } else if ($file_headers[0] == 'HTTP/1.0 302 Found' && $file_headers[7] == 'HTTP/1.0 404 Not Found') {
        $previewImg = url('/themes') . '/no-image.png';
    } else {
        $previewImg = $filename;
    }

    ?>
    <div class="col-lg-4 col-md-6 cold-sm-6">
        <div class="thumbnail theme-item theme-item-{{$node->id}}">
            @if(!$node->is_publish)
                <span class="draft">Draft</span>
            @endif
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
                        <a href="{{ Admin::route('templateManager.preview', ['id' => $node->id]) }}" target="_blank"
                           title="View">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="{{ Admin::route('templateManager.create', ['id' => $node->id]) }}" title="Clone">
                            <i class="fa fa-clone" aria-hidden="true"></i>
                        </a>
                    </li>

                    @if($node->parent_id != 0)
                        <li>
                            <a href="{{ Admin::route('templateManager.edit', ['id' => $node->id]) }}" title="Edit">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#"
                               data-role="delete-template"
                               data-theme_id="{{$node->id}}"
                               data-url="{{ Admin::route('templateManager.uninstall', ['themeName' => $node->name]) }}"
                               title="Delete">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
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