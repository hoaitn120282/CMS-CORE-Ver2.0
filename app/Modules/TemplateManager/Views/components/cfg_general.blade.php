<h1 class="title">Spring theme</h1>
<div class="">
    <fieldset>
        <div class="form-group col-md-3">
            <label for="feature_image">Feature image</label>
            @include('TemplateManager::components.input_upload',[
            'idModal'=>'feature_Image', 'model' => $node, 'label' => 'Choose image', 'input'=>'feature_image'
            ])
        </div><!-- feature-image -->

        <div class="form-group col-md-3">
            <label for="feature_image">Background image</label>
            @include('TemplateManager::components.input_upload',[
            'idModal'=>'bgImage','model' => $node,  'label' => 'Choose image', 'input'=>'background_image'
            ])
        </div><!-- /.background-image -->

        <div class="form-group col-md-3">
            <label for="feature_image">Font family</label>
            <select type="file" class="form-control" id="feature_image">
                <option value="">Arial</option>
                <option value="">Arial</option>
                <option value="">Arial</option>
            </select>
        </div><!-- /.font-family -->
    </fieldset>
    <div class="clearfix"></div>

    <fieldset>
        <legend>Site title</legend>
        <div class="fields-site-title">
            <div class="form-group col-md-3">
                <label for="site-title-color">Color</label>
                <div class="wrap-color-picker">
                    <a class="color-picker" style="background-color: {{$node->color or "#f00"}}"></a>
                    <input type="text" class="form-control input-color-picker" name="site_title_color"
                           value="{{$node->color or "#000"}}">
                </div>
            </div><!-- /.font-family -->
            <div class="form-group col-md-3">
                <label for="site-title-font-size">Font size</label>
                <select type="file" class="form-control" id="site-title-font-size">
                    <option value="">14 px</option>
                    <option value="">15 px</option>
                    <option value="">16 px</option>
                </select>
            </div><!-- /.font-family -->
        </div>
    </fieldset><!-- .site-title -->
    <div class="clearfix"></div>

    <fieldset>
        <legend>Sologan</legend>
        <div class="filds-site-sologan">
            <div class="form-group col-md-3">
                <label for="site-sologan-color">Color</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="site_sologan_color">
                </div>
            </div><!-- /.font-family -->
            <div class="form-group col-md-3">
                <label for="site-sologan-font-size">Font size</label>
                <select type="file" class="form-control" id="site-sologan-font-size">
                    <option value="">14 px</option>
                    <option value="">15 px</option>
                    <option value="">16 px</option>
                </select>
            </div><!-- /.font-family -->
        </div>
    </fieldset><!-- /.sologan -->
    <div class="clearfix"></div>

    <fieldset>
        <legend>Text</legend>
        <div class="fields-text">
            <div class="form-group col-md-3">
                <label for="site-text-color">Color</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="text_color">
                </div>
            </div><!-- /.font-family -->
            <div class="form-group col-md-3">
                <label for="text-font-size">Font size</label>
                <select type="file" class="form-control" id="text-font-size">
                    <option value="">14 px</option>
                    <option value="">15 px</option>
                    <option value="">16 px</option>
                </select>
            </div><!-- /.font-family -->
        </div>
    </fieldset><!-- /.text -->
    <div class="clearfix"></div>

    <fieldset>
        <legend>Link</legend>
        <div class="fileds-link">
            <div class="form-group col-md-3">
                <label for="site-link-color">Normal</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="hidden" class="form-control input-color-picker" name="site_link_color">
                </div>
            </div><!-- /.normal-color -->
            <div class="form-group col-md-3">
                <label for="site-link-hover-color">Hover</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="site_link_hover_color">
                </div>
            </div><!-- /.hover-color -->
            <div class="form-group col-md-3">
                <label for="site-link-font-size">Font size</label>
                <select type="file" class="form-control" id="site-title-font-size">
                    <option value="">14 px</option>
                    <option value="">15 px</option>
                    <option value="">16 px</option>
                </select>
            </div><!-- /.font-family -->
        </div>
    </fieldset><!-- /.link -->
    <div class="clearfix"></div>

    <fieldset>
        <legend>Button</legend>
        <div class="">
            <div class="form-group col-md-3">
                <label for="btn-color">Normal</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="btn_text_color">
                </div>
            </div><!-- /.normal-color -->
            <div class="form-group col-md-3">
                <label for="btn-text-color">Text hover</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="btn_text_hover_color">
                </div>
            </div><!-- /.text-hover -->
            <div class="form-group col-md-3">
                <label for="btn-font-size">Font size</label>
                <select type="file" class="form-control" id="btn-font-size">
                    <option value="">14 px</option>
                    <option value="">15 px</option>
                    <option value="">16 px</option>
                </select>
            </div><!-- /.font-family -->
        </div>
        <div class="clearfix"></div>
        <div class="">
            <div class="form-group col-md-3">
                <label for="btn-bg-color">Background color</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="btn_bg_color">
                </div>
            </div><!-- /.background-color -->
            <div class="form-group col-md-3">
                <label for="btn-bg-hover-color">Background hover</label>
                <div class="wrap-color-picker">
                    <a class="color-picker"></a>
                    <input type="text" class="form-control input-color-picker" name="btn_bg_hover_color">
                </div>
            </div><!-- /.background-hover -->
        </div>
    </fieldset><!-- /.button -->
    <div class="clearfix"></div>

    <fieldset>
        <legend>Custom CSS</legend>
        <textarea name="custom_css" id="custom-css" class="form-control" rows="5"></textarea>
    </fieldset>
</div>
