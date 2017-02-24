@foreach($models as $node)
    <?php

    $filename = url('/themes/' . $node->name . '/images/' . $node->image_preview);
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
            <div class="wrap-theme">
                <div class="image view-{{$node->id}} background-image" style="background-image: url('{{$previewImg}}')">
                </div>

            </div>
            <div class="caption">
                @if($node->status)
                    <a href="#" class="btn btn-disabled btn-block btn-sm">Active</a>
                @else
                    <a href="{{ Admin::route('contentManager.theme.active',['id'=>$node->id]) }}"
                       class="btn btn-success btn-block btn-sm">Active Theme</a>
                @endif
            </div>
            <div class="action">
                <p class="theme-name">{{ $node->name }}</p>
                <ul>
                    <li>
                        <a href="{{ Admin::route('contentManager.theme.view',['id'=>$node->id]) }}">
                            <i class="fa fa-eye"></i>
                        </a>
                    </li>
                    @if(!$node->status)
                    <li>
                        <a href="#"
                           data-role="uninstall-theme"
                           data-theme_id="{{$node->id}}"
                           data-url="{{ Admin::route('contentManager.theme.uninstall', ['themeName' => $node->name]) }}">
                            <i class="fa fa-times"></i></a>
                        </a>
                    </li>
                    @endif
                </ul>
            </div>
        </div>
    </div>
@endforeach

@push('scripts')
@include('ContentManager::theme.partials.script_uninstall')
@endpush