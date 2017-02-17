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
                <a href=""><i class="fa fa-eye" aria-hidden="true"></i></a>
                <a href="{{ Admin::route('templateManager.create', ['id' => $node->id]) }}">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                </a>
                <a href=""><i class="fa fa-trash-o" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
@endforeach

