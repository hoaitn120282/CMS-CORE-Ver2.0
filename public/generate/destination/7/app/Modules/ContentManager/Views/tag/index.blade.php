@extends('layouts.admin')

@section('content')
  <div class="row">
    <div class="col-md-12">
      @include('ContentManager::partials.alert')
      @include('ContentManager::tag.partials.tablemanage')
    </div>
  </div>
@endsection

@push('scripts')
@include('ContentManager::partials.scriptdelete')
@endpush