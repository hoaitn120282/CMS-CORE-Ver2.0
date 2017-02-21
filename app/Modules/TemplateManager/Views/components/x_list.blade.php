
@foreach($nodes as $node)
    <?php

    $filename= url('/themes/'.$node->name.'/images/'. $node->image_preview );
    $file_headers = get_headers($filename);

    if($file_headers[0] == 'HTTP/1.0 404 Not Found'){
        $previewImg = url('/themes').'/no-image.png';
    } else if ($file_headers[0] == 'HTTP/1.0 302 Found' && $file_headers[7] == 'HTTP/1.0 404 Not Found'){
//    echo "The file $filename does not exist, and I got redirected to a custom 404 page..";
        $previewImg = url('/themes').'/no-image.png';
    } else {
        $previewImg = $filename;
    }

    ?>
    <div class="col-md-3">
        <div class="thumbnail theme-item theme-item-{{$node->id}}">
            <div class="wrap-theme">
                <div class="image view-{{$node->id}} background-image" style="background-image: url('{{$previewImg}}')">
                    {{--<img style="width: 100%; display: block;"--}}
                         {{--src="{{$previewImg}}"--}}
                         {{--alt="{{$node->name}}">--}}
                    <a href="{{Admin::route('templateManager.create',['id'=>$node->id])}}">
                        <button type="button" class="btn btn-success btn-md btn-block btn-create-new">
                            <i class="fa fa-upload"></i> Create new
                        </button>
                    </a>
                </div>
                <div class="caption"><strong>{{$node->name}}</strong></div>
            </div>
            <div class="action">
                {{--<a href=""><i class="fa fa-eye" aria-hidden="true"></i></a>
                <a href="{{ Admin::route('templateManager.edit', ['id' => $node->id]) }}">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                </a>
                <a href="#"
                   data-role="delete-template"
                   data-theme_id="{{$node->id}}"
                   data-url="{{ Admin::route('contentManager.theme.uninstall', ['themeName' => $node->name]) }}">
                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                </a>--}}
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <button type="button" class="btn btn-block btn-success">View</button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <button type="button" class="btn btn-block btn-success">Clone</button>
                        </a>
                    </li>

                    @if($node->parent_id ==0)
                        <li>
                            <a href="{{ Admin::route('templateManager.edit', ['id' => $node->id]) }}">
                                <button type="button" class="btn btn-block btn-success">Edit</button>
                            </a>
                        </li>
                        <li>
                            <a href="#">
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