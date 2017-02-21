@foreach($nodes as $node)
    <div class="col-md-3">
        <div class="thumbnail theme-item theme-item-{{$node->id}}">
            <div class="wrap-theme">
                <div class="image view-{{$node->id}}">
                    <img style="width: 100%; display: block;"
                         src="{{ url('/themes/'.$node->name) }}/images/{{ $node->image_preview }}"
                         alt="{{$node->name}}">
                </div>
                <div class="caption"><strong>{{$node->name}}</strong></div>
            </div>
            <div class="action">
                <a href=""><i class="fa fa-eye" aria-hidden="true" title="Preview the theme"></i></a>
                <a href="{{ Admin::route('templateManager.create', ['id' => $node->id]) }}" title="Create a new theme">
                    <i class="fa fa-plus-square-o" aria-hidden="true"></i>
                </a>
                <a href="{{ Admin::route('templateManager.edit', ['id' => $node->id]) }}" title="Edit the theme">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                </a>
                <a href="#"
                   data-role="delete-template"
                   data-theme_id="{{$node->id}}"
                   data-url="{{ Admin::route('contentManager.theme.uninstall', ['themeName' => $node->name]) }}" title="Delete the theme">
                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                </a>
            </div>
        </div>
    </div>
@endforeach

@push('scripts')
@include('TemplateManager::components.script_delete')
@endpush