@extends('layouts.admin')

@section('back')
	<a href="{{ \URL::previous() }}">
		<strong> <i class="fa fa-arrow-left"></i> &nbsp; Back</strong>
	</a>
@endsection

@section('content')
	<div class="site-detail">
		<div class="row">
            <div class="x_panel">
                <div class="x_title">
                    <h2>View site detail</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_panel">
	                <div class="box-info">
						<h2 class="text-center">Account Information</h2>
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<div class="form-group">
									<label class="col-sm-4 control-label">Site Name </label>
									<div class="col-sm-8">
										<p class="text-left">{{ $clinic->info->site_name }}</p>
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-4 control-label">Language </label>
									<div class="col-sm-8 text-left">
										@foreach($languageSelected as $lang)
											{{ $lang }} ,
										@endforeach
									</div>
								</div>
							</div>
						</div>
					</div>
	                <div class="row">
	                	<div class="col-sm-6 ">
	                		<div class="doctor-infor box-info">
	                			<h3>Doctor Information</h3>
	                			<ul class="list-unstyled ul-child">
	                				<li><span>Admin Name </span>{{ $clinic->info->username }}</li>
	                				<li><span>Email address </span>{{ $clinic->info->email }}</li>
	                				<li><span>Address </span>{{ $clinic->info->address }}</li>
	                				<li><span>Telephone </span>{{ $clinic->info->telephone }}</li>
	                			</ul>
	                		</div>

							<div class="doctor-infor box-info">
								<h3>Selected Template</h3>

								<ul class="list-unstyled">
									@foreach($clinic->theme as $theme)
										<li>
											<span>Template {{ $theme->clinic_theme_id }}</span>
											<a class="btn btn-success" target="_blank" href="{{Admin::route('templateManager.preview',['id'=>$theme->theme_id])}}">
												Preview
											</a>
										</li>
									@endforeach
								</ul>
							</div>
	                	</div>

	                	<div class="col-sm-6 ">
	                		<div class="server-infor box-info">
	                			<h3>Server Information</h3>
	                			<ul class="list-unstyled">
	                				<li><span>Domain</span>{{ $clinic->domain }}</li>
	                				<li>
	                					<span>Hosting </span>
	                					<ul class="list-unstyled ul-child">
	                						<li><span>Host</span> {{ $clinic->hosting->host }}</li>
	                						<li><span>Username</span> {{ $clinic->hosting->username }}</li>
	                						<li><span>Password</span> {{ $clinic->hosting->password }}</li>
	                					</ul>
	                				</li>
	                				<li>
	                					<span>Database </span>
										<ul class="list-unstyled ul-child">
	                						<li><span>Name</span> {{ $clinic->database->database_name }}</li>
	                						<li><span>Host</span> {{ $clinic->database->host }}</li>
	                						<li><span>UserName</span> {{ $clinic->database->username }}</li>
	                						<li><span>Password</span> {{ $clinic->database->password }}</li>
	                					</ul>
	                				</li>
	                			</ul>
	                		</div>
	                	</div>
	                </div>
                </div>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<p>The name.sanmax.com has been deployed. Send an email to notify that the website is available for use now</p>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input id="email-send" type="text" class="form-control" name="email-send" value="{{ $clinic->info->email }}" >
									<input id="site-name" type="hidden" value="{{ $clinic->info->site_name }}">
									<input id="admin-name" type="hidden" value="{{ $clinic->info->username }}">
									<input id="username-name" type="hidden" value="{{ $clinic->hosting->username }}">
								</div>
							</div>
							<div class="modal-footer">
								<a  data-role="send-email">
									<button type="button" class="btn btn-success" data-dismiss="modal">Send</button>
								</a>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
                <div class="toolbar-actions text-center">
					<a href="{{ Admin::route('siteManager.edit-info',['id'=>$clinic->clinic_id]) }}">
						<button type="submit" name="update" class="btn btn-success">
							<i class="fa fa-pencil" aria-hidden="true"></i> Edit
						</button>
					</a>
					{{--<a data-toggle="modal" data-target="#myModal">
						<button type="submit" name="update" class="btn btn-success">
							<i class="fa fa-download" aria-hidden="true"></i> Download
						</button>
					</a>--}}
					<a href="{{ Admin::route('siteManager.download', ['filename' => $clinic->clinic_id.'.zip' ])  }}" >
						<button type="submit" name="update" class="btn btn-success">
							<i class="fa fa-download" aria-hidden="true"></i> Download
						</button>
					</a>
					<a href="#" data-role="delete-post" data-clinicid="{{ $clinic->clinic_id }}" >
						<button type="submit" name="update" class="btn btn-danger">
							<i class="fa fa-ban" aria-hidden="true"></i> Delete
						</button>
					</a>
                </div>
            </div>
        </div>
	</div>
@endsection

@push('style-top')
	<style>
		.box-info{
			border: 1px solid #ddd;
			margin-bottom: 20px;
			padding: 20px;
		}

		.site-name-language{
			margin-top: 50px;
			display: inline-block;
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

		.ul-child li span{
			width: 125px;
		}

		.control-label{
			color: #0A0A0A;
		}

		footer{
			position: inherit !important;
		}
	</style>
@endpush

@push('scripts')
<script>
    $( document ).ready(function() {
        $("a[data-role='send-email']").on("click", function () {
            var email = $('#email-send').val();
            var siteName = $('#site-name').val();
            var adminName = $('#admin-name').val();
            var usernameName = $('#username-name').val();
            swal({
                title: "Are you sure?",
                text: "",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true,
                confirmButtonText: "Yes",
                confirmButtonClass: "btn-success",
                cancelButtonText: "No"
            }, function () {
                $.ajax({
                    type: 'POST',
                    url: "{{ Admin::route('siteManager.send-email') }}",
                    data: {
                        "email": email,
                        "siteName": siteName,
                        "adminName": adminName,
                        "usernameName": usernameName,
                        "password": '123456a@',
						"_token": "{{ csrf_token() }}"

                    }
                })
                    .done(function() {
                        swal("", "Sent successfully", "success");
                        $('#myModal').modal('hide');
                    });
            });
            return false;
        });

        $("a[data-role='delete-post']").on( "click", function() {
            var clinicid = $(this).data('clinicid');
            swal({
                title: "",
                text: "Are you sure to delete this site information?",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true,
                confirmButtonText: "Yes",
                confirmButtonClass: "btn-danger",
                cancelButtonText: "No"
            }, function () {
                $.ajax({
                    type: 'DELETE',
                    url: "{{ Admin::route('siteManager.destroy',['clinicid'=>'']) }}/"+clinicid,
                    data: {"_token": "{{ csrf_token() }}"}
                })
                    .done(function() {
                        swal("Deleted!", "Delete Successfully", "success");
                        window.location.href = "{{ Admin::route('siteManager.index') }}";
                        $("#tr-"+clinicid).remove();
                    });
            });
            return false;
        });

    });
</script>
@endpush