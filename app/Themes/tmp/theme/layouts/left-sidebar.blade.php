<div class="container">
	<div class="row">
		{{--<div class="col-md-3">--}}{{--{{ Widget::group('sidebar') }}--}}{{--</div>--}}
		<div class="col-md-3 col-sm-12">@yield('left-sidebar')</div>
		<div class="col-md-9 col-sm-12">@yield('content')</div>
	</div>
</div>