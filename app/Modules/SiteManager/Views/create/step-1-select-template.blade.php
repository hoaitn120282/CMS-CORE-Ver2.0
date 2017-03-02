@extends('layouts.admin')

@section('content')
    <div class="row step-1-create-site">
        <div class="x_panel">
            <div class="x_title">
                <h2>Create new site</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="top-content row">
                    <div class="col-md-6">
                        <h3>Please select at least 1 template!</h3>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="box-filter col-md-6">
                                <select name="theme_tyoe" id="themeType" class="form-control"
                                        onchange="window.location = this.options[this.selectedIndex].value;">
                                    <option value="{{Admin::route('templateManager.index',['theme_type'=>0])}}">All Template</option>
                                    <option value="{{Admin::route('templateManager.index',['theme_type'=>1])}}" <?php if ($theme_type == 1) echo 'selected'; ?>>
                                        Simple Template
                                    </option>
                                    <option value="{{Admin::route('templateManager.index',['theme_type'=>2])}}" <?php if ($theme_type == 2) echo 'selected'; ?>>
                                        Medium Template
                                    </option>
                                </select>
                            </div>
                            <div class="box-search col-md-6">
                                <input type="text" placeholder="Search by name" id="searchContent">
                                <button class="btn btn-success btn-search"> <i class="fa  fa-search"></i> Search</button>
                            </div>
                        </div>
                    </div>
                </div>
                {{--end.top-content--}}
                <div class="main-content">
                     <div class="row">
                        @if(!empty($templates))
                            @foreach($templates as $template)
                                @include('SiteManager::partials.template-block',['node'=> $template])
                            @endforeach
                        @endif
                     </div>
                    {{ $templates->links() }}
                </div>
                {{--end.main-content--}}
                <div class="step-bottom row">
                    <div class="col-md-12">
                        <a href="{{ Admin::route('siteManager.add-info') }}">
                            <button class="btn btn-success pull-right">Next ></button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
//        $('.checkbox-input').change(function() {
//            console.log('hello');
//            // do stuff here. It will fire on any checkbox change
//
//        });

        $('.checkbox-input').on('change', function() {

            if (this.checked) {
                console.log('check roi '+this.value);
            }else{
                console.log('chua check '+this.value);
            }
        });
    </script>
@endpush
