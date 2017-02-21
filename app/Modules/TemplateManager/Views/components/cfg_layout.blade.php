<?php
if (!empty($node)) {
    $layout = $node->meta()->optionsKey('layouts')->first();
}

$options = array();
$values = empty($layout) ? array() : $layout->getValue();
if (!empty($values)) {
    foreach ($values as $val) {
        if ($val['name'] == 'layout_style') {
            $options = $val['options'];
            break;
        }
    }
}
?>
<h1 class="title">{{ $node->name or '' }}</h1>
<p class="help-block">To create a new theme, it is required to select at least 1 layout below.</p>

<ul class="list-inline">
    @forelse($options as $option => $optionVal)
        <li>
            <div class="layout-thumbnail">
                <img src='{{ url("/themes/$node->name/images/$option.png") }}'>
                <div class="text-center">
                    <label for="{{ $option }}">
                        <input type="checkbox" name="layouts[{{$option}}]" value="{{ $option }}"
                               id="{{ $option }}" class="flat" data-role="checkbox">
                        {{ $optionVal }}
                    </label>
                </div>
            </div>
        </li>
    @empty
        <li>Empty layouts</li>
    @endforelse
</ul>