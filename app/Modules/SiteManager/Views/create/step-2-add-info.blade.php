@extends('layouts.admin')

@section('content')
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Site Manager</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a id="btn-sel-del" style="display:none;" href="#" class="btn-toolbox danger"><i class="fa fa-trash"></i>Create new site</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <h2>Content step 2</h2>

                <div class="step-bottom row">
                    <div class="col-md-12">
                        <div class="pull-right">
                            <a href="{{ Admin::route('siteManager.select-template') }}">
                                <button class="btn btn-success">Back</button>
                            </a>
                            <a href="{{ Admin::route('siteManager.add-info') }}">
                                <button class="btn btn-success">Create</button>
                            </a>
                            <a href="{{ Admin::route('siteManager.add-info') }}">
                                <button class="btn btn-success">Cancel</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')

@endpush
