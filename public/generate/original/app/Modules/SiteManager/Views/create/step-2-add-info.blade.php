@extends('layouts.admin')

@section('back')
    <a href="{{ \URL::previous() }}">
        <strong> <i class="fa fa-arrow-left"></i> &nbsp; Back</strong>
    </a>
@endsection

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
                <form class="form-horizontal"  method="post" action="{{ Admin::route('siteManager.create-info') }}">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="information">
                        <h3 class="text-center create-title">Account Information</h3>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                  <div class="form-group">
                                    <label for="site-name" class="col-sm-4 control-label">Site Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site-name" name="site-name" value="{{ old('site-name') }}" placeholder="Site Name">
                                        @if ($errors->has('site-name')) <p class="error-message">{{ $errors->first('site-name') }}</p> @endif
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label  class="col-sm-4 control-label">Language</label>
                                    <div class="col-sm-8">
                                        @foreach($languages as $language)
                                          <label class="checkbox-inline">
                                              <input  id="{{ $language->language_id }}" name="language[]" type="checkbox"  value="{{ $language->language_id }}"> {{ $language->name }}
                                          </label>
                                        @endforeach
                                        @if ($errors->has('language')) <p class="error-message">{{ $errors->first('language') }}</p> @endif
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-5">
                            <div class="information">
                                <h3 class="text-center create-title">Doctor Information</h3>

                                  <div class="form-group">
                                    <label for="admin-name" class="col-sm-3 control-label">Admin Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="admin-name" name="admin-name" value="{{ old('admin-name') }}" placeholder="Admin Name">
                                        @if ($errors->has('admin-name')) <p class="error-message">{{ $errors->first('admin-name') }}</p> @endif
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="email-address" class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email-address" name="email-address" value="{{ old('email-address') }}"  placeholder="Email Address">
                                        @if ($errors->has('email-address')) <p class="error-message">{{ $errors->first('email-address') }}</p> @endif
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="address" class="col-sm-3 control-label">Address</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="address" name="address" value="{{ old('address') }}"  placeholder="Address">
                                        @if ($errors->has('address')) <p class="error-message">{{ $errors->first('address') }}</p> @endif
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label">Telephone</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="telephone" name="telephone" value="{{ old('telephone') }}"  placeholder="Telephone">
                                        @if ($errors->has('telephone')) <p class="error-message">{{ $errors->first('telephone') }}</p> @endif
                                    </div>
                                  </div>
                            </div>
                        </div>

                        <div class="col-sm-7">
                            <div class="information">
                                <h3 class="text-center create-title">Server Information</h3>
                                  <div class="form-group">
                                    <label for="domain" class="col-sm-4 control-label">Domain</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="domain" name="domain" value="{{ old('domain') }}"  placeholder="Domain">
                                        @if ($errors->has('domain')) <p class="error-message">{{ $errors->first('domain') }}</p> @endif
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <label for="email-address" class="col-sm-12 control-label">Hosting</label>
                                    <div class="col-sm-12">
                                      <div class="form-group infor-child">
                                        <label for="host" class="col-sm-4 control-label">Host</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="host" name="host" value="{{ old('host') }}"  placeholder="Host">
                                            @if ($errors->has('host')) <p class="error-message">{{ $errors->first('host') }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="host-username" class="col-sm-4 control-label">Username</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="host-username" name="host-username" value="{{ old('host-username') }}"  placeholder="Username">
                                            @if ($errors->has('host-username')) <p class="error-message">{{ $errors->first('host-username') }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="host-password" class="col-sm-4 control-label">Password</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="host-password" name="host-password" value="{{ old('host-password') }}"  placeholder="Password">
                                            @if ($errors->has('host-password')) <p class="error-message">{{ $errors->first('host-password') }}</p> @endif
                                        </div>
                                      </div>
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <label for="email-address" class="col-sm-12 control-label">Database</label>
                                    <div class="col-sm-12">
                                      <div class="form-group infor-child">
                                        <label for="database-name" class="col-sm-4 control-label">Name</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="database-name" name="database-name" value="{{ old('database-name') }}"  placeholder="Name">
                                            @if ($errors->has('database-name')) <p class="error-message">{{ $errors->first('database-name') }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-host" class="col-sm-4 control-label">Host</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="database-host" id="database-host" value="{{ old('database-host') }}"  placeholder="Host">
                                            @if ($errors->has('database-host')) <p class="error-message">{{ $errors->first('database-host') }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-username" class="col-sm-4 control-label">Username</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="database-username" name="database-username"  value="{{ old('database-username') }}" placeholder="Username">
                                          @if ($errors->has('database-username')) <p class="error-message">{{ $errors->first('database-username') }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-password" class="col-sm-4 control-label">Password</label>
                                        <div class="col-sm-8">
                                          <input type="password" class="form-control" id="database-password" name="database-password" value="{{ old('database-password') }}"  placeholder="Password">
                                          @if ($errors->has('database-password')) <p class="error-message">{{ $errors->first('database-password') }}</p> @endif
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>

                    <div class="step-bottom row">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <a href="{{ Admin::route('siteManager.select-template') }}">
                                    <span class="btn btn-success">Back</span>
                                </a>
                                 <button type="submit" class="btn btn-success">Create</button>
                                <a href="{{ Admin::route('siteManager.add-info') }}">
                                    <button class="btn btn-success">Cancel</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('style-top')
    <style>
        .information{
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            padding-bottom: 60px;
        }

        .information label{
            text-align: left !important;
        }

        .create-title{
            margin-bottom: 15px;
        }

        .step-bottom{
            margin-bottom: 50px;
        }

        .infor-child label{
            padding-left: 50px;
        }
        
        .error-message{
            margin-top: 5px;
            color: red;
        }
    </style>
@endpush
