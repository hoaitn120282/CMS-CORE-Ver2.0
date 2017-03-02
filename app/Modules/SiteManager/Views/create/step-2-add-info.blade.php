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
                <form class="form-horizontal"  method="post" action="{{ Admin::route('siteManager.create-info') }}">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="information">
                        <h3 class="text-center create-title">Account Information</h3>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                  <div class="form-group">
                                    <label for="site-name" class="col-sm-4 control-label">Site Name</label>
                                    <div class="col-sm-8">
                                      <input type="text" class="form-control" id="site-name" name="site-name" placeholder="Site Name">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label  class="col-sm-4 control-label">Default Language</label>
                                    <div class="col-sm-8">
                                      <select class="form-control" id="">
                                        <option>Select language</option>
                                        <option>Dutch</option>
                                        <option>English</option>
                                        <option>French</option>
                                        <option>German</option>
                                      </select>
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
                                      <input type="text" class="form-control" id="admin-name" name="admin-name" placeholder="Admin Name">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="email-address" class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-9">
                                      <input type="email" class="form-control" id="email-address" name="email-address" placeholder="Email Address">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="address" class="col-sm-3 control-label">Address</label>
                                    <div class="col-sm-9">
                                      <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label">Telephone</label>
                                    <div class="col-sm-9">
                                      <input type="text" class="form-control" id="telephone" name="telephone" placeholder="Telephone">
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
                                      <input type="text" class="form-control" id="domain" name="domain" placeholder="Domain">
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <label for="email-address" class="col-sm-12 control-label">Hosting</label>
                                    <div class="col-sm-12">
                                      <div class="form-group infor-child">
                                        <label for="host" class="col-sm-4 control-label">Host</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="host" name="host" placeholder="Host">
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="host-username" class="col-sm-4 control-label">Username</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="host-username" name="host-username" placeholder="Username">
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="host-password" class="col-sm-4 control-label">Password</label>
                                        <div class="col-sm-8">
                                          <input type="password" class="form-control" id="host-password" name="host-password" placeholder="Password">
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
                                          <input type="text" class="form-control" id="database-name" name="database-name" placeholder="Name">
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-host" class="col-sm-4 control-label">Host</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" name="database-host" id="database-host" placeholder="Host">
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-username" class="col-sm-4 control-label">Username</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="database-username" name="database-username" placeholder="Username">
                                          @if ($errors->has('database-username')) <p class="alert alert-danger">{{ $errors->message }}</p> @endif
                                        </div>
                                      </div>

                                      <div class="form-group infor-child">
                                        <label for="database-password" class="col-sm-4 control-label">Password</label>
                                        <div class="col-sm-8">
                                          <input type="password" class="form-control" id="database-password" name="database-password" placeholder="Password">
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
                                    <button class="btn btn-success">Back</button>
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
    </style>
@endpush
