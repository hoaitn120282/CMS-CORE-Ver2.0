@extends('layouts.admin')

@section('content')
	<div class="site-detail">
		<div class="row">
            <div class="x_panel">
                <div class="x_title">
                    <h2>View site detail</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_panel">
	                <h2 class="text-center">Account Information</h2>
	                <ul class="list-unstyled site-name-language">
	                	<li><span>Site Name </span>{{ $clinic->info->site_name }}</li>
	                	<li><span>Default Language </span>{{ $clinic->clinic_id }}</li>
	                </ul>
	                <div class="row">
	                	<div class="col-sm-6">
	                		<div class="doctor-infor">
	                			<h3>Doctor Information</h3>
	                			<ul class="list-unstyled">
	                				<li><span>Admin Name </span>{{ $clinic->info->username }}</li>
	                				<li><span>Email address </span>{{ $clinic->info->email }}</li>
	                				<li><span>Address </span>{{ $clinic->clinic_id }}</li>
	                				<li><span>Telephone </span>{{ $clinic->clinic_id }}</li>
	                			</ul>
	                		</div>
	                	</div>

	                	<div class="col-sm-6">
	                		<div class="server-infor">
	                			<h3>Server Information</h3>
	                			<ul class="list-unstyled">
	                				<li><span>Domain</span>{{ $clinic->domain }}</li>
	                				<li>
	                					<span>Hosting </span>
	                					<ul class="list-unstyled">
	                						<li><span>Host</span> {{ $clinic->hosting->host }}</li>
	                						<li><span>Username</span> {{ $clinic->hosting->username }}</li>
	                						<li><span>Password</span> {{ $clinic->hosting->password }}</li>
	                					</ul>
	                				</li>
	                				<li>
	                					<span>Database </span>
										<ul class="list-unstyled">
	                						<li><span>Name</span> {{ $clinic->database->database_name }}</li>
	                						<li><span>Host</span> {{ $clinic->database->host }}</li>
	                						<li><span>UserName</span> {{ $clinic->database->name }}</li>
	                						<li><span>Password</span> {{ $clinic->database->password }}</li>
	                					</ul>
	                				</li>
	                			</ul>
	                		</div>
	                	</div>

	                	<div class="col-sm-6">
	                		<div class="doctor-infor">
	                			<h3>Selected</h3>

	                			<ul class="list-unstyled">
	                				@foreach($clinic->theme as $theme)
										<li>
											<span>Teamplate {{ $theme->clinic_theme_id }}</span>
											<a class="btn btn-success" href="{{Admin::route('templateManager.preview',['id'=>$theme->theme_id])}}"">
					                            <i class="fa fa-eye"></i>
					                        </a>
										</li>
	                				@endforeach
	                			</ul>
	                		</div>
	                	</div>
	                	
	                </div>
                </div>
                <div class="toolbar-actions text-center">
                    <button type="submit" name="update" class="btn btn-success">
                        <i class="fa fa-pencil" aria-hidden="true"></i> Edit
                    </button>
                    <button type="submit" name="update" class="btn btn-success">
                        <i class="fa fa-download" aria-hidden="true"></i> Download
                    </button>
                    <button type="submit" name="update" class="btn btn-danger">
                        <i class="fa fa-ban" aria-hidden="true"></i> Delete
                    </button>
                </div>
            </div>
        </div>
	</div>
@endsection

@push('style-top')
	<style>
		.site-name-language{
			margin-top: 50px;
		}

		.site-detail li{
			line-height: 25px
		}

		.site-detail h2{
			font-size: 30px;
			text-align: center;
		}

		.site-detail h3{
			margin-bottom: 25px;
			text-align: center;
		}

		.site-detail li span{
			font-weight: bold;
			color: #000000;
			width: 150px;
			display: inline-block;

		}

		.server-infor li ul{
			padding-left: 20px;
		}
	</style>
@endpush