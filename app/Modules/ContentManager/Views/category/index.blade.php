@extends('layouts.admin')

@section('content')
    <div class="row">
        <div class="col-md-12">
            @include('ContentManager::partials.alert')
            @include('ContentManager::category.partials.tablemanage')
        </div>
    </div>
@endsection

@push('scripts')
@include('ContentManager::partials.scriptdelete')
@endpush