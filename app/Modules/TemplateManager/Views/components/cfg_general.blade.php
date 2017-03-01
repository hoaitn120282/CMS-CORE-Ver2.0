<?php

if (!empty($node)) {
    $typography = $node->meta()->optionsKey('typography')->first();
    $general = $node->meta()->optionsKey('general')->first();
}
$featureImage = null;
$typoOpts = array();
$typoVals = empty($typography) ? array() : $typography->getValue();
$featureImage = empty($general) ? array() : $general->getOption('feature_image');
?>

<h1 class="title">{{ $node->name or '' }}</h1>
<div class="">
    <fieldset>
        <div class="form-group col-md-3">
            @include('TemplateManager::xform.input_upload',[
            'idModal'=>'image_preview', 'model' => $node->image_preview, 'label' => 'Feature image', 'input'=>'image_preview'
            ])
        </div><!-- feature-image -->
    </fieldset>
    <div class="clearfix"></div>

    <!-- .Typography -->
@foreach($typoVals as $field)
    @include('TemplateManager::xform.'.$field['type'], ['field' => $field, 'groups' => 'meta[typography]'])
@endforeach
<!-- /.Typography -->

    <fieldset>
        <legend>Custom CSS</legend>
        <textarea name="meta[general][customcss]" id="custom-css" class="form-control" rows="5"></textarea>
    </fieldset>
</div>
