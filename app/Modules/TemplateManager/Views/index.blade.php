@extends(Admin::theme())

@section('content')
    <div class="list-templates">
        <div class="row">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Template Manager</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    @include('TemplateManager::components.alert')
                    @include('TemplateManager::components.x_list')
                </div>
            </div>
        </div>
    </div>


@endsection

@push('style-top')
<style>
    .list-templates .thumbnail {
        position: relative;
        overflow: hidden;
    }
    .list-templates .thumbnail .action {
        position: absolute;
        top: -25px;
        transform: translateY(-50%);
        font-size: 20px;
        width: 100%;
        text-align: center;
        transition: all 0.5s ease;
    }
    .list-templates .thumbnail:hover .action {
        top: 50%;
    }
    .list-templates .thumbnail .action a {
        padding: 0 8px;
        transition: all 0.3s ease;
    }
    .list-templates .thumbnail .action a:hover {
        color: #1ABB9C;
    }
</style>
@endpush