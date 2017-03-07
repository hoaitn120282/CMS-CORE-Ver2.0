<?php

$layoutStyle = array();
$values = empty($layout) ? array() : $layout->getValue();
if (!empty($values)) {
    foreach ($values as $val) {
        if ($val['name'] == 'layout_style') {
            $options = $val['options'];
            $layoutStyle = $val;
            break;
        }
    }
}
?>
<ul id="template-{{$option}}" class="list-inline template-layout">
    @forelse($layout_style as $key => $value)
        <li>
            <div class="layout-thumbnail">
                @if(empty($node->parent))
                    <img src='{{ url("/themes/$node->machine_name/images/$key.png") }}'>
                @else
                    <img src='{{ url("/themes/".$node->parent->machine_name."/images/$key.png") }}'>
                @endif
                <div class="text-center">
                    <label for="{{ $key }}">
                        <input type="radio"
                               name="meta[layouts][layout_style][xvalue][{{$option}}]" value="{{ $key }}"
                               id="{{ $key }}" class="flat" data-role="checkbox"
                                {{ ($template[$option] == $key) ? 'checked="checked"' : '' }}>
                        {{ ucwords(str_replace("-", " ", $value)) }}
                    </label>
                </div>
            </div>
        </li>
    @empty
        <li>Empty layouts</li>
    @endforelse
</ul><!-- /.default -->