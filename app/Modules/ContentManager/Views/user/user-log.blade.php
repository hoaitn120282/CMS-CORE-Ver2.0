@extends('layouts.admin')

@section('content')
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Admin activities</h2>
                <div class="clearfix"></div>
            </div>
            {{--<div class="x_content">--}}
                {{--@if(count($users) > 0)--}}
                    {{--<table class="table table-striped jambo_table bulk_action">--}}
                        {{--<thead>--}}
                        {{--<tr>--}}
                            {{--<th>No.</th>--}}
                            {{--<th>Admin name</th>--}}
                            {{--<th>Time and Date</th>--}}
                            {{--<th>Latest activity</th>--}}
                        {{--</tr>--}}
                        {{--</thead>--}}
                        {{--<tbody>--}}
                        {{--<?php $i = 0; ?>--}}
                        {{--@foreach ($users as $user)--}}
                            {{--<?php $i++;?>--}}
                            {{--@if($user->meta->first()['meta_value'] != "")--}}
                                {{--<tr id="tr-{{ $user->id }}">--}}
                                    {{--<td>--}}
                                        {{--<span>{{$i}}</span>--}}
                                    {{--</td>--}}
                                    {{--<td>--}}
                                        {{--<a href="">{{ $user->name }}</a>--}}
                                    {{--</td>--}}
                                    {{--<td>--}}
                                        {{--{{$user->meta->first()['created_at'] }}--}}
                                    {{--</td>--}}
                                    {{--<td>--}}
                                        {{--{{ Admin::userLogSerial($user->meta->first()['meta_value'] ,'desc')   }}--}}
                                    {{--</td>--}}
                                {{--</tr>--}}
                            {{--@endif--}}
                        {{--@endforeach--}}
                        {{--</tbody>--}}
                    {{--</table>--}}
                    {{--{{$clinics->appends(['q' => $query])->links()}}--}}
                {{--@else--}}
                    {{--<h2>No clinic site is available. Please create new one.</h2>--}}
                {{--@endif--}}
            {{--</div>--}}
        </div>
    </div>
@endsection