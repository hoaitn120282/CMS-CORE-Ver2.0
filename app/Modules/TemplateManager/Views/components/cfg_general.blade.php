<?php
if (!empty($node))
$typography = $node->meta()->optionsKey('typography')->first();
$typoOpts = array();
$typoVals = empty($typography) ? array() : $typography->getValue();
?>

<h1 class="title">{{ $node->name or '' }}</h1>
<div class="">
    <fieldset>
        <div class="form-group col-md-3">
            @include('TemplateManager::xform.input_upload',[
            'idModal'=>'feature_Image', 'model' => $node, 'label' => 'Feature image', 'input'=>'general[feature_image]'
            ])
        </div><!-- feature-image -->
    </fieldset>
    <div class="clearfix"></div>

        <!-- .Typography -->
    @foreach($typoVals as $field)
        @include('TemplateManager::xform.'.$field['type'], ['field' => $field, 'groups' => 'typography'])
    @endforeach
    <!-- /.Typography -->

    <fieldset>
        <legend>Custom CSS</legend>
        <textarea name="general[custom_css]" id="custom-css" class="form-control" rows="5"></textarea>
    </fieldset>
</div>
