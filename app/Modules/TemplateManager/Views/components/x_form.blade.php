<div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#general" aria-controls="general" role="tab" data-toggle="tab">General configurations</a>
            </li>
            <li role="presentation">
                <a href="#layouts" aria-controls="layouts" role="tab" data-toggle="tab">Layout settings</a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="general">
                @include('TemplateManager::components.cfg_general')
            </div>
            <div role="tabpanel" class="tab-pane" id="layouts">
                @include('TemplateManager::components.cfg_layout')
            </div>
        </div>
        <!--Action-->
        <div class="toolbar-actions">
            <a href="" class="btn btn-info">
                <i class="fa fa-eye" aria-hidden="true"></i> Preview
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save as draft
            </button>
            <button type="submit" class="btn btn-success">
                <i class="fa fa-floppy-o" aria-hidden="true"></i> Publish
            </button>
        </div>
</div>